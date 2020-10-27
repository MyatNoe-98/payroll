 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
	<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
      <%@ include file="/WEB-INF/jspf/navemp.jspf"%>

<body >
   <div class="container" style="margin-left:25%">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
               <form role="form" method="POST" action="<%=request.getContextPath()%>/user/saveLveforemp" modelAtribute="lve">
                	<legend class="text-center">Leave Form</legend>
                    	<fieldset>
                        	<legend>Details</legend>
                        	<div class="form-group col-md-6"> 
                        		<label for="emp_id">Employee Id</label>                      	  
							    <input type="text" class="form-control" value="${emp.emp_id}" name="emp_id" id="emp_id">
							   </div>
                        	
                        	<div class="form-group col-md-6">
                            	<label for="name">Name</label>                        		
							   <input type="text" class="form-control"value="${emp.emp_name}" name="name" id="name" placeholder=""> 
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