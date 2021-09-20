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
}
