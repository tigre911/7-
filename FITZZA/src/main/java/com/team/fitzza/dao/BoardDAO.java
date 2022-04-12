package com.team.fitzza.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.fitzza.vo.BoardVO;

@Mapper
@Repository
public interface BoardDAO {
	//글등록
	public int BoardInsert(BoardVO vo);
	//파일 업로드 
	public int BoardFileInsert(BoardVO vo);
	//글1개 선택
	public BoardVO boardSelect(int board_num);

	public int boardNum(String user_id);
	//글수정
	public int BoardUpdate(BoardVO vo);
	public int BoardFileUpdate(BoardVO vo);
	//파일명 선택
	public BoardVO getFileName(int board_num);
	//글삭제
	public int boardDelete(int board_num, String user_id);
	//조회수 증가
    public void hitCount(int board_num);
    //글 신고
    public int reportInsert(BoardVO vo);
    // 신고 누적
 	public int reportUp(BoardVO vo);
 	
 	public int getType_num(int type_num);
 	//마이페이지 글목록
 	public List<BoardVO> todayWriterSelect(String user_id);
	public List<BoardVO> recommendWriterSelect(String user_id);
	public List<BoardVO> oldWriterSelect(String user_id);
	public List<BoardVO> reviewWriterSelect(String user_id);
	public List<BoardVO> qnaWriterSelect(String user_id);
	public List<BoardVO> voteWriterSelect(String user_id);
 	
}