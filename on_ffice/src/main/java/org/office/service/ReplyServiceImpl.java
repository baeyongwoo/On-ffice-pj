package org.office.service;

import java.util.List;

import org.office.domain.ReplyVO;
import org.office.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyMapper rm;
	
	@Override
	public void addreply(ReplyVO vo) {
		rm.create(vo);
		
	}

	@Override
	public List<ReplyVO> listReply(int bno) {
		return rm.getList(bno);
		
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		rm.update(vo);
	}

	@Override
	public void removeReply(int rno) {

		rm.delete(rno);
	}

}