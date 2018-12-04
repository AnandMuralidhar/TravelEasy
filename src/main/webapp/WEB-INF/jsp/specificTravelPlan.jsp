<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/javascript">
 function getreviews() {
	 var planname = $("#planname").val(); 
	 alert("hi");
	
	 $.get("retrievereviews",{planname:planname},function(data){

     $("#displayreviews").html(data);
	 
     });
 }

</script>
<style>
body {
  font-family: Times New Roman, Times, serif;
}

* {
    box-sizing: border-box;
}

/* Style inputs */
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

/* Style the container/contact section */
.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 10px;
}

/* Create two columns that float next to eachother */
.column {
    float: centre;
    width: 100%;
    margin-top: 6px;
    margin-left: 60px
    padding: 50px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

</style>
</head>
<body>


<div class="container">
  <div style="text-align:center">
    <h2>Plan details</h2><br />
  

        <h4>Plan Name:  ${SpecificTravelPlan.plan} </h4><br />
  
        <h4>Country:  ${SpecificTravelPlan.country} </h4><br />
       
       <h4> Month:  ${SpecificTravelPlan.month} </h4><br /> 
       
       <h4> Budget:  ${SpecificTravelPlan.budget} </h4><br /> 
    </div>
    
    <input type="hidden" id="planname" value="${SpecificTravelPlan.plan}">
<button type="submit" id="getreviews" class="getreviews" onClick="getreviews()" >Reviews</button>
<div id="displayreviews"></div>
    
</div>


</body>
</html>
