package org.office.service;

import java.util.ArrayList;
import java.util.List;

import org.office.domain.MenuVO;
import org.office.domain.RiceVO;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RiceServiceImpl implements RiceService{@SuppressWarnings("unchecked")
@Override
	public List<RiceVO> insertRice(List<MenuVO> meal) {
	
			List<RiceVO> rice = new ArrayList<RiceVO>();
			for(int i=0; i< meal.size(); i++) {
				rice = (List<RiceVO>) meal.get(i);
			}
			return rice;
	}
	
}
