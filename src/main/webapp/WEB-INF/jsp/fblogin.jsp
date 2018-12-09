<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
</head>
<body>
<center>
<h1>Login Page</h1> 
<script>
 function statusChangeCallback(response) {
 console.log('statusChangeCallback');
 console.log(response);
 if (response.status === 'connected') {
 testAPI();
 } else if (response.status === 'not_authorized') {
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 } else {
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 }
 }

 function checkLoginState() {
 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 }
 window.fbAsyncInit = function() {
 FB.init({ 
 appId : '1356918617772175',
 cookie : true, 
 
 xfbml : true,
 version : 'v3.2' 
 });

 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 };

 (function(d, s, id) {
 var js, fjs = d.getElementsByTagName(s)[0];
 if (d.getElementById(id)) return;
 js = d.createElement(s); js.id = id;
 js.src = "//connect.facebook.net/en_US/sdk.js";
 fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk')); 
 function testAPI() { 
 console.log('Welcome! Fetching your information.... ');
 FB.api('/me?fields=name,email', function(response) {
 console.log('Successful login for: ' + response.name); 
 
 document.getElementById("status").innerHTML = '<p>Welcome '+response.name+'! <a href=userdashboard.jsp?user_name='+ response.name.replace(" ", "_") +'&user_email='+ response.email +'>Continue with facebook login</a></p>'
 });
 } 
</script> 
<br><br>
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
<div id="status">
</div> 
 <script type="text/javascript">
</script>
</center>
</body>
</html>