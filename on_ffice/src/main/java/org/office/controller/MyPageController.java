/*
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  9/21 main페이지 테스트 성공
*	오류사항 : 
*	etc...
*	
*/
package org.office.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.office.domain.MenuVO;
import org.office.domain.TodoVO;
import org.office.domain.UserVO;
import org.office.service.MyPageService;
import org.office.service.UserService;
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
@RequestMapping("/mypage/*") // 이 클래스를 사용하는 메서드이 들어오는 주소 앞 /mypage로 명명
@AllArgsConstructor // 의존성 주입
public class MyPageController {

	@Autowired
	private MyPageService service;
	private UserService user_service;

	@GetMapping("/main")
	public void getInfo(Model model, HttpServletRequest request) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyyMMdd");
		HttpSession session = request.getSession();
		UserVO login_session =  (UserVO) session.getAttribute("login_session");
		String login_time = formatter.format(session.getCreationTime()); //특정 세션만 골라서 출력하는법 찾아보기.
		 
		log.info("유저 메인페이지 접속");
		log.info("받아온 세션 : " + login_session);
		UserVO uservo = service.getInfo(login_session.getUid()); //테스트를 위해 test1삽입 추후 세션으로 변경
		log.info("받아온 정보 : " + uservo);
		List<TodoVO> todoList = service.getTodoList(login_session.getEmpno());
		log.info("받아온 할일 : " +todoList);
		List<UserVO> userList = user_service.allUserInfo();
		log.info("전체유저리스트 :" + userList);
		
		
		model.addAttribute("info", uservo);
		model.addAttribute("login_time", login_time);
		model.addAttribute("todoList",todoList);
		model.addAttribute("users", userList);
		}
	
	@PostMapping("/insertTodo")
	public String insertTodo
	(TodoVO vo, HttpServletRequest request, RedirectAttributes rttr, Model model) {
		service.insertTodo(vo);
		log.info(vo);
		return "redirect:/mypage/main";
	}
	
	@PostMapping("/passTodo")
	public String passTodo
	(TodoVO vo, HttpServletRequest request, RedirectAttributes rttr, Model model) {
		service.passTodo(vo);
		log.info(vo);
		return "redirect:/mypage/main";
	}
	
	@PostMapping("/completeTodo")
	public String completeTodo
	(TodoVO vo, HttpServletRequest request, RedirectAttributes rttr, Model model) {
		service.statTodo(vo);
		log.info(vo);
		return "redirect:/mypage/main";
	}
	
	@GetMapping("/detailTodo")
	public TodoVO getTodo (TodoVO vo, HttpServletRequest request, Model model) {
		vo = service.getTodo(vo.getTodo_num());
		model.addAttribute("getTodo", vo);
		return vo;
	
	}
	
}
