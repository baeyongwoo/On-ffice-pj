package org.office.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.office.domain.UserVO;

@Mapper
public interface BdayMapper {

	public List<UserVO> getList(String birth);

	
}
