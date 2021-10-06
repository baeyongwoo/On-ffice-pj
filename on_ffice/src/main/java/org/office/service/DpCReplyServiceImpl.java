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
		drm.create(vo);
		
	}

	@Override
	public List<DpCReplyVO> listDpCReply(int dp_community) {

		return drm.getList(dp_community);
	}

	@Override
	public void modifyDpCReply(DpCReplyVO vo) {
		
		drm.update(vo);
		
	}

	@Override
	public void removeDpCReply(int dno) {
		
		drm.delete(dno);
		
	}
	
	

}
