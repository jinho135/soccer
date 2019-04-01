package com.mywork.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mywork.domain.BoardDTO;
import com.mywork.domain.ListDTO;
import com.mywork.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardDTO> boardList(ListDTO dto) {
		// TODO Auto-generated method stub
		return mapper.boardList(dto);
	}

	@Override
	public int getTotal(ListDTO dto) {
		// TODO Auto-generated method stub
		int total = mapper.getTotal(dto);
		return total;
	}
	
	@Override
	public void boardInsert(BoardDTO board) {
		// TODO Auto-generated method stub
		mapper.boardInsert(board);
	}

	@Override
	public BoardDTO boardDetail(int seq) {
		// TODO Auto-generated method stub
		return mapper.boardDetail(seq);
	}

	@Override
	public void addReadcount(int seq) {
		// TODO Auto-generated method stub
		mapper.addReadcount(seq);
	}
	
	@Override
	public int checkPassword(int seq, String password) {
		// TODO Auto-generated method stub
		int flag = mapper.checkPassword(seq, password);
		return flag;
	}
	
	@Override
	public void boardUpdate(BoardDTO board) {
		// TODO Auto-generated method stub
		mapper.boardUpdate(board);
	}

	@Override
	public void boardDelete(int seq) {
		// TODO Auto-generated method stub
		mapper.boardDelete(seq);		
	}

	@Override
	public void stepsUpdate(BoardDTO board) {
		// TODO Auto-generated method stub
		mapper.stepsUpdate(board);
	}

	@Override
	public void boardReply(BoardDTO board) {
		// TODO Auto-generated method stub
		mapper.boardReply(board);
	}

}
