package org.office.mapper;

import java.util.List;

import org.office.domain.DpCommunityVO;
import org.office.domain.SearchCriteria;

public interface DpCommunityMapper {
	
// 글 조회 로직
	public List<DpCommunityVO> DpCommunityList(String keyword);
	
// 페이징 처리 로직
	public List<DpCommunityVO> DpCListPaging(SearchCriteria cri);
	
// 글 전체 개수 가져오는 로직
	public int getTotalBoard(SearchCriteria cri);
	
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
