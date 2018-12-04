<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 280px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}
</style>
</head>
<body>


  <c:forEach items="${Travelplans}" var="item">
	<div class="gallery">
  <a target="_blank" href="${item.planimageurl}">
    <img src="${item.planimageurl}" alt="Cinque Terre" width="500" height="350">
    
  </a>
  <div class="desc">${item.plan}</div>
  <div class="desc"><a href="/getTravelPlanByName?planName=${item.plan}">View</a>                 
  <a href="/getTravelPlanByName?planName=${item.plan}">Download</a></div>
  </div>

   </c:forEach>


</body>
</html>