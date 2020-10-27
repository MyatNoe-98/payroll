<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>
    <%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
    <%@ include file="/WEB-INF/jspf/navigation.jspf"%>
	
<body >


 <div class="container" style="margin-left:25%">
        <div class="row">

            <div class="col-md-8 col-md-offset-2">
            
                <form role="form" method="POST" action="<%=request.getContextPath()%>/user/empupdate" modelAtribute="employee"  >

                    <legend class="text-center">Employee Edit</legend>
					
                    <fieldset>
                        <legend>Account Details</legend>
						<div class="form-group col-md-6">

                            <input type="text" path="emp_id" value="${emp.emp_id}" class="form-control" name="emp_id" id="emp_id" placeholder="Id NO:">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="emp_name">Name</label>
                            <input type="text" class="form-control" value="${emp.emp_name}" name="emp_name" id="emp_name" path="emp_name" placeholder="name">
                        </div>
						<div class="form-group col-md-6">
                            <label for="NRC">NRC</label>
                            <input type="text" class="form-control" value="${emp.NRC}" name="NRC" id="NRC" path="NRC" placeholder="00/ABC(N)123456">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="phone">Phone Number</label>
                            <input type="text" class="form-control" value="${emp.phone}" name="phone" id="phone" path="phone" placeholder="0912345678">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="">Email</label>
                            <input type="email" class="form-control email" value="${emp.email}" name="email" id="email" path="email" placeholder="Email">
                        </div>
                        <div class="form-group col-md-6">
         					<label for="birthdate">Birth Date</label>
   						    
   						    <input id="birthdate" width="276" name="birthdate" path="birthdate" value="${emp.birthdate}"/>
    							 <script>
       											$('#birthdate').datepicker({
           											 uiLibrary: 'bootstrap4'
        																	});
   								 </script>
            
  						</div>
  						<div class="form-group col-md-12">
                            <label for="address">Address</label>
                            <textarea class="form-control" id="address" value="" name="address"  path="address">${emp.address}</textarea>
                        </div> <div class="form-group col-md-6">
                            <label for="basicsalary">Basic Salary</label>
                            <input type="text" class="form-control" value="${emp.basicsalary}" name="basicsalary" id="basicsalary" path="basicsalary" placeholder="Salary" required>
                        </div>

                        <div class="form-group col-md-6">
                           <label for="marital">Marital Status</label><br>
                            <div class="form-group col-md-6">
                            <input type="text" class="form-control" value="${emp.marital}" name="marital" id="marital" path="marital" placeholder="single(or)married" required>
                            </div>
                           
                            <div >
                            <label for="children">Number of children</label>
                            <input type="text" class="form-control" value="${emp.children}" name="children" id="children" path="children" placeholder="no. of children">
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="parent">Parent</label>
                            <input type="text" class="form-control" value="${emp.parent}" name="parent" id="parent" path="parent" placeholder="">
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary">
                                Update
                            </button>
                        </div>
                    </div>

                </form>
            </div>

        </div>
    </div>
    
</body>
</html>