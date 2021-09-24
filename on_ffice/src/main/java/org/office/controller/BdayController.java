// 2021.09.23 ������

package org.office.controller;

import java.lang.ProcessHandle.Info;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.office.domain.UserVO;
import org.office.service.BdayService;
import org.office.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/bday/*")
@AllArgsConstructor
public class BdayController {

	@Autowired
	private BdayService service;
	
	@GetMapping("/bdaylist")
	public void list(Model model, String birth) {
		UserVO vo = new UserVO();
		Date date = new Date();
		
		
		SimpleDateFormat format = new SimpleDateFormat("MM");
		
		String births = format.format(date);
		log.info(births);
		
		List<UserVO> bList = service.getList(birth); 
		log.info(bList);
		model.addAttribute("list", bList);
		model.addAttribute("MM", "9");
	}
	
	
}
