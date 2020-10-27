<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
	
<%@ include file="/WEB-INF/jspf/header.jspf"%>

	<body>
	
	    <div class="container">
	        <h3 id="form_header" class="text-warning" align="center">Login</h3>
	        <div>&nbsp;</div>
	
	        <!-- User input form to validate a user -->
	        <c:url var="validateUrl" value="/user/validate" />
	        <form id="user_form" action="${validateUrl}" method="POST">
	            <div class="form-group">
	                <label for="name">Username:</label>
	                <input type="text" class="form-control" id="name" placeholder="Enter username" name="username" required>
	            </div>
	            <div class="form-group">
	                <label for="pwd">Password:</label>
	                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" required>
	            </div>
	             <div class="form-group">
	              <input type="checkbox"  id="isadmin" name="isadmin">&nbsp;<label for="isadmin">Is Admin</label>
	               
	            </div>
	            <button id="confirm_user" type="submit" class="btn btn-primary">Login</button>
	        </form>
	    </div>
	</body>
</html>