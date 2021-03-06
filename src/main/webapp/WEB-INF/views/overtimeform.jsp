<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Date"%>
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
                <form role="form" method="POST" action="<%=request.getContextPath()%>/user/saveOvt" modelAtribute="ovt">
                	<legend class="text-center">Overtime Form</legend>
						<fieldset>
                        	<legend>Details</legend>
                        	<!-- <div class="form-group col-md-6">                        	
                            	<label for="emp_id">Employee Id</label>
                            	<input type="text" class="form-control" name="emp_id" id="emp_id" placeholder="">
                        	</div> -->
                        	
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
         						<label for="date">Date</label>
   						    	<input id="date" name="date" width="276" />
    							<script>
       											$('#date').datepicker({
           											 uiLibrary: 'bootstrap4'
        																	});
   								</script>
   							</div>
                       		<div class="form-group col-md-6 input-append bootstrap-timepicker-component">
                            	<label for="starttime">Start time</label>
                            	<input type="time" class="form-control timepicker " name="starttime" id="starttime" placeholder="--:--">
                           		<script >
  									$('#starttime').on('click', function() {
    								alert($('.timepicker').getTime());});
  									$('.timepicker').timepicker({
    											template : 'dropdown',
    												showInputs: false,
   														 showSeconds: false
 														 });
  									
  								</script>
						    </div>
                            <div class="form-group col-md-6 input-append bootstrap-timepicker-component">
                          		<label for="endtime">End time</label>
                            	<input type="time" class="form-control timepicker1" name="endtime" id="endtime" placeholder="--:--">
                            	<script >
  									$('#endtime').on('click', function() {
    								alert($('.timepicker1').getTime());
    								});
  									$('.timepicker1').timepicker({
    											template : 'dropdown',
    												showInputs: false,
   													showSeconds: false
 														 });
  									
  									$("#endtime").change(function () {
  									  var start=document.getElementById('starttime').value;
  									  var end=document.getElementById('endtime').value;  									
  	  									start = start.split(":");
  	  	                      	    	end = end.split(":");
  	  	                          	    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
  	  	                          	    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
  	  	                          	    var diff = endDate.getTime() - startDate.getTime();
  	  	                          	 	var msec = diff;
	  	                          	    var hh = msec/1000/60/60;
	  	                          	hh=hh.toFixed(1);
	  	                          	document.getElementById('hour').value=hh;                  	       
	  	                          // alert(hh);
  									});  									  														
							      </script>
						    </div>
						    <div class="form-group col-md-6">
						
                       			<label for="hour">Number of hours</label>
                        		<input type="text" class="form-control"   name="hour" id="hour"  placeholder="no. of hours"  >
                        	 
                        	</div>
                        	<button type="submit" class="btn btn-primary"> Submit</button>
                		</fieldset>
                 </form>
            </div>

        </div>
    </div>
    
</body>
</html>