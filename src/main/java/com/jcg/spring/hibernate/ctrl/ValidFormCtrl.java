 package com.jcg.spring.hibernate.ctrl;
import java.util.Map;

import org.apache.log4j.Logger;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
public class ValidFormCtrl {
	@Autowired
	private EmpShowService empshowservice;
	@Autowired
	private Otservice otservice;
	@Autowired
	private LeaveService lveservice;
	@Autowired
	private AuthService authservice;
	@Autowired
	private SalaryService salservice;
	
	private static Logger log = Logger.getLogger(EmpShowService.class);
	@Qualifier(value="empshowservice")
	public void setAuthService(EmpShowService empshow){
		this.empshowservice = empshow;
	}
	
	@RequestMapping(value = "/viewemp")
	public String listEmp(Model model) {
		model.addAttribute("emp", new User());    
		model.addAttribute("listEmp", this.empshowservice.listEmp());
		log.info( this.empshowservice.listEmp());
		return "viewemp";
	} 
	@RequestMapping(value = "/viewuser")
	public String listUser(Model model) {
		model.addAttribute("listUser", this.authservice.listUser());
		log.info( this.authservice.listUser());
		return "viewuser";
	} 
	@RequestMapping(value = "/viewsalary")
	public String salarylist(Model model){
		model.addAttribute("listSal", this.salservice.listSalary());
		log.info( this.salservice.listSalary());
		log.info("hello sal");
		return "viewsalary";
	
		}
	@RequestMapping(value = "/overtimelist")
	public String listOt(Model model) {
		log.info("helo ot");
		model.addAttribute("listOt", this.otservice.listOt());		
		log.info( this.otservice.listOt());
		return "otlistform";
	} 
	@RequestMapping(value = "/leavelist")
	public String listLeave(Model model) {
		log.info("helo leave");
		model.addAttribute("listleave", this.lveservice.listLve());
		log.info( this.lveservice.listLve());
		return "leavelistform";
	} 
	@RequestMapping(value = "/calculate")
	public String calculate(){
		
		return "calculate";
			
		}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/calSalary",method= RequestMethod.POST)
	public String calSalary(@ModelAttribute("calcu") Salary sal){
		Map <Object, Object> otlist=this.otservice.getot(sal);
		Map <Object, Object> lvelist=this.lveservice.getlve(sal);
		
		
		this.salservice.calcuSalary(sal,otlist,lvelist,this.empshowservice.listEmp());
		return "redirect:viewsalary";
			
		}
	
	
	@RequestMapping(value = "/leaveform")
	public String leave(Model model){
		model.addAttribute("listEmp", this.empshowservice.listEmp());
		return "leaveform";
			
		}
	@RequestMapping(value = "/newemp")
	public String addemp(){
		return "newemp";
			
		}
	@RequestMapping(value = "/newuser")
	public String adduser(Model model){
		model.addAttribute("listEmp", this.empshowservice.listEmp());
		return "newuseracc";
			
		}
	@RequestMapping(value = "/saveEmp",method= RequestMethod.POST)
	public String empSave(@ModelAttribute("employee") Employee emp){
		this.empshowservice.saveEmployee(emp); 
		return "redirect:viewemp";
		 	
		}
	@RequestMapping(value = "/saveUser",method= RequestMethod.POST)
	public String userSave(@ModelAttribute("user") User user){
		this.authservice.saveUser(user); 
		return "redirect:viewuser";
		 	
		}
	
	@RequestMapping(value = "/saveOvt",method= RequestMethod.POST)
	public String ovtSave(@ModelAttribute("ovt") Overtime ovt){
		this.otservice.saveOvertime(ovt); 
		return "redirect:overtimelist";
		 	
		}
	@RequestMapping(value = "/saveLve",method= RequestMethod.POST)
	public String lveSave(@ModelAttribute("lve") Leaves lve){
		this.lveservice.saveLeave(lve); 
		return "redirect:leavelist";
		 	
		}
	
	
	@RequestMapping(value = "/overtimeform")
	public String overtime(Model model){
		model.addAttribute("listEmp", this.empshowservice.listEmp());
		
		return "overtimeform";
			
		}
	
	
	
	@RequestMapping("/UpdateEmpform/{emp_id}")
    public String editPerson(@PathVariable("emp_id") int id, Model model){
		System.out.println(id);
        model.addAttribute("emp", this.empshowservice.getEmpById(id));

		return "UpdateEmpform";
		
		}
	@RequestMapping(value = "/deleteEmpform/{emp_id}")
	public String delemp(@PathVariable("emp_id") int id, Model model){
		 model.addAttribute("emp", this.empshowservice.getEmpById(id));
	
		return "deleteEmp";
		
			
		}
	@RequestMapping(value = "/deleteUser/{id}")
	public String deluser(@PathVariable("id") int id, Model model){
		 model.addAttribute("user", this.authservice.getUserById(id));
	
		return "deleteUser";
		
			
		}
	@RequestMapping(value = "/empupdate",method= RequestMethod.POST)
	//@Transactional(readOnly = false)
	public String updateEmp(@ModelAttribute("employee") Employee emp){
		System.out.println("1");
		this.empshowservice.updateEmployee(emp);
		System.out.println("2");
		return  "redirect:viewemp";
			
		}
	
	
	@RequestMapping(value = "/empdelete")
	//@Transactional(readOnly = false)
	public String deleteEmp(@ModelAttribute("employee") Employee emp){
		System.out.println(emp.getEmp_id());
		this.empshowservice.deleteEmployee(emp);
		return  "redirect:viewemp";
		  
	    }
	@RequestMapping(value = "/userdelete")
	//@Transactional(readOnly = false)
	public String deleteUser(@ModelAttribute("user") User user){
		System.out.println(user.getEmp_id());
		this.authservice.deleteUser(user);
		return  "redirect:viewuser";
		  
	    }
	@RequestMapping(value = "/aboutus")
	public String abtus(){
		 
		return "aboutus";
		 	
		}
	@RequestMapping(value = "/service")
	public String service(){
		 
		return "service";
		 	
		}
	@RequestMapping(value = "/contact")
	public String contact(){
		 
		return "contact";
		 	
		}
	
	
		       
		    
		
}
