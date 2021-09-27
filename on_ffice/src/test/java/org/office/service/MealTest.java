package org.office.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.office.domain.MealVO;
import org.office.mapper.MealMapper;
import org.office.mapper.RiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MealTest {
	
	@Autowired
	MealMapper mm;
	
	@Autowired
	RiceMapper rm;
	
	@Test
	public void getMealTest() {
		List<MealVO> meal = mm.month();
		List<MealVO> twocounty_Meal = new ArrayList<MealVO>();
		
		
		for(int i = 0; i< 14; i++) {	//2주 기준으로 로테돌림 
			int j = (int)(Math.random()*meal.size());	//메뉴 생길때마다 크기증가
			if(twocounty_Meal.contains(meal.get(j))) continue;
	
			twocounty_Meal.add(meal.get(j));
		}
		for(int i =0; i<twocounty_Meal.size(); i++) {
			log.info(i + 1 + "일 식사메뉴 :  " + twocounty_Meal.get(i));
		}
		
		log.info("rice에 들어간 값 : " + rm.riceInsert(twocounty_Meal));
		
		
		
		
//	//	log.info("밀리스트" + ms.mealList().get(i).toString());
//		for(int j=0; j< ms.mealList().size(); j++) {
//			int i = (int)(Math.random()*ms.mealList().size());
//			
//			ms.mealList().add(j, ms.mealList().get(i));
//			log.info(meal);
//			
//		}
//		for(int j=0; j<ms.mealList().size(); j++) {
//			log.info("mealList에 저장된 값" + ms.mealList().get(j));
//		}
		//ms.mealList().get(i).toString();
		//log.info("식단표 : " + ms.mealList().get(i).toString());
		//log.info("1번 식단표 : " + ms.mealList().add(ms.mealList()));
		
	}
	
}
