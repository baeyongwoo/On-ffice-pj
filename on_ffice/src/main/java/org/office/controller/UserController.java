package org.office.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.office.domain.UserVO;
import org.office.service.DepartService;
import org.office.service.MyPageService;
import org.office.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //컴포넌트스캔
@Log4j
@RequestMapping("/user/*") //이 클래스를 사용하는 메서드이 들어오는 주소 앞 /user로 명명
@AllArgsConstructor // 의존성 주입

public class UserController {

		
		@Autowired
		private UserService service;
		
		@Autowired
		private DepartService ds;
		
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
		private String register(UserVO vo, Model model) {
			
			if(vo==null) {
				log.info("회원가입 실패");
				return "/user/register";
			}
			log.info("회원가입 시작");
			service.register(vo);
			log.info("회원가입할때 부서번호 : " + vo.getDp_code());
			ds.UpCount(vo.getDp_code());
			model.addAttribute("register_result", "success");
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
		private String login(String uid, String upw, Model model, HttpSession session, RedirectAttributes rttr) {
			UserVO vo = service.login(uid, upw);
			log.info("login로직 접속");
			log.info("받아온 uid : " + uid);
			log.info("받아온 upw : " + upw);
			
			
		
			if(vo == null) {
				model.addAttribute("login_result", "fail");
				return "/user/login";
			} else {
				
				rttr.addFlashAttribute("login_result", "success");
	
				session.setAttribute("login_session", vo);
				session.setMaxInactiveInterval(60*10);
				log.info("로그인 세션 정보" + session.getAttribute("login_session"));
				
				return "redirect:/company/lobby";	//임시로 noticelist로 가게함
			}
		}
		
		@GetMapping("/logout")
		private String login(HttpSession session) {
			
			Object object = session.getAttribute("login_session");
			if(object == null) {
				UserVO user = (UserVO) object;
				session.removeAttribute("login_session");
				log.info("로그아웃 컨트롤러 실행");
				return "/user/logout";
			}
			session.invalidate();
			return "/user/login";
		}
		
		@PostMapping("/userInfo")
		private String userInfo(String uid, Model model) {
			log.info("유저 정보 조회 시작");
			UserVO vo = service.userInfo(uid);
			model.addAttribute("userInfo", vo);
			return "/user/userInfo";
		}
		
		@GetMapping("/userInfo")
		private String goUserInfo(String uid) {
			log.info("유저 정보 페이지로 이동");
			return "/user/userInfo";
		}
		
		@PostMapping("/userModify")
		private String userModify(UserVO vo, Model model) {
			log.info("유저 정보 수정 시작");
			service.userModify(vo);
			model.addAttribute("userInfo", vo);
			model.addAttribute("modify_result", "success");
			return "/user/userInfo";
		}
		
		@PostMapping("/goUserModify")
		private String goUserModify(@Param("uid")String uid, Model model) {
			model.addAttribute("userInfo", service.userInfo(uid));
			log.info("유저 정보 수정창 이동");
			return "/user/userModify";
		}
		
		
		@PostMapping("/deleteCheck")
		private String deleteCheck(String uid, String upw, Model model) {
			log.info("탈퇴를 위한 비밀번호 확인 시작");
			// 로그인 로직과 동일하므로, 로그인 서비스 재사용
			UserVO vo = service.login(uid, upw);
			
			if(vo==null) {
				log.info("비밀번호가 틀려서 회원탈퇴 실패");
				model.addAttribute("delete_result", "fail");
				return "/user/userInfo";
			}else {
				log.info("비밀번호 일치하여 회원탈퇴 진행");
				service.userDelete(uid);
				model.addAttribute("delete_result", "success");
				return "/user/deleteCheckForm";
				
			}
		}
		@GetMapping("/deleteCheckForm")
		private String deleteCheckForm() {
			log.info("비밀번호 재확인 페이지 진입");
			return "/user/deleteCheckForm";
		}
	}


