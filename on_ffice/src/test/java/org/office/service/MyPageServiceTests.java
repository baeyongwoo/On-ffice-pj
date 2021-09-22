/*
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  
*	오류사항 : 
*	etc...
*	
*    9/21 서비스 테스트 성공
*/
package org.office.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.office.domain.TodoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyPageServiceTests {
	
	@Autowired
	private MyPageService service;
	
	//@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	//@Test
	public void testgetInfo() {	
		log.info(service.getInfo("test1"));;
		
	}
	
	//@Test
	public void testgetTodo() {
		log.info(service.getTodo("test1"));
		
	}
	
	@Test
	public void testInsertTodo() {
		TodoVO vo = new TodoVO();
		vo.setChecker("test3");
		vo.setWorker("test1");
		vo.setComplete("no");
		vo.setTodo_content("테스트폼");
		service.insertTodo(vo);
		log.info(vo);
			}
	

}
