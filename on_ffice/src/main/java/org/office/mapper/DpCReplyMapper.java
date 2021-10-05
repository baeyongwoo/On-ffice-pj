package org.office.mapper;

import java.util.List;

import org.office.domain.DpCReplyVO;

public interface DpCReplyMapper {
	
	public List<DpCReplyVO> getList(int dc_num);
	
	public void create(DpCReplyVO vo);
	
	public void update(DpCReplyVO vo);
	
	public void delete(int dc_num);

}
