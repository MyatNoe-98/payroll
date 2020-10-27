package com.jcg.spring.hibernate.ctrl;

import org.apache.log4j.Logger;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcg.spring.hibernate.service.AuthService;
import com.jcg.spring.hibernate.service.EmpShowService;
import com.jcg.spring.hibernate.service.LeaveService;
import com.jcg.spring.hibernate.service.Otservice;
import com.jcg.spring.hibernate.service.SalaryService;
import com.jcg.spring.hibernate.pojo.Employee;
import com.jcg.spring.hibernate.pojo.Leaves;
import com.jcg.spring.hibernate.pojo.User;
import com.jcg.spring.hibernate.pojo.Overtime;
import com.jcg.spring.hibernate.pojo.Salary;
@Controller  
@RequestMapping("/user")
public class EmpFormCtrl {

	
	
	@Autowired
	private SalaryService salservice;
	@Autowired
	private EmpShowService empshowservice;
	@Autowired
	private Otservice otservice;
	@Autowired
	private LeaveService lveservice;
	private static Logger log = Logger.getLogger(EmpShowService.class);
	@Qualifier(value="empshowservice")
	public void setAuthService(EmpShowService empshow){
		this.empshowservice = empshow;
	}
	
	

	@RequestMapping(value = "/viewforemp/{emp_id}")
	public String empview(@PathVariable("emp_id") int id,Employee emp, Model model){
			System.out.println("emp is "+id);
		    model.addAttribute("emp", this.empshowservice.getEmpforemp(id)); 
			
			return  "viewforemp";
				
			}
			 
		
	@RequestMapping(value = "/empovertimeform/{emp_id}")
	public String empOt(@PathVariable("emp_id") int id, Model model){
		System.out.println("emp is "+id);
	    model.addAttribute("ot", this.otservice.getotforemp(id)); 
		System.out.println("2");
		return "empovertimelist";
			
		} 
	@RequestMapping(value = "/empleaveform/{emp_id}")
	public String empLe(@PathVariable("emp_id") int id, Model model){
		System.out.println("emp is "+id);
	    model.addAttribute("lve", this.lveservice.getlveforemp(id)); 
		System.out.println("2");
		return "empleavelist";
			
		} 
	@RequestMapping(value = "/empviewsalary/{emp_id}")
	public String empSalary(@PathVariable("emp_id") int id, Model model){
		System.out.println("emp is "+id);
	    model.addAttribute("listSal", this.salservice.getsalforemp(id)); 
		return "empviewsalary";
			
		} 
	@RequestMapping("/overtimeformreg/{emp_id}")
    public String otforemp(@PathVariable("emp_id") int id, Model model){
		System.out.println(id);
        model.addAttribute("emp", this.empshowservice.getEmpById(id));
        
		return "empovertimeform";
		
		}
	@RequestMapping("/leaveformreg/{emp_id}")
    public String lveforemp(@PathVariable("emp_id") int id, Model model){
		System.out.println(id);
        model.addAttribute("emp", this.empshowservice.getEmpById(id));
        
		return "empleaveform";
		
		}
	@RequestMapping(value = "/saveOvtforemp",method= RequestMethod.POST)
	public String ovtSave(@ModelAttribute("ovt") Overtime ovt) {
		this.otservice.saveOvertime(ovt); 
		System.out.println("otsaveemp"+ovt.getEmp_id());
		int emp_id=ovt.getEmp_id();
		return "redirect:empovertimeform/"+emp_id;
		 	
		}
	@RequestMapping(value = "/saveLveforemp",method= RequestMethod.POST)
	public String lveSave(@ModelAttribute("lve") Leaves lve){
		this.lveservice.saveLeave(lve); 
		System.out.println("lvesaveemp"+lve.getEmp_id());
		int emp_id=lve.getEmp_id();
		return "redirect:empleaveform/"+emp_id;
		 	
		}
	
}
