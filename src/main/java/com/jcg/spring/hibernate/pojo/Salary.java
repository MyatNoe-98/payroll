package com.jcg.spring.hibernate.pojo;
import java.io.Serializable;
public class Salary implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idsalary,emp_id;
	private float overtime,leave_amt,tax,otherallowance,netpay,basicsalary;
	private String emp_name,fromdate,todate;
			
			public long getIdsalary() {
					return idsalary;
				}

			public void setIdsalary(int idsalary) {
					this.idsalary = idsalary;
				}
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
		public String getFromdate() {
				return fromdate;
			}
		public void setFromdate(String fromdate) {
				this.fromdate = fromdate;
			}	
		public String getTodate() {
			return todate;
		}
		
		public void setTodate(String todate) {
			this.todate = todate;
		}
		public float getBasicsalary() {
			return basicsalary;
		}
		public void setBasicsalary(float basicsalary) {
			this.basicsalary = basicsalary;
		}
		public float getOvertime() {
			return overtime;
			}
		public void setOvertime(float overtime) {
			this.overtime = overtime;
			}
		public float getLeave_amt() {
			return leave_amt;
			}
		public void setLeave_amt(float leave) {
			this.leave_amt = leave;
			}
		public float getTax() {
			return tax;
			}
		public void setTax(float tax) {
			this.tax = tax;
			}
		public float getOtherallowance() {
			return otherallowance;
		}
		public void setOtherallowance(float otherallowance) {
			this.otherallowance = otherallowance;
		}
		public float getNetpay() {
			return netpay;
		}
		public void setNetpay(float netpay) {
			this.netpay = netpay;
		}
			
	
}
