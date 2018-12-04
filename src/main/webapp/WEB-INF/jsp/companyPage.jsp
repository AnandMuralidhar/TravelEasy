 <%@ page import ="java.util.ArrayList"%>
     <%@ page import ="com.traveleasy.model.Travelplan" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<title>Company Dashboard</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
	<body background="https://images.pexels.com/photos/386025/pexels-photo-386025.jpeg ">
	<h2>Welcome ${companyname} </h2>
	<div class="logout">
<form action="/logout" method="post">
 <input type="submit" name="logout" value="Logout">
</form>
</div>
	<h3> ${companymessage}</h3>
	<div class="container">
	<form method="POST" class="form-horizontal" action="/prediction">
	<div class="form-group">
	<input type="hidden" name="companyname" value="${companyname}">
	<input type="hidden" name="companyusername" value="${companyusername}">
	<label class="control-label col-sm-2" for="country">Country:</label>
				<div class="col-sm-10"> <input type="text" class="tripdata" name="country" placeholder="enter destination" required><br />
				</div>
			   <label class="control-label col-sm-2">Month:</label>
				<div class="col-sm-10">
				 <select class="tripdata" name="month" required>
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <option value="April">April</option>
                <option value="May">May</option>
                <option value="June">June</option>
                <option value="July">July</option>
                <option value="August">August</option>
                <option value="September">September</option>
                <option value="October">October</option>
                <option value="November">November</option>
                <option value="December">December</option>
                    
                 </select> <br />
                 <label class="control-label col-sm-2">Budget:</label>
				<div class="col-sm-10">
				 <input type="text" class="tripdata" name="budget" placeholder="enter budget" onkeypress="return isNumberKey(event)" required>
				</div>
				<button type="submit">Predict</button>
				</div>
	</div>
	</form>
	
		<form method="POST" class="form-horizontal" action="/traveldata"  enctype="multipart/form-data">
			<div class="form-group">
	<input type="hidden" name="companyname" value="${companyname}">
	<input type="hidden" name="companyusername" value="${companyusername}">
				<label class="control-label col-sm-2" for="file">Upload Itinerary:</label>
				<div class="col-sm-10">
					<input type="file" class="tripdata" name="itinerary" required><br />
				</div>
				<label class="control-label col-sm-2" for="file">Upload Image:</label>
				<div class="col-sm-10">
					<input type="file" class="tripdata" name="planimage" required><br />
				</div>
				<label class="control-label col-sm-2" for="country">Country:</label>
				<div class="col-sm-10"> <input type="text" class="tripdata" name="country" placeholder="enter destination" required><br />
				</div>
			   <label class="control-label col-sm-2">Month:</label>
				<div class="col-sm-10">
				 <select class="tripdata" name="month" required>
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <option value="April">April</option>
                <option value="May">May</option>
                <option value="June">June</option>
                <option value="July">July</option>
                <option value="August">August</option>
                <option value="September">September</option>
                <option value="October">October</option>
                <option value="November">November</option>
                <option value="December">December</option>
                    
                 </select> <br />
				</div>
				<label class="control-label col-sm-2">Plan name:</label>
				<div class="col-sm-10">
				 <input type="text" class="tripdata" name="plan" placeholder="enter unique plan name" required><br />
				</div>
				<label class="control-label col-sm-2">Budget:</label>
				<div class="col-sm-10">
				 <input type="text" class="tripdata" name="budget" placeholder="enter budget" onkeypress="return isNumberKey(event)" required>
				</div>
				<button type="submit">Submit</button>
			</div>
		</form>
	</div>
	<div class="companytravelplans">
			<form method="POST" action="/companytravelplans">
		<input type="hidden" name="companyname" value="${companyname}">
		<input type="hidden" name="companyusername" value="${companyusername}">
		<button type="submit">See your plans</button>
		</form>
	 <% 
 if(session.getAttribute("travelplan") != null)
 {
 ArrayList<Travelplan> a = (ArrayList<Travelplan>)request.getAttribute("travelplan"); 
 System.out.println("hi"); 
 %>
 <table class="dashboardtable">
					<thead class="dthead">
					<tr>
						<th>Plan</th>
						<th>Country</th>
						<th>Month</th>
						<th>Budget</th>
						<th>Itinerary Image</th>
						<th>Plan Image</th>
						<th>Delete</th>
						<th>Edit</th>
						</tr>
					</thead>
<tbody class="dtr">


<c:forEach items="${travelplan}" var="item">
 <tr>
	<td>${item.plan} </td>
	<td>${item.country}</td>
<td>${item.month}</td>
	<td>${item.budget}</td>
<td><a href="${item.itineraryimageurl}">Itinerary image</a></td>
<td><a href="${item.planimageurl}">Itinerary image</a></td>
	<td><form method="post" action="/travelplandelete">
	<input type="hidden" name="companyname" value="${companyname}">
		<input type="hidden" name="companyusername" value="${companyusername}">
		<input type="hidden" name="plan" value="${item.plan}">
	<button>Delete</button>
	</form></td>
	
<td>	<button onclick="editalert()" ><span class="glyphicon glyphicon-edit"></span></button></td>	
</tr>										
 </c:forEach>
</tbody>


</table>
 <% }
 else
 { %>
	 <div class="nofiles">
	 <p><%=session.getAttribute("notravelplans")%></p>
	</div>
  <% } %>
  </div>
	</body>
	<script>
	function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : event.keyCode
	    if (charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;
	    return true;
	}
	function editalert(){
		alert("Please upload the plan with same name to update!!!")
	}
	var message = $("h3").text();
	 var audio = new Audio('audio?msg=' + message);
     audio.play();
	
	</script>
	
</html>
<style>
.tripdata {
display: block;
}
</style>