package org.office.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int notice_num;
	private String ncategory;
	private String ntitle;
	private String ncontent;
	private String nwriter;
	private Date ndate;
	private Date nupdate;
	private int nhits;
	
	

}
