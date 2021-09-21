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
	public List<NoticeVO> list() {
		List<NoticeVO> NoticeList = noticemapper.noticeList();
		log.info("service noticelist" + NoticeList);
		log.info("전체 글 목록 조회");
		return NoticeList;
	}
	
	@Override
	public void write(NoticeVO vo) {
		
		log.info("글작성 실행");
		try {
			if(noticemapper.noticeList().isEmpty()) {
				log.info("처음 글 쓰는거임");
				log.info("관리자에게 문의하세요");
			} else {
				noticemapper.writeSelectkey(vo);
			}
		} catch (Exception e) {
			log.info("글쓰기 권한이 없습니다.");
			int num = vo.getNotice_num();
			log.info("service에서 나온 num " + num);
			num -= 1;
			vo.setNotice_num(num);
		}
		
	}

	@Override
	public void delete(int notice_num) {
		log.info(notice_num + "번째 글 삭제 요청");
		log.info("글 삭제 실행");
		noticemapper.delete(notice_num);
		
		
	}

	@Override
	public void update(NoticeVO vo) {
		log.info(vo.getNotice_num() + "번째 글 갱신 요청");
		log.info("글 갱신 실행");
		noticemapper.update(vo);
	}

	@Override
	public NoticeVO detail(int notice_num) {
		NoticeVO vo = noticemapper.notice_detail(notice_num);
		log.info(notice_num + "번째 글 상세보기 요청");
		log.info("글 상세보기 실행");
		int hits = vo.getNhits();
		log.info("현재 조회수 출력 : " + hits);
		hits ++;
		vo.setNhits(hits);
		log.info("조회수 증감된 것 출력 : " + vo.getNhits());
		
		return vo;
		
		
	}



}
