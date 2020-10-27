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
                <form role="form" method="POST" action="<%=request.getContextPath()%>/user/calSalary" modelAtribute="calcu">
                	<legend class="text-center">Salary Calculation</legend>
						<fieldset>
                        	<legend>Details</legend>
                        	
						    <div class="form-group col-md-6">
         					    <label for="">From:</label>
   						        <input id="fromdate" name="fromdate" width="276" />
    							 <script>
       											$('#fromdate').datepicker({
           											 uiLibrary: 'bootstrap4'
        																	});
   								 </script>
            
  						</div>
  						<div class="form-group col-md-6">
         					<label for="">To:</label>
   						    <input id="todate" name="todate" width="276" />
    							 <script>
       											$('#todate').datepicker({
           											 uiLibrary: 'bootstrap4'
        																	});
       											
       											
   								 </script>
            
  						</div>
                        	<button type="submit" class="btn btn-primary"> Calculate</button>
                		</fieldset>
                 </form>
            </div>

        </div>
    </div>
    
</body>
</html>