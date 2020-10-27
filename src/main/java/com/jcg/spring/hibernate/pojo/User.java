package com.jcg.spring.hibernate.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

import org.hibernate.annotations.Entity;


public class User implements Serializable {

	private static final long serialVersionUID = 1L;
 
	private int id;
	private String name, password;
	private int isadmin; 
	private int emp_id; 
	
	
	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public void setIsadmin(int isadmin) {
		this.isadmin = isadmin;
	}
	public int getIsadmin() {
		return isadmin;
	}
	public int getEmp_id() {
		return emp_id;
		}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
		}


	
}