package org.office.mapper;

import java.util.List;

import org.office.domain.MealVO;

public interface MealMapper {
	
	// 식단 보기
	public List<MealVO> month();
	
}
