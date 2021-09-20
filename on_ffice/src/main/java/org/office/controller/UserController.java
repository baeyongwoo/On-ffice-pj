package org.office.controller;

import javax.servlet.http.HttpSession;

import org.office.domain.UserVO;
import org.office.service.MyPageService;
import org.office.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //컴포넌트스캔
@Log4j
@RequestMapping("/user/*") //이 클래스를 사용하는 메서드이 들어오는 주소 앞 /user로 명명
@AllArgsConstructor // 의존성 주입

public class UserController {

		
		@Autowired
		private UserService service;
		
		@GetMapping("/login")
		private String Gologin() {
			
			log.info("login.jsp로 이동");
			
			return "/user/login";
		}
		
		// 회원가입 폼으로 입장하기 위한 컨트롤러 
		
		@GetMapping("/register")
		private String GoRegister() {
			
			log.info("register.jsp로 이동");
			
			return "/user/register";
		}
		
		@PostMapping("/register")
		private String register(UserVO vo) {
			
			if(vo==null) {
				log.info("회원가입 실패");
				return "/user/register";
			}
			
			log.info("회원가입 시작");
			service.register(vo);
			
			return "/user/login";
			
			
		}
		
		// id 중복체크 위한 컨트롤러 시작
		
		@GetMapping("/idCheckForm")
		private String goIdCheck() {
			log.info("idCheckForm.jsp로 이동");
			
			return "/user/idCheckForm";
		}
		
		@PostMapping("/idCheckProc")
		private String idCheckFunction (String uid, Model model) {
			log.info("아이디 중복 체크 기능 실행");
			int idCheckResult = service.idCheck(uid);
			log.info("아이디 중복체크 결과값 : "+ idCheckResult);
			if(idCheckResult==0) {
				model.addAttribute("uid", uid);
				return "/user/idCheckProc";
				
			}else {
				model.addAttribute("uid", "fail");
				return "/user/idCheckProc";
			}
		}
		// email 중복체크 위한 컨트롤러 시작
		
		@GetMapping("/emailCheckForm")
		private String goEmailCheck() {
			log.info("emailCheckForm.jsp로 이동");
			
			return "/user/emailCheckForm";
		}
		
		@PostMapping("/emailCheckProc")
		private String emailCheckFunction (String email, Model model) {
			log.info("이메일 중복 체크 기능 실행");
			int emailCheckResult = service.emailCheck(email);
			log.info("이메일 중복체크 결과값 : "+ emailCheckResult);
			if(emailCheckResult==0) {
				model.addAttribute("email", email);
				return "/user/emailCheckProc";
				
			}else {
				model.addAttribute("email", "fail");
				return "/user/emailCheckProc";
			}
		}
		
	
		@PostMapping("/login")
		private String login(String uid, String upw, Model model, HttpSession session) {
			UserVO vo = service.login(uid, upw);
			log.info("login로직 접속");
			log.info("받아온 uid : " + uid);
			log.info("받아온 upw : " + upw);
			
			if(vo == null) {
				model.addAttribute("login_result", "fail");
				return "/user/login";
			} else {
				model.addAttribute("login_result", "success");
				session.setAttribute("login_session", uid);
				return "/lobby";
			}
		}
	}


