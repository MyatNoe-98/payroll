<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>

<%@ include file="/WEB-INF/jspf/header.jspf"%>
<%@ include file="/WEB-INF/jspf/sidebar.jspf"%>
<%@ include file="/WEB-INF/jspf/navigation.jspf"%>
<style>.logo-small {
  color: #f4511e;
  font-size: 50px;
}

.logo {
  color: #f4511e;
  font-size: 200px;
}</style>
<body>
<div class="container" style="margin-left:25%">
<div class="container-fluid bg-grey">
  <h2 class="text-center text-primary">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Yankin, Yangon</p>
      <p><i class="glyphicon glyphicon-phone-alt"></i> +95 9775764365</p>
      <p><span class="glyphicon glyphicon-envelope"></span> mteoo1220@gmail.com</p>
    </div>
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>
<img src="/SpringMvcHibernate/img/ymj.jpg" style="width:100%">



</div>
</body>
</html>