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
@RequestMapping("/notice/*") //이 클래스를 사용하는 메서드이 들어오는 주소 앞 /user로 명명
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
		
		return "redirect:/notice/noticeList";
	}
	
	@GetMapping("/write")
	public String write() {
		return "/notice/write";
	}
	
	@GetMapping("/noticeDetail")
	public String detail(int notice_num, Model model) {
		//사용자가 주소창에 
		log.info("form에서 받은 데이터 : " + notice_num);
		try {
			service.nhit_up(notice_num);
			model.addAttribute("noticeDetail", service.detail(notice_num));
		} catch (Exception e) {
			// 주소창으로 table에 없는 글 번호로 접근할 경우 오류가 뜨기 때문에 redirect시킴
			// 올바르지 않는 구문을 입력할경우 클라이언트에러는 에러페이지 구현해서 처리하기
			return "redirect:/notice/noticeList";
		}

		
		return "/notice/noticeDetail";
	}
	
	@PostMapping("/noticeDelete")
	public String delete(int notice_num, RedirectAttributes rttr) {
		service.delete(notice_num);
		rttr.addFlashAttribute("result", "success");
		rttr.addFlashAttribute("notice_num", notice_num);
		
		return "redirect:/notice/noticeList";
		
	}
	
	@PostMapping("/Update")
	public String update(NoticeVO vo, RedirectAttributes rttr) {
		log.info("폼에서 받은 vo" + vo);
		service.update(vo);
		
		return "redirect:/notice/noticeDetail?notice_num=" + vo.getNotice_num();
	}
	
	@PostMapping("/noticeUpdate")
	public String update(int notice_num, Model model) {
		NoticeVO vo = service.detail(notice_num);
		log.info("update에서 받아온 vo : " + vo);
		model.addAttribute("notice", vo);
		
		return "/notice/noticeUpdate";
	}
	
}
