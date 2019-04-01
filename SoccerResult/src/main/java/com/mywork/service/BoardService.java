package com.mywork.service;

import java.util.List;

import com.mywork.domain.BoardDTO;
import com.mywork.domain.ListDTO;

public interface BoardService {
	
	public List<BoardDTO> boardList(ListDTO dto);
	
	public int getTotal(ListDTO dto);
	
	public void boardInsert(BoardDTO board);

	public BoardDTO boardDetail(int seq);

	public void boardUpdate(BoardDTO board);

	public void boardDelete(int seq);

	public void addReadcount(int seq);

	public int checkPassword(int seq, String password);

	public void stepsUpdate(BoardDTO board);

	public void boardReply(BoardDTO board);
	
}
