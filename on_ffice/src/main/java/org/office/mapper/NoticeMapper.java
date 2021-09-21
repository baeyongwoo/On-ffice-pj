package org.office.mapper;

import java.util.List;

import org.office.domain.NoticeVO;

public interface NoticeMapper {

// 글 조회 로직
	public List<NoticeVO> noticeList();

// 글 상세보기 로직
	public NoticeVO notice_detail(int notice_num);
	
// 글 작성 로직
	//public void write(NoticeVO vo);
	
	public void writeSelectkey(NoticeVO vo);
// 글 삭제 로직
	public void delete(int notice_num);
	
// 글 수정 로직
	public void update(NoticeVO vo);

// 글 조회수 증가 로직
	public void nhit_up(int notice_num);
	

}
