package com.jcg.spring.hibernate.service;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import com.jcg.spring.hibernate.pojo.Employee;



public class EmpShowService {
	private HibernateTemplate hibernateTemplate;
	private static Logger log = Logger.getLogger(EmpShowService.class);
	
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  
	private EmpShowService() { }
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	protected Session getSession() {
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}
	@SuppressWarnings("unchecked")
	public List<Employee> listEmp() {
//		Session session = this.sessionFactory.getCurrentSession();
		List<Employee> empList = (List<Employee>) hibernateTemplate.find("from Employee");
		for(Employee emp : empList){
			log.info("Person List::"+emp.getEmp_name());
		}
		return empList;
	}
	public Employee getEmpById(int emp_id) {
		List<Employee> empList = (List<Employee>) hibernateTemplate.find("from Employee where id=?",emp_id);
		Employee emp=(Employee)empList.get(0);
		System.out.println(empList.get(0)+","+emp.getEmp_name());
		 return emp;

	}
	@Transactional(readOnly = false)
	public void saveEmployee(Employee emp) {
		String dob=null;
		
		    try{dob=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(emp.getBirthdate())); }catch(Exception e) {}
		emp.setBirthdate(dob);	
	hibernateTemplate.setCheckWriteOperations(false);
	log.info("date"+emp.getBirthdate());
	hibernateTemplate.save(emp);
	System.out.println(emp.getEmail());
		log.info("Person updated successfully, Person Details="+emp);
	}
	
	@Transactional(readOnly = false)
	public void updateEmployee(Employee emp) {
		String dob=null;
	//	Session session = this.sessionFactory.getCurrentSession();	
	 // format it to the date pattern you prefer
         
	    try{dob=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(emp.getBirthdate())); }catch(Exception e) {}
		 String sql="update Employee set emp_id='"+emp.getEmp_id() +"', emp_name='"+emp.getEmp_name()+"',NRC='"+emp.getNRC()+"',phone='"+emp.getPhone()+"',email='"+emp.getEmail()+"',birthdate='"+dob+"',address='"+emp.getAddress()+"',basicsalary='"+emp.getBasicsalary()+"',marital='"+emp.getMarital()+"',children='"+emp.getChildren()+"',parent='"+emp.getParent()+"'WHERE (`emp_id` = '"+emp.getEmp_id()+" ')";  
		   hibernateTemplate.setCheckWriteOperations(false);
		System.out.println(emp.getEmail());
		template.update(sql);
		 
		   // return template.update(sql);  
		 
		log.info("Person updated successfully, Person Details="+emp);
	}
	public void deleteEmployee(Employee emp) {
		System.out.println(emp.getEmp_id());
		String sql="delete from Employee WHERE (`emp_id` = "+emp.getEmp_id()+");";	
		System.out.println(sql);
	    template.update(sql);
		log.info("Person deleted successfully, person details="+emp.getEmp_id());
	}
	@SuppressWarnings("unchecked")
	public Employee getEmpforemp(int emp_id) {
		List<Employee> empList = (List<Employee>) hibernateTemplate.find("from Employee where emp_id=?",emp_id);
		Employee emp=(Employee)empList.get(0);
		System.out.println(empList.get(0)+","+emp.getEmp_name());
		 return emp;


	}
	
	
}
