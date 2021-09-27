package org.office.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.office.domain.MenuVO;
import org.office.domain.RiceVO;
import org.office.mapper.RiceMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MenuTest {
	
	@Autowired
	MenuService ms;
	
	@Autowired
	RiceMapper rm;
	
	@Test
	public void getMealListTest() {
		log.info("구내식당 전체메뉴 : " + ms.menuList());
	}
	//@Test
	public void getMealTest() throws BeansException{
		List<MenuVO> meal = ms.menuList();
		List<MenuVO> twocounty_Meal = new ArrayList<MenuVO>();
		
		
		for(int i = 0; i< 14; i++) {	//2주 기준으로 로테돌림 
			int j = (int)(Math.random()*meal.size());	//메뉴 생길때마다 크기증가
			if(twocounty_Meal.contains(meal.get(j))) continue;
	
			twocounty_Meal.add(meal.get(j));
		}
		for(int i =0; i<twocounty_Meal.size(); i++) {
			log.info(i + 1 + "일 식사메뉴 :  " + twocounty_Meal.get(i));
		}
	
		List<RiceVO> rice = new ArrayList<RiceVO>();
		
		//for(int i =0; i<twocounty_Meal.size(); i++) {
			BeanUtils.copyProperties(twocounty_Meal.get(0), rice.get(0));
			
		//}
		//log.info("copy한값 : " + rice);
		
		
//		
//		
//		log.info("rice에 들어간 값 : " + rm.riceInsert(twocounty_Meal));
//		
		
		
		
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
	
	//@Test
	public void copyProperties() throws BeansException{
		//List<MealVO> meal = mm.month(); 
		List<RiceVO> rice = new ArrayList<RiceVO>();
		log.info("가지고올 값 : " + ms.menuList().toString());
		BeanUtils.copyProperties(ms.menuList(), rice);
		log.info("copy한값 : " + rice);
		
	}
	
}
