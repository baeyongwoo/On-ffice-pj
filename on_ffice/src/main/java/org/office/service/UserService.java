// 신우람 0918 작업
package org.office.service;

import org.office.domain.UserVO;

public interface UserService {

	// 회원 가입 서비스
	public void register(UserVO vo);
	
	// 로그인 서비스
	public UserVO login(String uid, String upw);
	
	// id중복검사 서비스
	public int idCheck(String uid);
	
	// id중복검사 서비스
	public int emailCheck(String email);
	
	// 유저 정보 조회 서비스
	public UserVO userInfo(String uid);
	
	// 유저 정보 수정 서비스
	public void userModify(UserVO vo);
	
	// 회원 탈퇴 서비스
	public void userDelete(String uid);
	
}
