package com.mywork.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mywork.domain.BoardDTO;
import com.mywork.service.BoardService;

@Controller
@RequestMapping("/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private BoardService service;

	@GetMapping("/Writeform")
	public String boardInsert() {
		logger.info("게시판 글쓰기 이동");
		return "/pages/boards/Writeform";
	}

	@PostMapping("/boardWrite")
	public String boardInsert(BoardDTO board) {
		logger.info("게시판 글쓰기 실행");
		// 입력되는 개행문자 처리
		board.setContent(board.getContent().replaceAll("\r\n", "<br>"));
		service.boardInsert(board);
		return "redirect:/board";
	}

	@GetMapping("/detail")
	public String boardDetail(Model model, int seq) {
		logger.info("게시판 글보기 실행");
		BoardDTO dto = service.boardDetail(seq);
		service.addReadcount(seq);
		model.addAttribute("dto", dto);
		return "/pages/boards/Detailform";
	}

	@RequestMapping("passcheck")
	@ResponseBody
	public String update(Model model, int seq, String password) {
		logger.info("게시판 글 비밀번호 체크");
		int flag = service.checkPassword(seq, password);
		return flag + "";
	}

	@GetMapping("/delete")
	public String boardDelete(int seq) {
		logger.info("게시판 글삭제 실행");
		service.boardDelete(seq);
		return "redirect:/board";
	}

	@GetMapping("/Updateform")
	public String Updateform(Model model, int seq) {
		logger.info("게시판 글수정 이동");
		BoardDTO board = service.boardDetail(seq);
		// 출력되는 개행문자 처리
		board.setContent(board.getContent().replaceAll("<br>", "\r\n"));
		model.addAttribute("dto", board);
		return "/pages/boards/Updateform";
	}

	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardDTO board, int seq) {
		logger.info("게시판 글수정 실행");
		// 입력되는 개행문자 처리
		board.setContent(board.getContent().replaceAll("\r\n", "<br>"));
		service.boardUpdate(board);
		return "redirect:/detail?seq=" + seq;
	}

	@GetMapping("/Replyform")
	public String Replyform(Model model, int groups, int levels, int steps) {
		logger.info("게시판 답글쓰기 이동");
		model.addAttribute("groups", groups);
		model.addAttribute("levels", levels);
		model.addAttribute("steps", steps);
		return "/pages/boards/Replyform";
	}

	@PostMapping("/boardReply")
	public String boardReply(BoardDTO board) {
		logger.info("게시판 답글쓰기 실행");
		// 입력되는 개행문자 처리
		board.setContent(board.getContent().replaceAll("\r\n", "<br>"));
		service.stepsUpdate(board);
		service.boardReply(board);
		return "redirect:/board";
	}
}
