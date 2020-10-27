<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>

	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
	<%@ include file="/WEB-INF/jspf/navigation.jspf"%>


<body>
<div class="container" style="margin-left:25%">
   <h3 id="form_header" class="text-primary" >Overtime Lists</h3>
   		
   		
  	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th >Id</th><th>Name</th><th>Date</th> <th>Start Time</th><th>End Time</th><th>No: of Hours</th>
	</tr>
    <c:forEach var="ot" items="${listOt}"> 
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