package org.office.service;

import java.util.Date;
import java.util.List;

import org.office.domain.UserVO;
import org.office.mapper.BdayMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BdayServiceImpl implements BdayService {

	@Autowired
	private BdayMapper mapper;
	
	@Override
	public List<UserVO> getList(String birth) {
		List<UserVO> bList = mapper.getList(birth);
		return bList;
	}
}
