<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/jspf/header.jspf"%>
<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
<%@ include file="/WEB-INF/jspf/navigation.jspf"%>


<body>
<div class="container" style="margin-left:25%">
   <h3 id="form_header" class="text-primary" >Salary Lists</h3>
   		
   		
  	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th >No. </th><th >Id no. </th><th>Name</th><th>From:</th> <th>To:</th><th>Basic Salary</th><th>Overtime</th><th>Leave</th>
		<th>Tax</th><th>Other Allowance</th><th>Net Pay</th>
		
	</tr>
    <c:forEach var="sal" items="${listSal}"> 
    <tr>
    	<td path="emp_id">${sal.idsalary}</td>
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