package com.jcg.spring.hibernate.service;
	import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
	import org.hibernate.Session;
	import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.orm.hibernate5.HibernateTemplate;
	import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import com.jcg.spring.hibernate.pojo.Employee;
import com.jcg.spring.hibernate.pojo.Overtime;
import com.jcg.spring.hibernate.pojo.Salary;
	


public class Otservice {
		private HibernateTemplate hibernateTemplate;
		private static Logger log = Logger.getLogger(EmpShowService.class);
		JdbcTemplate template;  
		  
		public void setTemplate(JdbcTemplate template) {  
		    this.template = template;  
		}  
		private Otservice() { }
		public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
			this.hibernateTemplate = hibernateTemplate;
		}
		protected Session getSession() {
			return hibernateTemplate.getSessionFactory().getCurrentSession();
		}
		@SuppressWarnings("unchecked")
		public List<Overtime> listOt() {
			System.out.println("listot");
			@SuppressWarnings("deprecation")
			List<Overtime> otList = (List<Overtime>) hibernateTemplate.find("from Overtime");
			for(Overtime Ot : otList){
				log.info("Person List::"+Ot.getHour());
			}
			return otList;
		}
		
		@Transactional(readOnly = false)
		public void saveOvertime(Overtime ovt) {
			String otdate=null;
			log.info("Before date"+ovt.getDate());
			try{otdate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(ovt.getDate())); }catch(Exception e) {}
			ovt.setDate(otdate);
			hibernateTemplate.setCheckWriteOperations(false);
			log.info("date"+ovt.getDate());
			System.out.println(ovt.getHour());
			hibernateTemplate.save(ovt);
			
			log.info("Person updated successfully, Person Details="+ovt);
		}
		
		@SuppressWarnings("unchecked")
		public List<Overtime> getotforemp(int emp_id) {
			List<Overtime> otList = (List<Overtime>) hibernateTemplate.find("from Overtime where emp_id=?",emp_id);
			for(Overtime Ot : otList){
				log.info("Person List::"+Ot.getHour());
			}
			return otList;


		}
		@SuppressWarnings("unchecked")
		@Transactional(readOnly = false)
		public Map getot(Salary sal) {
			Map<Object, Object> ot = new HashMap<Object, Object>(); 
			String stdate=null;
			String enddate=null;
			try{stdate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(sal.getFromdate())); }catch(Exception e) {}
			try{enddate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(sal.getTodate())); }catch(Exception e) {}
			log.info("Before otser getot date"+stdate);
			log.info("Before otser getot date"+enddate);
			DetachedCriteria criteria = DetachedCriteria.forClass(Overtime.class);		 	  
		    ProjectionList projectionList = Projections.projectionList();
		    projectionList.add(Projections.sum("hour"));
		    projectionList.add( Projections.groupProperty("emp_id"));
		    criteria.setProjection(projectionList);
		    criteria.add( Restrictions.between("date", stdate, enddate) );
		    List<Object[]> otlist = (List<Object[]>) hibernateTemplate.findByCriteria(criteria);
		    log.info("Id= " + otlist);
		    for(Object[] emp : otlist){
				log.info("Person List::"+emp[0]+":"+emp[1]);
				ot.put(emp[1], emp[0]);
		    }		
			log.info("Person updated successfully, Person Details="+ot);
			return ot;
			
			
				     
				}
		    
		
		
		
	

}
