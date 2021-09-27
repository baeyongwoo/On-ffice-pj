package org.office.service;

import java.util.ArrayList;
import java.util.List;

import org.office.domain.MealVO;
import org.office.mapper.MealMapper;
import org.office.mapper.MyPageMapper;
import org.office.mapper.RiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MealServiceImpl implements MealService{

	@Autowired
	MealMapper mm;
	
	@Autowired
	RiceMapper rm;
	
	@Override
	public List<MealVO> mealList() {
		List<MealVO> meal = mm.month();
		List<MealVO> twocounty_Meal = new ArrayList<MealVO>();
		
		
		for(int i = 0; i< 14; i++) {	//2주 기준으로 로테돌림 
			int j = (int)(Math.random()*meal.size());	//메뉴 생길때마다 크기증가
			if(twocounty_Meal.contains(meal.get(j))) continue;
	
			twocounty_Meal.add(meal.get(j));
		}
		for(int i =0; i<twocounty_Meal.size(); i++) {
			log.info(i + 1 + "일 식사메뉴 :  " + twocounty_Meal.get(i));
			//rm.riceInsert(twocounty_Meal.get(i));
		}
		return twocounty_Meal;
		
	}
	
}
