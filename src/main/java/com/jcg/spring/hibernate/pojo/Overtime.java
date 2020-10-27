package com.jcg.spring.hibernate.pojo;

import java.io.Serializable;



public class Overtime implements Serializable{
	

		private static final long serialVersionUID = 1L;
	 
		private int id_ot,emp_id;
		private float hour;
		private String name,date,starttime,endtime;

		
		
		public long getId_ot() {
			return id_ot;
		}

		public void setId_ot(int id_ot) {
			this.id_ot = id_ot;
		}
		public int getEmp_id() {
			return emp_id;
			}
		public void setEmp_id(int emp_id) {
			this.emp_id = emp_id;
			}
		public float getHour() {
			return hour;
			}
		public void setHour(float hour) {
			this.hour = hour;
			}
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getStarttime() {
			return starttime;
		}
		
		public void setStarttime(String starttime) {
			this.starttime = starttime;
		}
		public String getEndtime() {
			return endtime;
		}
		
		public void setEndtime(String endtime) {
			this.endtime = endtime;
		}
		
}
