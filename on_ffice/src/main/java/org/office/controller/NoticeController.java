package org.office.controller;

import java.util.List;

import org.office.domain.NoticeVO;
import org.office.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //컴포넌트스캔
@Log4j
@RequestMapping("/community/*") //이 클래스를 사용하는 메서드이 들어오는 주소 앞 /user로 명명
@AllArgsConstructor // 의존성 주입

public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@GetMapping("/noticeList")
	public void noticeList(Model model) {
			
		log.info("게시글 로직 접속");
		List<NoticeVO> noticeList = service.list();
		model.addAttribute("noticeList",noticeList);
	}
	
	@PostMapping("/write")
	public String write(NoticeVO vo, RedirectAttributes rttr) {
		
		service.write(vo);
		log.info(vo);
		
		rttr.addFlashAttribute("notice_num", vo.getNotice_num());
		
		return "redirect:/community/noticeList";
	}
	
	@GetMapping("/write")
	public String write() {
		return "/community/write";
	}
}