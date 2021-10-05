package org.office.service;


import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class GetIpService {
	
	public String getIp (HttpServletRequest httr) {
		log.info("getIp 서비스 실행");
		
		// getRemoteAddr()은 web server에서 프록시나 로드 밸런서를 통해 was에 요청하기 때문에
		// 프록시나 로드밸런서의 IP 주소만을 담고 있다. 그래서 원 IP를 못가져오는 현상이 발생한다.
		
		// 그래서 ! 
		
		// X-Forwarded-For (XFF) 헤더는 HTTP 프록시나 로드 밸런서를 통해 웹 서버에 접속하는
		// 클라이언트의 원 IP 주소를 식별하는 표준 헤더로 쓰이고 있다. 그래서 프록시나 로드밸런스 등을 사용할 경우 
		// Apache/Nginx에서 설정이 되어있다는 가정하에 클라이언트의 실제 접속 IP를 가져올 수 있다.
		
		String ip = httr.getHeader("X-Forwarded-For");
	    if (ip == null) ip = httr.getRemoteAddr();
	    
	    return ip;

	}
}
