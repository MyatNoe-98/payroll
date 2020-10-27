package com.jcg.spring.hibernate.service;
	import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
	import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
	import org.springframework.transaction.annotation.Transactional;

	import java.text.SimpleDateFormat;
	import java.util.Date;
import java.util.HashMap;

import com.jcg.spring.hibernate.pojo.Leaves;
import com.jcg.spring.hibernate.pojo.Overtime;
import com.jcg.spring.hibernate.pojo.Salary;
public class LeaveService {
	private HibernateTemplate hibernateTemplate;
	private static Logger log = Logger.getLogger(EmpShowService.class);
	
	private LeaveService() { }
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	protected Session getSession() {
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}
	@SuppressWarnings("unchecked")
	public List<Leaves> listLve() {
		System.out.println("listot");
		@SuppressWarnings("deprecation")
		List<Leaves> lveList = (List<Leaves>) hibernateTemplate.find("from Leaves");
		for(Leaves lve : lveList){
			log.info("Person List::"+lve.getName());
		}
		return lveList;
	}
	@Transactional(readOnly = false)
	public void saveLeave(Leaves lve) {
		String stdate=null;
		String enddate=null;
		
		log.info("Before date"+lve.getEnddate());
		try{stdate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(lve.getStartdate())); }catch(Exception e) {}
		try{enddate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(lve.getEnddate())); }catch(Exception e) {}
		
		lve.setStartdate(stdate);
		lve.setEnddate(enddate);
		hibernateTemplate.setCheckWriteOperations(false);
		log.info("date"+lve.getEnddate());
		System.out.println(lve.getDay());
		hibernateTemplate.save(lve);
		
		log.info("Person updated successfully, Person Details="+lve);
	}
	
	@SuppressWarnings("unchecked")
	public List<Leaves> getlveforemp(int emp_id) {
		List<Leaves> lveList = (List<Leaves>) hibernateTemplate.find("from Leaves where emp_id=?",emp_id);
		for(Leaves lve : lveList){
			log.info("Person List::"+lve.getName());
		}
		return lveList;


	}
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = false)
	public Map getlve(Salary sal) {
		Map<Object, Object> ot = new HashMap<Object, Object>(); 
		String stdate=null;
		String enddate=null;
		try{stdate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(sal.getFromdate())); }catch(Exception e) {}
		try{enddate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(sal.getTodate())); }catch(Exception e) {}
		log.info("Before otser getot date"+stdate);
		log.info("Before otser getot date"+enddate);
		DetachedCriteria criteria = DetachedCriteria.forClass(Leaves.class);
		ProjectionList projectionList = Projections.projectionList();
		projectionList.add(Projections.sum("day"));
		projectionList.add( Projections.groupProperty("emp_id"));
		criteria.setProjection(projectionList);
		criteria.add( Restrictions.between("startdate", stdate, enddate) );
		criteria.add( Restrictions.between("enddate", stdate, enddate) );
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
