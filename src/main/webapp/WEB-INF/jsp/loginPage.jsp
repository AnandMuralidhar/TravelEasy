<!DOCTYPE html>
<html lang="en">
<head>
<title>loginPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
     content="19996480139-hbsng2ng7kfnl9cl4pil2a1m7ulr6pn9.apps.googleusercontent.com">


</head>

<style> 
#bdy {
    /* The image used */
    background-image: url("https://images.unsplash.com/uploads/141202616623001715bb7/c1b3b9b0?ixlib=rb-0.3.5&s=0ec689e4a4a33110315bd7846be5bb3e&auto=format&fit=crop&w=1094&q=80");
	
    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
}

#container1{
  font-family: "Gill Sans Extrabold", sans-serif;
  font-size: 20px;
  font-color: blue;
}

</style>



<body id="bdy"><center>
<div class="Login page" id="container1">

<h1><font font-family="Gill Sans Extrabold", sans-serif>"Live life with no excuses, travel with no regret"-  Oscar Wilde. </font></h1></br></br>

<h1>Login Page </h1></br></br>
<h1><font color= "red">${message}</font></h1>
<form method="POST" class="form-horizontal" action="/customlogin">
<p><b>User Name &ensp;
<input type="text" id="username" placeholder="Enter User name" name="username"  required></p>
<p><b>Password &ensp;
<input type="password" id="pwd" placeholder="Enter password" name="pwd" required></p>
<p></p></br>
<p><b>Select User Type: &ensp;</b></p>
 <input type="radio" name="role" value="user" checked> user&ensp;&ensp;
  <input type="radio" name="role" value="company">Travel Company
  <p></p>
<input type="submit" name="Login" value="Login">
<input type="submit" name="Cancle" value="Cancle"><br></br></br>
<a>To Sign In with google<div class="g-signin2" data-onsuccess="onSignIn"></div></a></br>
<a href="/userSignup"><h4><font color= "red">New User Register here</font></h4></a><a href="/companySignup"><h4><font color= "red">New Company Register here</font></h4></a>


<script>
	function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId());
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      console.log('id_token: ' + googleUser.getAuthResponse().id_token);

   
      var redirectUrl = 'glogin';
      //using jquery to post data dynamically
      var form = $('<form action="' + redirectUrl + '" method="post">' +
                          '<input type="text" name="id_token" value="' +
                           googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>');
    $('body').append(form);
    form.submit();
    }

	</script>

</form>
</div>
</center>
</body>
</html>





