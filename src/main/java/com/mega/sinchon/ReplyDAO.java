package com.mega.sinchon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// 전체 검색
	public List<ReplyDTO> list(ReplyDTO dto) {
		List<ReplyDTO> list = my.selectList("reply.list", dto);
		return list;
	}
	
	// 답변 입력
	public int insert(ReplyDTO dto) {
		int result = my.insert("reply.insert", dto);
		return result;
	}
}
