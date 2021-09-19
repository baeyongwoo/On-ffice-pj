package org.office.domain;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int notice_num;
	private int id;
	private String btitle;
	private String bcontent;
	private String name;
	private String position;
	private String dpname;
	private String importance;

}
