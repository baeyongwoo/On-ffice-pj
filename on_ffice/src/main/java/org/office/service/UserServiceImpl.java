// 신우람 0918 작업
package org.office.service;

import org.office.domain.UserVO;
import org.office.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;
	
	@Override
	public void register(UserVO vo) {
		
		log.info("회원가입 실행");
		mapper.insert(vo);
	}

	@Override
	public UserVO login(String uid, String upw) {
		UserVO user = mapper.select(uid, upw);
		log.info("로그인 실행");
		return user;
	}

}
