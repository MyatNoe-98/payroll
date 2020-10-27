  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
      <%@ include file="/WEB-INF/jspf/navemp.jspf"%>

	<body>
	
	    <div class="container" style="margin-left:25%">
	    
	    
	        <h3 id="form_header" class="text-primary" >Your Salary Lists</h3>
	        <div>&nbsp;</div>
	        <table border="2" width="70%" cellpadding="2">
				<tr>
		<th >No. </th><th >Id no. </th><th>Name</th><th>From:</th> <th>To:</th><th>Basic Salary</th><th>Overtime</th><th>Leave</th>
		<th>Tax</th><th>Other Allowance</th><th>Net Pay</th>
		
	</tr>
    <c:forEach var="sal" items="${listSal}"> 
    <tr>
    	<td>${sal.idsalary}</td>
    	<td>${sal.emp_id}</td>
    	<td>${sal.emp_name}</td>
    	<td>${sal.fromdate}</td>
    	<td>${sal.todate}</td>
    	<td>${sal.basicsalary}</td>
    	<td>${sal.overtime}</td>
    	<td>${sal.leave_amt}</td>
    	<td>${sal.tax}</td>
    	<td>${sal.otherallowance}</td>
    	<td>${sal.netpay}</td>
    </tr>
   </c:forEach> 
    	</table>
   	</div> 
	</body>
</html>
