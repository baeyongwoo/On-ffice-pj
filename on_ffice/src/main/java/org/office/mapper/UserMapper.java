// 신우람 0918 작업
package org.office.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.office.domain.UserVO;

@Mapper
public interface UserMapper {
	
// 회원가입 매퍼
	public void insert(UserVO vo);

// 로그인 매퍼
	public UserVO select(@Param("uid") String uid, @Param("upw") String upw);
	
// 아이디 중복체크 매퍼
	public int selectIdCount(@Param("uid") String uid);
	
// 이메일 중복체크 매퍼
	public int selectEmailCount(@Param("email")String email);
	
// 유저 정보 조회 매퍼
	public UserVO selectUser(@Param("uid") String uid);
	
// 유저 정보 수정 매퍼
	public void updateUser(UserVO vo);
	
// 회원 탈퇴 매퍼
	public void deleteUser(@Param("uid") String uid);
	

	
	

	
}

