package org.office.mapper;

import java.util.List;

import org.office.domain.CommunityVO;

public interface CommunityMapper {

// 글 조회 로직
	public List<CommunityVO> CommunityList();

// 글 상세보기 로직
	public CommunityVO Community_detail(int community_num);
	
// 글 작성 로직
	//public void write(NoticeVO vo);
	
	public void writeSelectkey(CommunityVO vo);
// 글 삭제 로직
	public void delete(int community_num);
	
// 글 수정 로직
	public void update(CommunityVO vo);

// 글 조회수 증가 로직
	public void chit_up(int community_num);
	

}
