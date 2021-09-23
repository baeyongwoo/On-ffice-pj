package org.office.controller;

import java.util.List;

import org.office.domain.CommunityVO;
import org.office.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // 컴포넌트스캔
@Log4j
@RequestMapping("/community/*") // 이 클래스를 사용하는 메서드이 들어오는 주소 앞 /user로 명명
@AllArgsConstructor // 의존성 주입

public class CommunityController {

	@Autowired
	private CommunityService cs;

	@GetMapping("/CMList")
	public void csList(Model model) {

		log.info("게시글 로직 접속");
		List<CommunityVO> communityList = cs.list();
		model.addAttribute("cmList", communityList);
	}

	@PostMapping("/write")
	public String write(CommunityVO vo, RedirectAttributes rttr) {

		cs.write(vo);
		log.info(vo);

		rttr.addFlashAttribute("community_num", vo.getCommunity_num());

		return "redirect:/community/CMList";
	}

	@GetMapping("/write")
	public String write() {
		return "/community/CMwrite";
	}

	@GetMapping("/CMDetail")
	public String detail(int community_num, Model model) {
		// 사용자가 주소창에
		log.info("form에서 받은 데이터 : " + community_num);
		try {
			cs.chit_up(community_num);
			model.addAttribute("csDetail", cs.detail(community_num));
		} catch (Exception e) {
			// 주소창으로 table에 없는 글 번호로 접근할 경우 오류가 뜨기 때문에 redirect시킴
			// 올바르지 않는 구문을 입력할경우 클라이언트에러는 에러페이지 구현해서 처리하기
			return "redirect:/community/CMList";
		}

		return "/community/CMDetail";
	}

	@PostMapping("/CM_dcf")
	public String delete(int community_num, String cpw, String cpwck, RedirectAttributes rttr) {
		log.info("delete 눌렀을 때 글 번호 : " + community_num);
		log.info("delete 눌렀을 때 글 번호 : " + cpw);	//db에 저장된 값
		log.info("delete 눌렀을 때 글 번호 : " + cpwck);	// 사용자가 입력한 값
		

		if (cpw.equals(cpwck)) {
			log.info("비밀번호 일치");
			log.info("글번호 : " + community_num);
			cs.delete(community_num);
			rttr.addFlashAttribute("result", "success");
		} else {
			log.info("비밀번호 불일치");
			rttr.addFlashAttribute("result", "fail");
		}

		return "redirect:/community/CMList";

	}

	// 삭제 폼으로 보내기
	@PostMapping("/deleteCheck")
	public String deleteCheck(int community_num, Model model) {
		CommunityVO vo = cs.detail(community_num);
		log.info("delete에서 받아온 vo" + vo);
		model.addAttribute("community", vo);
		return "/community/CM_dcf";
	}

	@PostMapping("/Update")
	public String update(CommunityVO vo, RedirectAttributes rttr) {
		log.info("폼에서 받은 vo" + vo);
		cs.update(vo);

		return "redirect:/community/CMDetail?community_num=" + vo.getCommunity_num();
	}

	@PostMapping("/CMUpdate")
	public String update(int community_num, Model model) {
		CommunityVO vo = cs.detail(community_num);
		log.info("update에서 받아온 vo : " + vo);
		model.addAttribute("cm", vo);

		return "/community/CMUpdate";
	}

}
