<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

${message}
<div class="container">
  <div style="text-align:center">

    <h2>Plan details</h2><br />
  

        <h4>Plan Name:  ${SpecificTravelPlan.plan} </h4><br />
  
        <h4>Country:  ${SpecificTravelPlan.country} </h4><br />
       
       <h4> Month:  ${SpecificTravelPlan.month} </h4><br /> 
       
       <h4> Budget:  ${SpecificTravelPlan.budget} </h4><br /> 
       <a href="/selectPlan?travelPlan=${SpecificTravelPlan}">Select This Plan</a>
    </div>
    
    <input type="hidden" id="plan" value="${SpecificTravelPlan.plan}">
    
    
<button type="submit" id="getreviews" class="getreviews" onClick="getreviews('${SpecificTravelPlan.plan}')" >Reviews</button>

</div>
<div id="displayreviews"></div>
    



</body>
<script>

function getreviews(plan) {
	 $.get("test",{plan:plan},function(data){

    $("#displayreviews").html(data);
	 
    });
} 

</script>
</html>
