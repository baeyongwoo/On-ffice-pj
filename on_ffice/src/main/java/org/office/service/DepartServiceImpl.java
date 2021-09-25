package org.office.service;

import org.office.domain.DepartVO;
import org.office.mapper.DepartMapper;
import org.office.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DepartServiceImpl implements DepartService {
	
	@Autowired
	DepartMapper mapper;
	
	@Override
	public DepartVO getDpInfo(int dp_code) {
		
		log.info("부서 정보 조회 서비스 실행");
		return mapper.selectDpInfo(dp_code);
		
	}
}
