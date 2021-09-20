package org.office.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.office.domain.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Test
	public void testList() {
		log.info("게시글 조회중...");
		log.info(noticeMapper.noticeList());
	}
	
	//@Test
	public void testInsert() {
		NoticeVO vo = new NoticeVO();
		vo.setNtitle("test공지");
		vo.setNcontent("test글");
		vo.setNwriter("test관리자");

	}

}
