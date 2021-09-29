package org.office.controller;


import javax.servlet.http.HttpSession;

import org.office.domain.UserVO;
import org.office.service.DepartService;
import org.office.service.DpCommunityService;
import org.office.service.MenuService;
import org.office.service.NoticeService;
import org.office.service.RiceService;
import org.office.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	UserService us;
	
	@Autowired
	DpCommunityService dcs;
	
	@Autowired
	DepartService ds;
	
	@Autowired
	NoticeService ns;
	
	@Autowired
	RiceService rs;
	
	@Autowired
	MenuService ms;

	@GetMapping("/lobby")
	public String showlobby(Model model, HttpSession session) {
		
		log.info("로비컨트롤러실행");
		UserVO vo = new UserVO();
		vo = (UserVO)session.getAttribute("login_session");
		model.addAttribute("login_session", vo);
		
		log.info("notice 정보 : " + ns.lobbyNList());
		model.addAttribute("nslist", ns.lobbyNList());
		
		log.info("rice 정보 : " + rs.selectRice());
		model.addAttribute("rice", rs.selectRice());
		
		return "/company/lobby";
	}
	
	@GetMapping("/intro")
	public String showCI() {
		
		return "/company/intro";
	}
	
	@GetMapping("/dplobby")
	public String showdp(String dp_code, Model model) {
		int dp_codeCI = Integer.parseInt(dp_code);
		
		log.info("폼에서 받은 dp_code : " + dp_code);
		
		model.addAttribute("dpu_list", us.allUserInfoByDp(dp_codeCI));
		
		model.addAttribute("dpc_list", dcs.list(""));	//dpc 부서 커뮤니티
		
		model.addAttribute("dpinfo", ds.getDpInfo(dp_codeCI));
		
		log.info("부서 게시판 : " + dcs.list(""));
		return "/company/dplobby";
	}
	
	@GetMapping("/dpc")
	public String movedpc() {
		dcs.list("");
		
		return "/dpcommunity/dpclist";
	}
	
	@GetMapping("/userInfo")
	public String getInfo(Model model, HttpSession session){
		if(session.getAttribute("login_session") == null) {
			log.info("로그인세션이 없음");
			//model.addAttribute("l_s", "fail");
			//return "/company/users";
			return "/user/logintry_req";
		}
		model.addAttribute("usersInfo", us.allUserInfo());
		log.info("유저리스트 : " + us.allUserInfo());
		
		return "/company/users";
	}
	
	@GetMapping("/menu")
	public String getMenu(Model model) {
		log.info("메뉴" + ms.menuList());
		model.addAttribute("menu", ms.menuList());
		
		return "/company/menu";
	}
	
}
