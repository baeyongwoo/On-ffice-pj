/*
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  
*	오류사항 : 
*	etc...
*	09/21 user테이블 변수 추가
*	09/22 meal테이블 변수 추가	
*/

package org.office.domain;


import lombok.Data;

@Data
public class MealVO {

	private String mealno;
	private String menu1;
	private String menu2;
	private String menu3;
	private String menu4;
	private String menu5;
}