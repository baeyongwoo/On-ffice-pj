package org.office.mapper;

import java.util.List;

import org.office.domain.DpCommunityVO;

public interface DpCommunityMapper {
	
// 글 조회 로직
	public List<DpCommunityVO> DpCommunityList();
	
// 글 상세보기 로직
	public DpCommunityVO DpC_detail(int dc_num);
	
// 글 조회수 증가 로직
	public void dhit_up(int dc_num);
	
}
