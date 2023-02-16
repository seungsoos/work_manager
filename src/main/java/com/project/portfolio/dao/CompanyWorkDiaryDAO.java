package com.project.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyWorkDiaryDTO;

@Service
public interface CompanyWorkDiaryDAO {

    //articleNo 최고값 구하기
    public int articleNoMax();
    
    // 게시물 등록
    public void insertBoard(CompanyWorkDiaryDTO dto);
    
    // 게시물 수정
    public void updateBoard(CompanyWorkDiaryDTO dto);
    
    // 게시물 삭제
    public void deleteBoard(int articleNo);
 
    // 게시물 보기
    public CompanyWorkDiaryDTO selectBoardByArticleNo(int articleNo);
    
    // 댓글 달기
    public void insertReply(CompanyWorkDiaryDTO dto);
    
    //게시물 총 개수 확인
    public int boardTotal(@Param("emp_department") String emp_department);
    
    //게시물 리미트 조회
    public List<CompanyWorkDiaryDTO> listPage(@Param("emp_department") String emp_department,
    										@Param("displayPost")int displayPost,
    										@Param("postNum") int postNum);
    
    //관리자 계정 접속시 게시물 리미트 조회
    public List<CompanyWorkDiaryDTO> listPageAdmin(@Param("displayPost")int displayPost,
												@Param("postNum") int postNum);
    
    //관리자 계정 접속시 게시물 총 개수 확인
    public int boardTotalAdmin();
}
