package com.mega.sinchon;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StoreDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public StoreDTO select(StoreDTO dto) {
		StoreDTO dto2 = my.selectOne("store.select",dto);
		return dto2;
	}
}
