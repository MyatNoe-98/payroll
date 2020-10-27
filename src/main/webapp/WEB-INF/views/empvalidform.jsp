<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
      <%@ include file="/WEB-INF/jspf/navemp.jspf"%>

	<body>
	
	    <div class="container" style="margin-left:25%">
	   		 <form role="form" method="POST" action="#" modelAtribute="employee"  >
	        	<h3 id="form_header" class="text-primary" >Welcome </h3>
	        	<div>&nbsp;</div>
	        	<input type="text" path="emp" value="${emp_id}" class="form-control" name="emp_id" id="employee_id" placeholder="Id NO:" hidden>
	        	
            </form>        
    	
	    </div>
	</body>
</html>
