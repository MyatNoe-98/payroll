
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/jspf/header.jspf"%>
<%@ include file="/WEB-INF/jspf/sideemp.jspf"%>
<%@ include file="/WEB-INF/jspf/navemp.jspf"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
img {
    max-width: 100%;
    height: auto;
}

.item {
    width: 120px;
    min-height: 120px;
    max-height: auto;
    float: left;
    margin: 3px;
    padding: 3px;
}
</style>

<body>
<div class="container" style="margin-left:25%">
<div class="about-section">
  <h1>Pay Roll</h1>
  <p>Hello. I am Myat Noe Oo.</p>
  
</div>

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
    <div  class="item">
        <img src="/SpringMvcHibernate/img/mno.jpg" alt="mno" ></div>
            <div class="container">
        <h2>Myat Noe Oo</h2>
        <h1>5CS-17</h1>
        <p>University Of Computer Studies (Maubin)</p>
        <p class="title">Creator</p>
        <p> I am Self-motivated and quick learner. </p>
        <p>mteoo1220@gmail.com</p>
        <p></p>
      </div>
    </div>
  </div>
  
</div>
</div>
</body>
</html>
 
 
  
</div>
</div>
</body>
</html>
 