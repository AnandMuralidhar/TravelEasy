<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/resources/script.js"></script>
        
<title>Home Page</title>
<script type="application/javascript">

</script>
</head>
<body>
<h2>Welcome ${loggedUser.getUserfirstname()}</h2>
<div class="previoustravelplans">
<% 
 if(session.getAttribute("usertravelplans") != null)
 { 
 %>
 <table class="dashboardtable">
					<thead class="dthead">
						<th>Plan name</th>
						<th>Country</th>
						<th>Month</th>
						<th>Budget</th>
						<th>Post Review</th>
					</thead>
<tbody class="dtr">

 
<c:forEach items="${usertravelplans}" var="item">
<tr>
	<td>${item.plan} </td>
	<td>${item.country} </td>
	<td>${item.month} </td>
<td>${item.budget} </td>
<td><button></button></td></tr>
 </c:forEach>										
</tbody>

 
</table>
 
 else
 { %>
	 <div class="noplans">
	<% out.println("not travelled yet"); %>
	</div>
  <% } %>
 	</div>

<div>

<form method="GET"  action="/lex1">
<button type="submit" style="margin-left: 500px"
			class="btn btn-success">Lex</button> 
</form>

</div>
 </body>
 <style>
 .noplans {
 text-align: center;
 }
 </style>
 <script>
	var message = $("h2").text();
	 var audio = new Audio('audio?msg=' + message);
    audio.play();
 </script>
</html>
 