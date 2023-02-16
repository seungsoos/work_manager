package com.project.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyWorkDiaryDTO;
import com.project.portfolio.service.CompanyWorkDiaryService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/workdiaryctr")
@Log4j
public class CompanyWorkDiaryController {

	@Autowired
	CompanyWorkDiaryService service;
	
	@Autowired
	CompanyWorkDiaryDTO dto;
	
	@RequestMapping(value = "/workDiary.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String workDiary(HttpServletRequest request,
							@RequestParam("num") int num, Model model) {
		log.info("---업무공유 페이지---");
		System.out.println("num 값 : " + num);
		HttpSession session = request.getSession();
		CompanyLoginDTO dto = (CompanyLoginDTO) session.getAttribute("employeeLogin");
		String emp_department = dto.getEmp_department();
		
		int count = 0;
		int postNum = 10;
		int displayPost = (num-1)*postNum;
		
		List<CompanyWorkDiaryDTO> boardList = null;
		
		if(emp_department.equals("관리자")) {
			boardList = service.listPageAdmin(displayPost, postNum);
			count = service.boardTotalAdmin();
		}else {
			boardList = service.listPage(emp_department, displayPost, postNum);
			count = service.boardTotal(emp_department);
		}
		
		int pageNum = (int)Math.ceil((double)count/postNum);
		int pageNum_cnt = 10;
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		if(endPageNum > endPageNum_tmp) {
		 endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("boardList",boardList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("select", num);
		
		return "workDiary/workDiary";
	}
	
	@GetMapping(value = "/workDiaryWrite.do")
	public String workDiaryWrite(HttpServletRequest request) {
		log.info("---업무일지 작성 페이지---");
		
		return "workDiary/workDiaryWrite";
	}
	
	@PostMapping(value = "/workDiaryWriteSave.do")
	public String workDiarySave(HttpServletRequest request, Model model) {
		log.info("---업무일지 작성 저장---");
		HttpSession session =request.getSession();	
		
		dto.setEmp_id((String)session.getAttribute("emp_id"));
		dto.setArticleNo(service.articleNoMax());
		dto.setParentNo(1);
		dto.setDiary_title(request.getParameter("diary_title"));
		dto.setDiary_content(request.getParameter("diary_content"));
		
		service.insertBoard(dto);
		
		return "forward:/workdiaryctr/workDiary.do?num=1";
	}
	
	@RequestMapping(value = "/workDiaryView.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String workDiaryView(HttpServletRequest request, Model model) {
		log.info("---업무일지 보기---");
		int articleNo = Integer.parseInt(request.getParameter("boardList"));
		
		
		CompanyWorkDiaryDTO boardList = service.selectBoardByArticleNo(articleNo);
		System.out.println("boardList : " + boardList);
		
		HttpSession session =request.getSession();	
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("emp_id", session.getAttribute("emp_id"));
		
		return "workDiary/workDiaryView";
	}
	
	@PostMapping(value = "/workDiaryRemove.do")
	public String workDiaryRemove(HttpServletRequest request, Model model) {
		log.info("---업무일지 삭제---");
		
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		
		service.deleteBoard(articleNo);
		
		
		return"forward:/workdiaryctr/workDiary.do?num=1";
	}
	
	@PostMapping(value = "/workDiaryModify.do")
	public String workDiaryModify(HttpServletRequest request, Model model) {
		String diary_title = request.getParameter("diary_title");
		String diary_content = request.getParameter("diary_content");
		int articleNo = Integer.parseInt(request.getParameter("boardList"));
		
		dto.setArticleNo(articleNo);
		dto.setDiary_title(diary_title);
		dto.setDiary_content(diary_content);
		
		service.updateBoard(dto);
		
		
		return "forward:/workdiaryctr/workDiary.do?num=1";
	}
	
	@PostMapping(value = "/workDiaryReply.do")
	public String workDiaryReply(HttpServletRequest request, Model model) {
		log.info("---답글 달기---");
		String parentNo = request.getParameter("parentNo");
		String parentTitle = request.getParameter("parentTitle");
		System.out.println(parentNo);
		System.out.println(parentTitle);
		
		model.addAttribute("parentNo",parentNo);
		model.addAttribute("parentTitle",parentTitle);
		
		return "workDiary/workDiaryReply";
	}
	
	@PostMapping(value = "/workDiaryReplyResult.do")
	public String workDiaryReplyResult(HttpServletRequest request, Model model) {
		log.info("---답글달기 완료 ---");
		HttpSession session =request.getSession();
		
		int parentNo = Integer.parseInt(request.getParameter("parentNo"));
		String diary_title = request.getParameter("diary_title");
		String diary_content = request.getParameter("diary_content");
		String emp_id = (String)session.getAttribute("emp_id");
		
		System.out.println(parentNo);
		System.out.println(diary_title);
		System.out.println(diary_content);
		System.out.println(emp_id);
		
		dto.setEmp_id(emp_id);
		dto.setArticleNo(service.articleNoMax());
		dto.setParentNo(2);
		dto.setDiary_title(diary_title);
		dto.setDiary_content(diary_content);
		
		service.insertReply(dto);
		
		
		return "forward:/workdiaryctr/workDiary.do?num=1";
	}
}
