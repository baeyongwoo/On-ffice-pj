/*
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  
*	오류사항 : 
*	etc...
*	
*	9/21 getinfo성공 
*/
package org.office.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.office.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
@WebAppConfiguration
public class MyPageControllerTests {
	
	@Autowired
	private WebApplicationContext ctx; // MockMvc를 만들기 위한 객체
	
	private MockMvc mockMvc;
	
	@Before //org.junit의 test이전 실행 내용입력 어노테이션
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testgetInfo() throws Exception{
		String resultPage = mockMvc
							.perform(MockMvcRequestBuilders.post("/mypage/main").param("uid","test1"))
							.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
}
