package com.mega.sinchon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@Autowired
	StoreDAO dao;
	
	@RequestMapping("select.do")
	public void select(StoreDTO storeDTO, Model model, HttpSession session) {
		StoreDTO dto = dao.select(storeDTO);
		model.addAttribute("dto",dto);
		session.setAttribute("storeNumber", storeDTO.getNum());
		
	}
}
