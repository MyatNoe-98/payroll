<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
      <%@ include file="/WEB-INF/jspf/navemp.jspf"%>

	<body>
	
	    <div class="container" style="margin-left:25%" >
   <h3 id="form_header" class="text-primary" >Your Leaves Lists</h3>
   		
   		
  	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th >Id</th><th>Name</th><th>Start Date</th> <th>End Date</th><th>No: of Days</th><th>Leave Type</th><th>Reason</th>
	</tr>
    <c:forEach var="lve" items="${lve}">
    <tr>
    	<td path="emp_id">${lve.emp_id}</td>
    	<td>${lve.name}</td>
    	<td>${lve.startdate}</td>
    	<td>${lve.enddate}</td>
    	<td>${lve.day}</td>
    	<td>${lve.type}</td>
    	<td>${lve.reason}</td>
    	</tr>
    </c:forEach>
    </table>
   </div> 
	</body>
</html>
