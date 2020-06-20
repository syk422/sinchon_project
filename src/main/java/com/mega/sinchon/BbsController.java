package com.mega.sinchon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbsController {

	@Autowired
	BbsDAO dao;
	
	@RequestMapping("list.do")
	public void select(BbsDTO bbsDTO, Model model) {
		List<BbsDTO> list = dao.list(bbsDTO);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("content.do")
	public void insert(BbsDTO bbsDTO, Model model) {
		dao.insert(bbsDTO);
	}
	@RequestMapping("delete.do")
	public void delete(BbsDTO bbsDTO) {
		dao.delete(bbsDTO);
	}
	@RequestMapping("update.do")
	public void update(BbsDTO bbsDTO) {
		dao.update(bbsDTO);
	}
}
