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
	<style>
	.post {
display: block;
margin-left: 38%;
}
input[type=text] {
    display: block;
}
.post-container {
    margin: auto;
    width: 30%;
    padding: 10px;
    text-align: center;
    
}
label {
  display: inline-block;
  width: 140px;
  text-align: right;
  float: left;
}​
	</style>
</head>
<body>
 <%    String username = request.getParameter("username");
 System.out.println(username);
String plan = request.getParameter("plan"); 
%>
<h3>${message}</h3>
<div class="post-container">
<form method="POST" class="form-horizontal" action="/postreviews"  enctype="multipart/form-data">				
				<input type="hidden" name="username" value="<%=username%>">
				<input type="hidden" name="plan" value="<%=plan%>">
				<label for="file">Upload Image:</label>
				<div class="post">
					<input type="file" class="review" name="reviewimage" required><br />
				</div>
				<label for="comments">Comments:</label>
				<div class="post">
				<input type="text" class="review" name="comments" placeholder="enter comments..." required><br />
   </div>
   <button type="submit">Post Review</button>
   
  
</form>
</div>
<div class="oldreviews" style="width: 100%;">
<% 
 if(session.getAttribute("reviews") != null)
 {
 ArrayList<Reviews> reviews = (ArrayList<Reviews>)session.getAttribute("reviews"); 
 System.out.println(reviews); 
 %>

<% 
for(Reviews r : reviews) 
{ %>
<div class="dynamicreviews" style="width: 30%; padding:2%; float: left;" >
	<img src="<%=r.getImageUrl()%>" alt="" height="300" width="300"/><br />
	<% out.println(r.getPlan()); %><br />
	<%out.println(r.getComment()); %>


										
</div>
	 
 <% }
  }
 else
 { %>
	 <div class="noreviews">

	</div>
  <% } %>
</div>
</body>
</html>