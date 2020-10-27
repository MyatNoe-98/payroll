<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
      <%@ include file="/WEB-INF/jspf/navemp.jspf"%>

	<body>
	
	   <div class="container" style="margin-left:25%">
   <h3 id="form_header" class="text-primary" >Your Overtime Lists</h3>
   		
   		
  	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th >Id</th><th>Name</th><th>Date</th> <th>Start Time</th><th>End Time</th><th>No: of Hours</th>
	</tr>
    <c:forEach var="ot" items="${ot}"> 
    <tr>
    	<td path="emp_id">${ot.emp_id}</td>
    	<td>${ot.name}</td>
    	<td>${ot.date}</td>
    	<td>${ot.starttime}</td>
    	<td>${ot.endtime}</td>
    	<td>${ot.hour}</td>
    </tr>
    </c:forEach>
    </table>
   </div> 
	</body>
</html>
