<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<head>

</head>
<body>
<% String user_name=(String)request.getParameter("user_name");
String user_email=(String)request.getParameter("user_email"); %>

<%=user_name %>
 <%=user_email %>
 </body>
 
</html>
 