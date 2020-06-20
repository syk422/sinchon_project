package com.mega.sinchon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QnaDAO {

	@Autowired
	SqlSessionTemplate my;
	
	// 문의사항 입력
	public int insert(QnaDTO dto) {
		int result = my.insert("qna.insert", dto);
		System.out.println(dto);
		return result;
	}
	
	// 전체 검색
	public List<QnaDTO> list(QnaDTO dto) {
		List<QnaDTO> list = my.selectList("qna.list", dto);
		return list;
	}
}
