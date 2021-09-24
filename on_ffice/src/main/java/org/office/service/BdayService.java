package org.office.service;

import java.util.Date;
import java.util.List;

import org.office.domain.UserVO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


public interface BdayService {

	public List<UserVO> getList(String birth);
}
