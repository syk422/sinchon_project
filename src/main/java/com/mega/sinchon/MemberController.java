package com.mega.sinchon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Autowired
	MemberDAO dao;
	
	// 회원탈퇴 전 비밀번호 확인
	@RequestMapping("pwCheck.do")
	public String pwCheck(MemberDTO memberDTO) {
		MemberDTO dto = dao.login(memberDTO);
		String page = "";
		if(dto == null) { // 비밀번호 불일치
			page = "fail";
		} else { // 비밀번호 일치
			dao.delete(memberDTO);
			page = "ok";
		}
		return page;
	}
	
	// 수정 후 저장
	@RequestMapping("updateSave.do")
	public String updateSave(MemberDTO memberDTO, Model model) {
		int result = dao.update(memberDTO);
		String page = "";
		if(result == 0) { // 업데이트 실패
			page = "fail";
		} else { // 업데이트 성공
			page = "ok";
		}
		return page;
	}
	
	// 마이페이지 -> 회원정보 수정 전 조회
	@RequestMapping("memberUpdate.do")
	public void update(MemberDTO memberDTO, Model model) {
		MemberDTO dto = dao.select(memberDTO);
		model.addAttribute("dto", dto);
	}
	
	// 마이페이지 -> 회원정보 조회
	@RequestMapping("memberSelect.do")
	public void select(MemberDTO memberDTO, Model model) {
		MemberDTO dto = dao.select(memberDTO);
		model.addAttribute("dto", dto);
	}
	
	// ID 중복확인
	@RequestMapping("idCheck.do")
	public String idCheck(MemberDTO memberDTO) {
		MemberDTO dto = dao.idCheck(memberDTO);
		String page = "";
		if(dto != null) { // id 중복 -> 사용불가
			page = "fail";
		} else { // id 사용가능
			page = "ok";
		}
		return page;
	}
	
	// 로그인 체크: id,pw 기준으로 검색, 일치하는 결과 있으면 이름 받아오기
	@RequestMapping("login.do")
	public String login(MemberDTO memberDTO, HttpSession session) {
		MemberDTO dto = dao.login(memberDTO);
		String page = "";
		if(dto == null) { // 로그인 실패
			page = "fail";
		} else { // 로그인 성공
			page = "ok";
			session.setAttribute("loginID", dto.getId()); // id 세션 설정
		}
		return page;
	}
	
	// 회원가입
	@RequestMapping("join.do")
	public void insert(MemberDTO memberDTO) {
		dao.insert(memberDTO);
	} 
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		String page ="";
		session.removeAttribute("loginID");
		page="redirect:storeSelect.jsp";
		return page;
	} 
}
