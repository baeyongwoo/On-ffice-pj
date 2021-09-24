/*
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  
*	오류사항 : 
*	etc...
*	
*	9/21 getInfo작성 
*/

package org.office.service;

import java.util.List;

import org.office.domain.MealVO;
import org.office.domain.TodoVO;
import org.office.domain.UserVO;
import org.office.mapper.MyPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public UserVO getInfo(String uid) {
		log.info("유저 정보 조회");
		UserVO vo = mapper.getInfo(uid);
		return vo;
	}
	
	@Override
	public MealVO getMeal(String dailymeal) {
		log.info("오늘의 식단 조회");
		MealVO vo = mapper.getMeal(dailymeal);
		return vo;
	}
	
	@Override
	public List<TodoVO> getTodo (int empno){
		log.info("TODO 리스트 생성");
		List<TodoVO> vo = mapper.getTodo(empno);
		return vo;
	}
	
	@Override
	public void insertTodo(TodoVO vo) {
		log.info("해야할일 지시");
		mapper.insertTodo(vo);
	}
	

}
