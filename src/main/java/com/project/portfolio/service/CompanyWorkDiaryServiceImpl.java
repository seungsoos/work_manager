package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyWorkDiaryDAO;
import com.project.portfolio.dto.CompanyWorkDiaryDTO;

@Service
public class CompanyWorkDiaryServiceImpl implements CompanyWorkDiaryService{

	@Autowired
	CompanyWorkDiaryDAO dao;

	@Override
	public int articleNoMax() {
		return dao.articleNoMax();
	}

	@Override
	public void insertBoard(CompanyWorkDiaryDTO dto) {
		dao.insertBoard(dto);
	}

	@Override
	public void updateBoard(CompanyWorkDiaryDTO dto) {
		dao.updateBoard(dto);
	}

	@Override
	public void deleteBoard(int articleNo) {
		dao.deleteBoard(articleNo);
	}

	@Override
	public CompanyWorkDiaryDTO selectBoardByArticleNo(int articleNo) {
		return dao.selectBoardByArticleNo(articleNo);
	}

	@Override
	public void insertReply(CompanyWorkDiaryDTO dto) {
		dao.insertReply(dto);
	}

	@Override
	public int boardTotal(String emp_department) {
		return dao.boardTotal(emp_department);
	}

	@Override
	public List<CompanyWorkDiaryDTO> listPage(String emp_department,
										int displayPost, int postNum) {
		return dao.listPage(emp_department,displayPost, postNum);
	}

	@Override
	public List<CompanyWorkDiaryDTO> listPageAdmin(int displayPost, int postNum) {
		return dao.listPageAdmin(displayPost, postNum);
	}
	//관리자 계정 접속시 게시물 총 개수 확인
	@Override
	public int boardTotalAdmin() {
		return dao.boardTotalAdmin();
	}


	

	

}
