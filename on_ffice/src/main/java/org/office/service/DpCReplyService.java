package org.office.service;

import java.util.List;

import org.office.domain.DpCReplyVO;

public interface DpCReplyService {
	
	public void addDpCreply(DpCReplyVO vo);
	
	public List<DpCReplyVO> listDpCReply(int dc_num);
	
	
	public void modifyDpCReply(DpCReplyVO vo);
	
	public void removeDpCReply(int dc_num);

}
