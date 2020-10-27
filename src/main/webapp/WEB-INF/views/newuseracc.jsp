<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
      <%@ include file="/WEB-INF/jspf/navigation.jspf"%>
	
<body >


 <div class="container" style="margin-left:25%">
        <div class="row">

            <div class="col-md-8 col-md-offset-2">
                <form role="form" method="POST" action="<%=request.getContextPath()%>/user/saveUser" modelAtribute="user"  >
					<legend class="text-center">User Register</legend>
						<legend>Account Details</legend>
						<div class="form-group col-md-6"> 
                        		<label for="employee_id">Employee Id</label>                      	  
							    <select class="form-control" name="employee_id" id="employee_id">
							     <c:forEach var="emp" items="${listEmp}">
       										 <option value="${emp.emp_id}">${emp.emp_id}</option>
    								</c:forEach>
							    </select>
							    <script>
							    $("#employee_id").change(function () {
									  var start=document.getElementById('employee_id').value;									 									
	  									document.getElementById('emp_id').value=start; 
	  	                          		
									});  		
							    </script>
						    </div>	    
                        	<div class="form-group col-md-6">                   		
                            	<input type="text" class="form-control" name="emp_id" id="emp_id" placeholder="" hidden>
                        	</div>

                        <div class="form-group col-md-6">
                        
                            <label for="name">User Name</label>
                            <input type="text" class="form-control" name="name" id="name" placeholder="Name">
                        </div>
                        
						<div class="form-group col-md-6">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="password">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="re-pwd">Re-type Password</label>
                            <input type="password" class="form-control" name="re-pwd" id="re-pwd" placeholder="retype-password">
                        </div>
                        <div class="form-group col-md-6">
	              			<input type="checkbox"  id="isadmin" name="isadmin">&nbsp;<label for="isadmin">Is Admin</label>
	              			<script>
  						 $(document).ready(function(){
  					        $('input[type="checkbox"]').click(function(){
  					            if($(this).prop("checked") == true){
  					            	var isadmin=1;
  					            	document.getElementById('isadmin').value=isadmin;
  					                console.log("Checkbox is checked.");
  					            }
  					            
  					        });
  					    });
  						</script>
	               		</div>
                    	<div class="form-group col-md-12">
                        	<button type="submit" class="btn btn-primary">
                                Register
                            </button>

                    	</div>

                </form>
            </div>

        </div>
    </div>
    
</body>
</html>