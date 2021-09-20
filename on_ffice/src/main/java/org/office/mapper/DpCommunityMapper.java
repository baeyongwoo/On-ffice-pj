package org.office.mapper;

import java.util.List;

import org.office.domain.DpCommunityVO;

public interface DpCommunityMapper {
	
//글 조회 로직
	public List<DpCommunityVO> DpCommunityList();
	
//글 작성 로직
	public void write(DpCommunityVO vo);

}
