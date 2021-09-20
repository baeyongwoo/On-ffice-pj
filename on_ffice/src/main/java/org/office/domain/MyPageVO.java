/*
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  
*	오류사항 : 
*	etc...
*	
*/

package org.office.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyPageVO {

	private String uid;
	private String upw;
	private String name;
	private String profile_img;
	private String gender;
	private Date birth;
	private String email;
	private String cp;
	private int dp_code;
	private int position_code;
	
}
