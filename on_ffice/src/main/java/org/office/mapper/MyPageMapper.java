/*
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  
*	오류사항 : 
*	etc...
*	
*/

package org.office.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.office.domain.MyPageVO;
import org.office.service.MyPageService;

@Mapper
public interface MyPageMapper {

	public MyPageVO getInfo(String uid); 
}
