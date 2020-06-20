package com.mega.sinchon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<BbsDTO> list(BbsDTO dto) {
		List<BbsDTO> list = my.selectList("bbs.list",dto);
		return list;
	}
	public int count(BbsDTO dto) {
		int count = my.selectOne("bbs.listcount",dto);
		return count;
	}
	public void insert(BbsDTO dto) {
		my.insert("bbs.insert",dto);
	}
	public void delete(BbsDTO dto) {
		my.delete("bbs.delete",dto);
	}
	public void update(BbsDTO dto) {
		my.update("bbs.update",dto);
	}
}
