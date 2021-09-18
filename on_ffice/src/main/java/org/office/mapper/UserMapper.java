// 신우람 0918 작업
package org.office.mapper;

import org.office.domain.UserVO;

public interface UserMapper {
	
// 회원가입 매퍼
	public void insert(UserVO vo);

// 로그인 매퍼
	public UserVO select(String uid, String upw);
}

