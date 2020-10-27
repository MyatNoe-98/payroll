package com.jcg.spring.hibernate.pojo;
import java.io.Serializable;

public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;

	private int emp_id;
	private String emp_name,NRC,email,address,marital;
	private int phone; 
	private float basicsalary;
	private String birthdate;
	private Integer children,parent;
	public int getEmp_id() {
		return emp_id;
		}
		public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
		}
		
		
		public String getEmp_name() {
		return emp_name;
		}
		public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
		}
		 
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getPhone() {
			return phone;
			}
			public void setPhone(int phone) {
			this.phone = phone;
			}
		
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		
		public String getBirthdate() {
			return birthdate;
		}
		public void setBirthdate(String birthdate) {
			this.birthdate = birthdate;
		}
		
		
		public String getNRC() {  
		    return NRC;  
		}  
		public void setNRC(String NRC) {  
		    this.NRC = NRC;  
		}  
		
		
		public float getBasicsalary() {  
		    return basicsalary;  
		}  
		public void setBasicsalary(float basicsalary) {  
		    this.basicsalary = basicsalary;  
		}  
		public String getMarital() {
			return marital;
			}
			public void setMarital(String marital) {
			this.marital = marital;
			}
		
		public Integer getChildren() {
			return children;
			}
		public void setChildren(Integer children) {
			this.children = children;
			}
			
		public Integer getParent() {
				return parent;
				}
		public void setParent(Integer parent) {
				this.parent = parent;
				}
}
