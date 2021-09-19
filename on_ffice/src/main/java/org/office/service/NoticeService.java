package org.office.service;

import java.util.List;

import org.office.domain.NoticeVO;

public interface NoticeService {
	
	//글 조회 서비스
	public List<NoticeVO> list();
	
	// 글 작성 서비스
	public void write(NoticeVO vo);

}
