
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/jspf/header.jspf"%>
<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
<%@ include file="/WEB-INF/jspf/navigation.jspf"%>


<body>
<div class="container" style="margin-left:25%">
   <h3 id="form_header" class="text-primary" >Employees Lists</h3>
   		
   		
  	<table border="2" width="70%" cellpadding="2">
	<tr>
		<th >Id</th><th>Name</th><th>NRC</th> <th>Phone</th><th>Email</th><th>Birth Date</th>
		<th>Address</th><th>Basic Salary</th><th>Marital Status</th><th>Children</th><th>Parent</th><th>Edit</th>
		
	</tr>
    <c:forEach var="emp" items="${listEmp}"> 
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
    	<td><a type="button" class="btn btn-outline-info btn-sm" href="UpdateEmpform/${emp.emp_id}">Edit</a><a type="button" class="btn btn-outline-danger btn-sm" href="deleteEmpform/${emp.emp_id}">Delete</a></td>
	</tr>
    </c:forEach>
    </table>
   </div> 
</body>
</html> 