package org.office.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.office.domain.DpCommunityVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DpCommunityMapperTests {
	
	@Autowired
	private DpCommunityMapper dpcommunityMapper;
	
	//@Test
	public void testDpCList() {
		log.info("부서 게시글 조회중...");
		log.info(dpcommunityMapper.DpCommunityList());
	}
	
	@Test
	public void testDpCInsert() {
		
		DpCommunityVO vo = new DpCommunityVO();
		
		vo.setDp_code(10001);
		vo.setDtitle("2번째 글");
		vo.setDcontent("2번째 글 내용");
		vo.setDwriter("글쓴이");
		vo.setDdate();
		vo.setDupdate();
		vo.setDhits(0);
		
	}

}
