package com.mega.sinchon;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@Autowired
	QnaDAO dao;
	
	@Autowired
	ReplyDAO dao2;

	@RequestMapping("qnaInsert.do")
	public String insert(QnaDTO qnaDTO) {
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String today = dateForm.format(time.getTime());
		qnaDTO.setDate(today);
		int result = dao.insert(qnaDTO);
		
		String page = "";
		if(result == 1) { // 추가 성공
			page = "ok";
		} else { // 추가 실패
			page = "fail";
		}
		return page;
	}

	@RequestMapping("qnaList.do")
	public void list(QnaDTO qnaDTO, ReplyDTO replyDTO, Model model) {
		List<QnaDTO> list3 = dao.list(qnaDTO);
		model.addAttribute("list3", list3);
		
		List<ReplyDTO> list2 = dao2.list(replyDTO);
		model.addAttribute("list2", list2);
	}
}