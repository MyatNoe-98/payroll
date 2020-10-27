package com.jcg.spring.hibernate.ctrl;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcg.spring.hibernate.pojo.Employee;
import com.jcg.spring.hibernate.pojo.Leaves;
import com.jcg.spring.hibernate.pojo.Overtime;
import com.jcg.spring.hibernate.pojo.Salary;
import com.jcg.spring.hibernate.service.AuthService;
import com.jcg.spring.hibernate.service.EmpShowService;
import com.jcg.spring.hibernate.service.LeaveService;
import com.jcg.spring.hibernate.service.Otservice;
import com.jcg.spring.hibernate.service.SalaryService;

@Controller  
@RequestMapping("/user")
public class LoginCtrl {

	@Autowired
	private AuthService authenticateService;
	
	private static Logger log = Logger.getLogger(LoginCtrl.class);
	
	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public String validateUsr(@RequestParam("username")String username,@RequestParam("password")String password,@RequestParam(value="isadmin",required=false)String isadmin,Model model) {
		
		boolean isValid = authenticateService.findUser(username, password);
		log.info("Is user valid?= " + isValid);
		
		if(isValid) {
			if (isadmin!=null && authenticateService.isAdmin(username, password)==1)
			{
				log.info("Is user valid hello?= " + isValid);
				return "adminvalidform";
			}
			else {
				int emp_id=authenticateService.getEmpid(username, password);
				model.addAttribute("emp_id",emp_id );
				
				return "empvalidform";}
		} else {
			return "invalidform";

	}

		

  }

		
	
	 
}