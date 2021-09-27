package org.office.service;

import java.util.List;

import org.office.domain.MenuVO;
import org.office.domain.RiceVO;

public interface RiceService {

	// meal을 입력받아 Rice에 저장
	public List<RiceVO> insertRice(List<MenuVO> meal);
}
