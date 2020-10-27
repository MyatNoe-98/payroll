<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <%@ include file="/WEB-INF/jspf/header.jspf"%>
    <%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
    <%@ include file="/WEB-INF/jspf/navigation.jspf"%>
	
  <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}





/* Add padding and center-align text to the container */
.container {
  padding: 16px;
  text-align: center;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Modal Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}
</style>
<body>

<h2>Delete Modal</h2>



<div  style="margin-left:25%">
  <form role="form" method="POST" action="<%=request.getContextPath()%>/user/userdelete" modelAtribute="employee"  >
  <div class="form-group col-md-6">
                           <input type="text" path="id" value="${user.id}" class="form-control" name="id" id="id" placeholder="Id NO:" hidden>
                        </div>
    <div class="container">
      <h1>Delete Account</h1>
      
      <p>Are you sure you want to delete this account?</p>
    
      <div class="clearfix">
        <div class="btn-group" role="group" aria-label="Basic example">
  			<a href="<%=request.getContextPath()%>/user/viewuser" type="button" class="btn btn-secondary btn-lg">Cancel</a>
  			<button type="submit" class="btn btn-danger btn-lg">Delete</button>
  		</div>
      </div>
    </div>
  </form>
</div>

</body>
</html>
