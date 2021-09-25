package org.office.service;

import org.office.domain.DepartVO;

public interface DepartService {

	public DepartVO getDpInfo(int dp_code); 
	
	public void UpCount(int dp_code);
		
	
}
