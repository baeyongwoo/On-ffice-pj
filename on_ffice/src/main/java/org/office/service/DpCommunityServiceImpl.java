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

	@Override
	public DpCommunityVO detail(int dc_num) {
		DpCommunityVO vo = dpcommunitymapper.DpC_detail(dc_num);
		log.info(dc_num + "번째 부서글 상세보기 요청");
		log.info("부서글 상세보기 실행");
		int hits = vo.getDhits();
		
		return vo;
	}

	@Override
	public void dhit_up(int dc_num) {
		log.info("글 조회수 증가");
		dpcommunitymapper.dhit_up(dc_num);
		
	}

}
