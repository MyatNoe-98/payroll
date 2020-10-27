<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>

	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
	<%@ include file="/WEB-INF/jspf/navigation.jspf"%>


<body>
<div class="container" style="margin-left:25%">
   <h3 id="form_header" class="text-primary" >Leave Lists</h3>
   		
   		
  	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th >Id</th><th>Name</th><th>Start Date</th> <th>End Date</th><th>No: of Days</th><th>Leave Type</th><th>Reason</th>
	</tr>
    <c:forEach var="leave" items="${listleave}"> 
    <tr>
    	<td path="emp_id">${leave.emp_id}</td>
    	<td>${leave.name}</td>
    	<td>${leave.startdate}</td>
    	<td>${leave.enddate}</td>
    	<td>${leave.day}</td>
    	<td>${leave.type}</td>
    	<td>${leave.reason}</td>
    	</tr>
    </c:forEach>
    </table>
   </div> 
</body>
</html> 