package com.jcg.spring.hibernate.service;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.jcg.spring.hibernate.pojo.Employee;
import com.jcg.spring.hibernate.pojo.Overtime;
import com.jcg.spring.hibernate.pojo.Salary;



public class SalaryService {
	private HibernateTemplate hibernateTemplate;
	@Autowired
	private Otservice otservice;
	private static Logger log = Logger.getLogger(SalaryService.class);
	
	JdbcTemplate template;  
	  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  
	private SalaryService() { }
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	protected Session getSession() {
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}
	@SuppressWarnings("unchecked")
	public List<Salary> listSalary() {

		List<Salary> salList = (List<Salary>) hibernateTemplate.find("from Salary");
		for(Salary sal : salList){
			log.info("Person List::"+sal.getEmp_name());
		}
		return salList;
	}
	@SuppressWarnings("unchecked")
	public void calcuSalary(Salary sal,Map<Object, Object> otlist,Map <Object, Object> lvelist,List<Employee> emplist ) {
		String stdate=null;
		String enddate=null;
		try{stdate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(sal.getFromdate())); }catch(Exception e) {}
		try{enddate=new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("mm/dd/yyyy").parse(sal.getTodate())); }catch(Exception e) {}
		 for (Object key : otlist.keySet())
	            System.out.println(key + " - " + otlist.get(key));
	        System.out.println();
	        for (Object key : lvelist.keySet())
	            System.out.println(key + " - " + lvelist.get(key));
	        System.out.println();
	        for(Employee emp : emplist){
	        	float bscsalary=emp.getBasicsalary();
	        	log.info("bscsalary  "+bscsalary);
	        	float payrate=bscsalary/30;
	        	 System.out.println("payrate " + payrate);
	        	float othour= 0;
	        	float leave=0;
	        	float otamt=0;
	        	float lveamt=0;
	        	float tax=0;
	        	float monthlytax=0;
	        	float other=0;
	        	Integer emp_id=emp.getEmp_id();
	        	System.out.println("empid " + emp_id);
	        	Integer searchKey =emp_id;
	            if (otlist.containsKey(searchKey)) {
	                System.out.println("Found total " + otlist.get(searchKey) + " " + searchKey );
	                othour=(((Double) otlist.get(searchKey)).floatValue());
	                otamt=(payrate/8)*othour;
	                log.info("ovt amt"+otamt);
	               
	            }
	            if (lvelist.containsKey(searchKey)) {
	                System.out.println("Found total " + lvelist.get(searchKey) + " id" + searchKey );
	                leave=((Double) lvelist.get(searchKey)).floatValue();
	                lveamt=leave*payrate;
	                log.info("lve amt"+lveamt);
	            }
	            float yearlysal=bscsalary*12;
	            float personalrelief=yearlysal*(0.2f);
	            float parentrelief=emp.getParent()*1000000;
	            float spouserelief;
				if(emp.getMarital().equals("married"))
	            	spouserelief=1000000;
				else spouserelief=0;
				float childrelief=emp.getChildren()*500000;
				float socialsecurity=0;
				if(bscsalary<300000)
					socialsecurity=(bscsalary*0.02f)*12;
				else socialsecurity=(300000*0.02f)*12;
				float totalrelief =personalrelief+parentrelief+spouserelief+childrelief+socialsecurity;
				float TaxableIncome=yearlysal-totalrelief;
				float fiveper,tenper,fifthtper;
				if(TaxableIncome<=2000000)
					tax=0*2000000;
				
				else if (TaxableIncome<=5000000) {
					fiveper=TaxableIncome-2000000;
					tax=(0*2000000)+(fiveper*0.05f);
				}
				else if (TaxableIncome<=10000000){
					tenper=TaxableIncome-5000000;
					tax=(0*2000000)+(3000000*0.05f)+(tenper*0.1f);
				}
				else {
					fifthtper=TaxableIncome-10000000;
					tax=(0*2000000)+(3000000*0.05f)+(5000000*0.1f)+(fifthtper*0.15f);
				}
				monthlytax=tax/12;
				float netpay=bscsalary+otamt-lveamt-monthlytax;
				sal.setEmp_name(emp.getEmp_name());
	            sal.setFromdate(stdate);
	            sal.setTodate(enddate);
	            sal.setBasicsalary(bscsalary);
	            sal.setOvertime(otamt);
	            sal.setLeave_amt(lveamt);
	            sal.setEmp_id(emp_id);
	            sal.setOtherallowance(other);
				sal.setTax(monthlytax);	
				 sal.setNetpay(netpay);
				 log.info("emp.getEmp_name() :"+emp.getEmp_name());
		            log.info("stdate :"+stdate);
		            log.info("enddate :"+enddate);
		            log.info("bscsalary :"+bscsalary);
		            log.info("otamt :"+otamt);
		            log.info("lveamt :"+lveamt);
		            log.info("tax :"+tax);
		            log.info("netpay :"+netpay);
		            log.info("emp_id :"+emp_id);
		            log.info("other :"+other );
	            
				 
	            
	            
	            
	            
	            hibernateTemplate.setCheckWriteOperations(false);
				hibernateTemplate.save(sal);
				log.info("Person List::"+emp.getEmp_name()+"netpay"+netpay);
			}
	        
	        System.out.println();
		
	
	}
	@SuppressWarnings("unchecked")
	public List<Salary> getsalforemp(int emp_id) {
		List<Salary> salList = (List<Salary>) hibernateTemplate.find("from Salary where emp_id=?",emp_id);
		for(Salary sal : salList){
			log.info("Person List::"+sal.getEmp_name());
		}
		return salList;


	}
	
	
	
	
	
	

}
