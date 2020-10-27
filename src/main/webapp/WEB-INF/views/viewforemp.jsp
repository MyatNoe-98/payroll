<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
      <%@ include file="/WEB-INF/jspf/navemp.jspf"%>

	<body>
	
	    <div class="container" style="margin-left:25%">
	    
	    
	        <h3 id="form_header" class="text-primary" > Welcome </h3>
	        <div>&nbsp;</div>
	        <table border="2" width="70%" cellpadding="2">
				<tr>
					<th >Id</th><th>Name</th><th>NRC</th> <th>Phone</th><th>Email</th><th>Birth Date</th>
					<th>Address</th><th>Basic Salary</th><th>Marital Status</th><th>Children</th><th>Parent</th>
		
				</tr>
    		 
    			<tr>
    				<td path="emp_id">${emp.emp_id}</td>
    				<td>${emp.emp_name}</td>
    				<td>${emp.NRC}</td>
    				<td>${emp.phone}</td>
    				<td>${emp.email}</td>
    				<td>${emp.birthdate}</td>
    				<td>${emp.address}</td>
    				<td>${emp.basicsalary}</td>
    				<td>${emp.marital}</td>
    				<td>${emp.children}</td>
    				<td>${emp.parent}</td>
    		</tr>
    	</table>
   	</div> 
	</body>
</html>
