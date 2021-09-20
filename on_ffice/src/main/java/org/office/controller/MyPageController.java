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

import org.office.domain.MyPageVO;
import org.office.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//@Controller //컴포넌트스캔
//@Log4j
//@RequestMapping("/mypage/*") //이 클래스를 사용하는 메서드이 들어오는 주소 앞 /mypage로 명명
//@AllArgsConstructor // 의존성 주입
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@PostMapping("/main")
	public void getInfo(String uid, Model model) {
		log.info("유저 메인페이지 접속");
		MyPageVO vo = service.getInfo(uid);
		model.addAttribute("info", vo);
	}
	

}
