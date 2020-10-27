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
                <form role="form" method="POST" action="<%=request.getContextPath()%>/user/saveEmp" modelAtribute="employee"  >

                    <legend class="text-center">Employee Register</legend>

                    <fieldset>
                        <legend>Account Details</legend>

                        <div class="form-group col-md-6">
                            <label for="emp_name">Name</label>
                            <input type="text" class="form-control" name="emp_name" id="emp_name" placeholder="Name">
                        </div>
						<div class="form-group col-md-6">
                            <label for="NRC">NRC</label>
                            <input type="text" class="form-control" name="NRC" id="NRC" placeholder="00/ABC(N)123456">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="phone">Phone Number</label>
                            <input type="text" class="form-control" name="phone" id="phone" placeholder="0912345678">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control email" name="email" id="" placeholder="Email">
                        </div>
                        <div class="form-group col-md-6">
         					<label for="birthdate">Birth Date</label>
   						    
   						    <input id="birthdate" name="birthdate" width="276" />
    							 <script>
       											$('#birthdate').datepicker({
           											 uiLibrary: 'bootstrap4'
        																	});
   								 </script>
            
  						</div>
                         
                        

                        <div class="form-group col-md-12">
                            <label for="address">Address</label>
                            <textarea class="form-control" id="address" name="address"></textarea>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="basicsalary">Basic Salary</label>
                            <input type="text" class="form-control" name="basicsalary" id="basicsalary" placeholder="Basic Salary" required>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="marital">Marital Status</label><br>
                           
                            <div class="custom-control custom-radio custom-control-inline">
                            <script type="text/javascript">
    function ShowHideDiv() {
        var chkYes = document.getElementById("married");
        var dvPassport = document.getElementById("dvPassport");
        dvPassport.style.display = chkYes.checked ? "block" : "none";
    }
</script>
         						<input type="radio" id="single" name="marital" class="custom-control-input" onclick="ShowHideDiv()" value="single" >
            						<label class="custom-control-label" for="single">Single</label>
      						</div>
      						<div class="custom-control custom-radio custom-control-inline">
         							<input type="radio" id="married" name="marital" class="custom-control-input" onclick="ShowHideDiv()" value="married">
           						    <label class="custom-control-label" for="married">Married</label>
      						</div>
                          
                        <div id="dvPassport" style="display: none">
                            <label for="children">Number of children</label>
                            <input type="text" class="form-control" name="children" id="children" placeholder="no. of children" value="0">
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="parent">Parent</label>
                            <input type="text" class="form-control" name="parent" id="parent" placeholder="" value="0">
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary">
                                Register
                            </button>
                        </div>
                    </div>

                </form>
            </div>

        </div>
    </div>
    
</body>
</html>