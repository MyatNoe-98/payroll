
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/jspf/header.jspf"%>
<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
<%@ include file="/WEB-INF/jspf/navigation.jspf"%>


<body>
<div class="container" style="margin-left:25%">
   <h3 id="form_header" class="text-primary" >User Lists</h3>
   		
   		
  	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th>User Id</th><th>Name</th><th>Password</th> <th>Is Admin</th><th>Employee Id</th><th>Edit</th>
		
	</tr>
    <c:forEach var="user" items="${listUser}"> 
    <tr>
        <td>${user.id}</td>
    	<td >${user.name}</td>
    	<td>${user.password}</td>
    	<td>${user.isadmin}</td>
    	<td>${user.emp_id}</td>
    	<td><a type="button" class="btn btn-outline-danger btn-sm" href="deleteUser/${user.id}">Delete</a></td>
	</tr>
    </c:forEach>
    </table>
   </div> 
</body>
</html> 