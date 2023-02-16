package com.project.portfolio.service;

import java.util.List;

import com.project.portfolio.dto.CompanyWorkDiaryDTO;

public interface CompanyWorkDiaryService {

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
    public int boardTotal(String emp_department);
    
    //게시물 리미트 조회
    public List<CompanyWorkDiaryDTO> listPage(String emp_department,
    										int displayPost, int postNum);
   
    //관리자 계정 접속시 게시물 리미트 조회
    public List<CompanyWorkDiaryDTO> listPageAdmin(int displayPost,
													int postNum);

    //관리자 계정 접속시 게시물 총 개수 확인
    public int boardTotalAdmin();

}
