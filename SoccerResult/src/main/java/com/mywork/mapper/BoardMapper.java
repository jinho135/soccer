package com.mywork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mywork.domain.BoardDTO;
import com.mywork.domain.ListDTO;

public interface BoardMapper {

	public List<BoardDTO> boardList(ListDTO dto);

	public int getTotal(ListDTO dto);

	public void boardInsert(BoardDTO board);

	public BoardDTO boardDetail(int seq);

	public void addReadcount(int seq);

	public int checkPassword(@Param("seq") int seq, @Param("password") String password);

	public void boardDelete(int seq);

	public void boardUpdate(BoardDTO board);

	public void stepsUpdate(BoardDTO board);

	public void boardReply(BoardDTO board);
}
