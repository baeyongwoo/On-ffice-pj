package org.office.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {

	@Autowired
	private PasswordEncoder pwen;
	@Autowired
	private DataSource ds;
	
	@Test
	public void testCryptDefaultDB() {
		String [] idList = {"test1"};
		String sql = "UPDATE USERS set upw=? WHERE uid=?";
		
		try {
			Connection con = ds.getConnection();
			
			for(String id : idList) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pwen.encode("1234"));
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}
			String pw = "1234";
			if(pwen.matches("1234",pwen.encode(pw))) {
				pw = pwen.encode(pw);
				log.info(pw);
				log.info("일치");
			} else {
				log.info("불일치");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
