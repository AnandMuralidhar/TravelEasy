<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.ArrayList"%>
     <%@ page import ="com.traveleasy.model.Reviews" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 <%    String username = request.getParameter("username");
String plan = request.getParameter("plan"); 
%>
<h3>${message}</h3>
<div class="container">
<form method="POST" class="form-horizontal" action="/postreview"  enctype="multipart/form-data">

				
				<input type="hidden" name="useremailid" value="<%=username%>">
				<input type="hidden" name="plan" value="<%=plan%>">
				<label class="control-label col-sm-2" for="file">Upload Image:</label>
				<div class="col-sm-10">
					<input type="file" class="review" name="reviewimage" required><br />
				</div>
				<label class="control-label col-sm-2" for="comments">Comments:</label>
				<div class="col-sm-10">
				<input type="text" class="review" name="comments" placeholder="enter comments..." required><br />
   </div>
   <button type="submit">Post Review</button>
   
  
</form>
<div class="oldreviews">
<% 
 if(session.getAttribute("reviews") != null)
 {
 ArrayList<Reviews> reviews = (ArrayList<Reviews>)session.getAttribute("reviews"); 
 System.out.println(reviews); 
 %>

<c:forEach items="${reviews}" var="item">
 
	<p>${item.plan} </p>
	<p>${item.comment} </p>
	<img src="${item.imageurl}" alt="" /> 		
 </c:forEach>

 <% 
  }
 else
 { %>
	 <div class="noreviews">

	</div>
  <% } %>
</div>
 </div>
</body>
</html>