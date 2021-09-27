package org.office.mapper;

import org.office.domain.MealVO;

public interface MealMapper {
	
	// 식단 보기
	public MealVO daily(int mealno);
	
}
