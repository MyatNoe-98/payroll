package com.jcg.spring.hibernate.pojo;
	import java.io.Serializable;

public class Leaves implements Serializable{
	private static final long serialVersionUID = 1L;
			 
				private int idleave,emp_id;
				private float day;
				private String name,startdate,enddate,type,reason;
				
				
				public long getIdleave() {
					return idleave;
				}

				public void setIdleave(int idleave) {
					this.idleave = idleave;
				}
				public int getEmp_id() {
					return emp_id;
					}
				public void setEmp_id(int emp_id) {
					this.emp_id = emp_id;
					}
				
				
				public String getName() {
					return name;
				}      

				public void setName(String name) {
					this.name = name;
				}
				public String getStartdate() {
					return startdate;
				}
				public void setStartdate(String startdate) {
					this.startdate = startdate;
				}
				
				public String getEnddate() {
					return enddate;
				}
				
				public void setEnddate(String enddate) {
					this.enddate = enddate;
				}
				public float getDay() {
					return day;
					}
				public void setDay(float day) {
					this.day = day;
					}
				
				public String getType() {
					return type;
				}
				
				public void setType(String type) {
					this.type = type;
				}
				
				public String getReason() {
					return reason;
				}
				
				public void setReason(String reason) {
					this.reason = reason;
				}
		

	

}
