package org.office.service;

import java.util.List;

import org.office.domain.NoticeVO;
import org.office.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper noticemapper;
	
	@Override
	public List<NoticeVO> lookUp() {
		List<NoticeVO> NoticeList = noticemapper.lookUp();
		log.info("전체 글 목록 조회");
		return NoticeList;
		
	}
	
	
	@Override
	public void write(NoticeVO vo) {
		
		log.info("글작성 실행");
		noticemapper.insert(vo);
	}

}
