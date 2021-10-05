package org.office.service;

import java.util.List;

import org.office.domain.DpCReplyVO;
import org.office.mapper.DpCReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class DpCReplyServiceImpl implements DpCReplyService {

	@Autowired
	DpCReplyMapper drm;
	
	@Override
	public void addDpCreply(DpCReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<DpCReplyVO> listDpCReply(int dc_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyDpCReply(DpCReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeDpCReply(int dc_num) {
		// TODO Auto-generated method stub
		
	}
	
	

}
