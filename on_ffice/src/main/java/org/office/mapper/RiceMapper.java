package org.office.mapper;

import java.util.List;

import org.office.domain.MealVO;
import org.office.domain.RiceVO;

public interface RiceMapper {

	//식단 조회받아서 입력처리
	public List<RiceVO> riceInsert(List<MealVO> meal);
}
