package org.office.mapper;

import java.util.List;

import org.office.domain.DpCommunityVO;

public interface DpCommunityMapper {
	
// 글 조회 로직
	public List<DpCommunityVO> DpCommunityList();
	
// 글 상세보기 로직
	public DpCommunityVO DpCdetail(int dc_num);
	
// 글 조회수 증가 로직
	public void dhit_up(int dc_num);
	
// 글 작성 로직
	public void DpCwriteSelectKey(DpCommunityVO vo);
	
// 글 수정 로직
	public void DpCupdate(DpCommunityVO vo); 
	
// 글 삭제 로직
	public void DpCdelete(int dc_num);
	
}
