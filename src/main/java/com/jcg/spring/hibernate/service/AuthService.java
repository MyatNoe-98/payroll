package com.jcg.spring.hibernate.service;



import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.jcg.spring.hibernate.pojo.User;

public class AuthService {
	
	private HibernateTemplate hibernateTemplate;
	private static Logger log = Logger.getLogger(AuthService.class);

	private AuthService() { }
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
		
	}
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  

	@SuppressWarnings( { "unchecked", "deprecation" } )
	public boolean findUser(String uname,String upwd) {
		log.info("Checking the user in the database");
		boolean isValidUser = false;
		String sqlQuery = "from User u where u.name=? and u.password=?";
		try {
			List<User> userObj = (List<User>) hibernateTemplate.find(sqlQuery, uname, upwd);
			if(userObj != null && userObj.size() > 0) {
				log.info("Id= " + userObj.get(0).getId() + ", Name= " + userObj.get(0).getName() + ", Password= " + userObj.get(0).getPassword());
				isValidUser = true;
			}
		} catch(Exception e) {
			isValidUser = false;
			log.error("An error occurred while fetching the user details from the database", e);	
		}
		return isValidUser;
	}
	public int isAdmin(String uname,String upwd) {
		log.info("Checking the user in the database");
		int isAdmin = 0;
		String sqlQuery = "from User u where u.name=? and u.password=?";
		try {
			List<User> userObj = (List<User>) hibernateTemplate.find(sqlQuery, uname, upwd);
			if(userObj != null && userObj.size() > 0) {
				log.info("hello helooId= " + userObj.get(0).getId() + ", Name= " + userObj.get(0).getName() + ", Password= " + userObj.get(0).getPassword());
				isAdmin = userObj.get(0).getIsadmin();
				log.info(isAdmin);
			
			}
		} catch(Exception e) {
			isAdmin = 0;
			log.error("An error occurred while fetching the user details from the database", e);	
		}
		return isAdmin;
	}
	public int getEmpid(String uname,String upwd) {
		log.info("Checking the user in the database");
		int emp_id = 0;
		String sqlQuery = "from User u where u.name=? and u.password=?";
		try {
			List<User> userObj = (List<User>) hibernateTemplate.find(sqlQuery, uname, upwd);
			if(userObj != null && userObj.size() > 0) {
				
				emp_id = userObj.get(0).getEmp_id();
				log.info("empid"+emp_id);
			
			}
		} catch(Exception e) {
			emp_id = 0;
			log.error("An error occurred while fetching the user details from the database", e);	
		}
		return emp_id;
	}
	@Transactional(readOnly = false)
	public void saveUser(User user) {
		
	hibernateTemplate.setCheckWriteOperations(false);
	log.info("username"+user.getName());
	hibernateTemplate.save(user);
		log.info("Person updated successfully, Person Details="+user);
	}
	@SuppressWarnings("unchecked")
	public List<User> listUser() {
//		Session session = this.sessionFactory.getCurrentSession();
		List<User> userList = (List<User>) hibernateTemplate.find("from User");
		for(User user : userList){
			log.info("Person List::"+user.getName());
		}
		return userList;
	}
	@SuppressWarnings("unchecked")
	public User getUserById(int id) {
		List<User> userList = (List<User>) hibernateTemplate.find("from User where id=?",id);
		User user=(User)userList.get(0);
		System.out.println(userList.get(0)+","+user.getName());
		log.info("Person get successfully, person details="+user.getEmp_id());
		 return user;

	}
	public void deleteUser(User user) {
		System.out.println(user.getEmp_id());
		String sql="delete from User WHERE (`user_id` = "+user.getId()+");";	
		System.out.println(sql);
	    template.update(sql);
		log.info("Person deleted successfully, person details="+user.getEmp_id());
	}

	         
	        
}
	
