package com.mega.sinchon;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// 마이페이지 -> 회원 탈퇴
	public void delete(MemberDTO dto) {
		my.delete("member.delete", dto);
	}
	
	// 마이페이지 -> 회원정보 수정
	public int update(MemberDTO dto) {
		int result = my.update("member.update", dto);
		return result;
	}
	
	// 마이페이지 -> 회원정보 조회
	public MemberDTO select(MemberDTO dto) {
		MemberDTO dto2 = my.selectOne("member.selectOne", dto);
		return dto2;
	}
	
	// id 중복체크: id 반환
	public MemberDTO idCheck(MemberDTO dto) {
		MemberDTO dto2 = my.selectOne("member.idCheck", dto);
		return dto2;
	}
	
	// 로그인 체크: id, pw 조건으로 검색 후 일치하는 결과 있으면 id 받아오기
	public MemberDTO login(MemberDTO dto) {
		MemberDTO dto2 = my.selectOne("member.login", dto);
		return dto2;
	}
	
	// 회원가입
	public void insert(MemberDTO dto) {
		my.insert("member.insert", dto);
	}
}