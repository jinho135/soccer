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
		logger.info("�Խ��� �۾��� �̵�");
		return "/pages/boards/Writeform";
	}

	@PostMapping("/boardWrite")
	public String boardInsert(BoardDTO board) {
		logger.info("�Խ��� �۾��� ����");
		// �ԷµǴ� ���๮�� ó��
		board.setContent(board.getContent().replaceAll("\r\n", "<br>"));
		service.boardInsert(board);
		return "redirect:/board";
	}

	@GetMapping("/detail")
	public String boardDetail(Model model, int seq) {
		logger.info("�Խ��� �ۺ��� ����");
		BoardDTO dto = service.boardDetail(seq);
		service.addReadcount(seq);
		model.addAttribute("dto", dto);
		return "/pages/boards/Detailform";
	}

	@RequestMapping("passcheck")
	@ResponseBody
	public String update(Model model, int seq, String password) {
		logger.info("�Խ��� �� ��й�ȣ üũ");
		int flag = service.checkPassword(seq, password);
		return flag + "";
	}

	@GetMapping("/delete")
	public String boardDelete(int seq) {
		logger.info("�Խ��� �ۻ��� ����");
		service.boardDelete(seq);
		return "redirect:/board";
	}

	@GetMapping("/Updateform")
	public String Updateform(Model model, int seq) {
		logger.info("�Խ��� �ۼ��� �̵�");
		BoardDTO board = service.boardDetail(seq);
		// ��µǴ� ���๮�� ó��
		board.setContent(board.getContent().replaceAll("<br>", "\r\n"));
		model.addAttribute("dto", board);
		return "/pages/boards/Updateform";
	}

	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardDTO board, int seq) {
		logger.info("�Խ��� �ۼ��� ����");
		// �ԷµǴ� ���๮�� ó��
		board.setContent(board.getContent().replaceAll("\r\n", "<br>"));
		service.boardUpdate(board);
		return "redirect:/detail?seq=" + seq;
	}

	@GetMapping("/Replyform")
	public String Replyform(Model model, int groups, int levels, int steps) {
		logger.info("�Խ��� ��۾��� �̵�");
		model.addAttribute("groups", groups);
		model.addAttribute("levels", levels);
		model.addAttribute("steps", steps);
		return "/pages/boards/Replyform";
	}

	@PostMapping("/boardReply")
	public String boardReply(BoardDTO board) {
		logger.info("�Խ��� ��۾��� ����");
		// �ԷµǴ� ���๮�� ó��
		board.setContent(board.getContent().replaceAll("\r\n", "<br>"));
		service.stepsUpdate(board);
		service.boardReply(board);
		return "redirect:/board";
	}
}
