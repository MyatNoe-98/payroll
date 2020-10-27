 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
               <form role="form" method="POST" action="<%=request.getContextPath()%>/user/saveLve" modelAtribute="lve">
                	<legend class="text-center">Leave Form</legend>
                    	<fieldset>
                        	<legend>Details</legend>
                        	<div class="form-group col-md-6"> 
                        		<label for="employee_id">Employee Id</label>                      	  
							    <select class="form-control" name="employee_id" id="employee_id">
							     <c:forEach var="emp" items="${listEmp}">
       										 <option value="${emp.emp_id}:${emp.emp_name}">${emp.emp_id}</option>
    								</c:forEach>
							    </select>
							    <script>
							    $("#employee_id").change(function () {
									  var start=document.getElementById('employee_id').value;									 									
	  									start = start.split(":");	  	
	  									document.getElementById('emp_id').value=start[0]; 
	  	                          		document.getElementById('name').value=start[1];                  	       
	  	                          // alert(hh);
									});  		
							    </script>
						    </div>	    
                        	<div class="form-group col-md-6">                   		
                            	<input type="text" class="form-control" name="emp_id" id="emp_id" placeholder="" hidden>
                        	</div>
                        	<div class="form-group col-md-6">
                            	<label for="name">Name</label>                        		
							    <input type="text" class="form-control" name="name" id="name" placeholder=""> 
                       		</div>
							<div class="form-group col-md-6">
         					    <label for="">Start Date</label>
   						        <input id="startdate" name="startdate" width="276" />
    							 <script>
       											$('#startdate').datepicker({
           											 uiLibrary: 'bootstrap4'
        																	});
   								 </script>
            
  						</div>
  						<div class="form-group col-md-6">
         					<label for="">End Date</label>
   						    <input id="enddate" name="enddate" width="276" />
    							 <script>
       											$('#enddate').datepicker({
           											 uiLibrary: 'bootstrap4'
        																	});
       											
       											$("#enddate").change(function () {
       		  									  var start=document.getElementById('startdate').value;
       		  									  var end=document.getElementById('enddate').value; 
       		  									  var sdate=new Date(start);
       		  									  var edate=new Date(end);
       		  									  var diff = new Date(edate - sdate);
       		  								      var days = diff/1000/60/60/24;
       		  								      document.getElementById('day').value=days; 
       		  									 
       											});  
   								 </script>
            
  						</div>
  						<div class="form-group col-md-6">
  						Half Day Leave: <input type="checkbox" id="myCheck">
  						<script>
  						 $(document).ready(function(){
  					        $('input[type="checkbox"]').click(function(){
  					            if($(this).prop("checked") == true){
  					            	var days=0.5;
  					            	document.getElementById('day').value=days;
  					                console.log("Checkbox is checked.");
  					            }
  					            
  					        });
  					    });
  						</script>
  						</div>
  						<div class="form-group col-md-6">
                            <label for="day">Number of days</label>
                            <input type="text" class="form-control" name="day" id="day" placeholder="no. of days">
                            
                        </div>
  						<div class="form-group col-md-6">
                            <label for="type">Leave Type</label>
                            <select class="form-control" name="type" id="type">
                                <option value="Sick Leave">Sick Leave</option>
                                <option value="Casual Leave">Casual Leave</option>
                                <option value="Unpaid Leave">Unpaid Leave</option>
                                <option value="Half Day Leave">Half Day Leave</option>
                                <option value="other" >Other</option>
                            </select>
                        </div>
                        <div class="form-group col-md-12 ">
                            <label for="reason">Reason</label>
                            <textarea class="form-control" id="reason" name="reason"></textarea>
                        </div> 
                        <div class="form-group col-md-6">
                            <button type="submit" class="btn btn-primary">
                                Submit
                            </button>
                        </div>
                     </fieldset>
                 </form>
            </div>

        </div>
    </div>
    
</body>
</html>