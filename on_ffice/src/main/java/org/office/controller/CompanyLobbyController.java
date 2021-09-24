package org.office.controller;


import javax.servlet.http.HttpSession;

import org.office.domain.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // 컴포넌트스캔
@RequestMapping("/company/*")
@AllArgsConstructor // 의존성 주입
@Log4j
public class CompanyLobbyController {
	

	@GetMapping("/lobby")
	public String showlobby(Model model, HttpSession session) {
		
		UserVO vo = new UserVO();
		vo = (UserVO)session.getAttribute("login_session");
		model.addAttribute("login_session", vo);
		return "/company/lobby";
	}
	
	@GetMapping("/intro")
	public String showCI() {
		
		return "/company/intro";
	}
	
	@GetMapping("/dp")
	public String showdp(int dp_code) {
		
		return "/commpany/dp?dp_code=" + dp_code;
	}
}
