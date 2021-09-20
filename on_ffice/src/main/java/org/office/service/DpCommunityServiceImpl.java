package org.office.service;

import java.util.List;

import org.office.domain.DpCommunityVO;
import org.office.mapper.DpCommunityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DpCommunityServiceImpl implements DpCommunityService{
	
	@Autowired
	private DpCommunityMapper dpcommunitymapper;
	
	@Override
	public List<DpCommunityVO> list() {
		List<DpCommunityVO> DpCommunityList = dpcommunitymapper.DpCommunityList();
		log.info("service dpcommunitylist" + DpCommunityList);
		return DpCommunityList;		
	}

}
