package org.office.mapper;

import java.util.List;

import org.office.domain.NoticeVO;

public interface NoticeMapper {

//글 조회 로직
	public List<NoticeVO> noticeList();
	
// 글 작성 로직
	public void write(NoticeVO vo);
	
	public void writeSelect(NoticeVO vo);

}
