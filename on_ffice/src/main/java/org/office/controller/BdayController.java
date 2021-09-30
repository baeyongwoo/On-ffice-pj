// 2021.09.23 ������

package org.office.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.office.domain.UserVO;
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
	UserService us;

	@GetMapping("/bdaylist")
	public void list(Model model) {
		UserVO vo = new UserVO();

		Calendar c = Calendar.getInstance();

		int month = c.get(Calendar.MONTH) + 1;
		List<UserVO> user = us.allUserInfo();	// 6
		List<UserVO> birth_user = null;
		log.info("user 사이즈" + user.size());
		log.info("이번달 : " + month);
		for (int i = 0; i <= 5; i++) {
			log.info(i + "번쨰 사람" + user.get(i).getBirth());
			String births = user.get(i).getBirth();
			log.info("생일 " + births);
			births = births.substring(5, 7);
			int birth = Integer.parseInt(births);
			
			
			if (month == birth) {
				
				birth_user.add(vo);
				log.info("추가된 유저? " + birth_user);
				
			}
		}
		model.addAttribute("list", user);
	}

}
