<%@page import="model.PatientRegister"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
//Delete item----------------------------------
if (request.getParameter("PID") != null) {
	PatientRegister itemObj = new PatientRegister();
	String stsMsg = itemObj.deleteItem(request.getParameter("PID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<%
	//Update item---------------------------------
	if (request.getParameter("Pcode") != null) { //`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`
		PatientRegister itemObj = new PatientRegister();
		String stsMsg = itemObj.updateItem(request.getParameter("Pcode"), request.getParameter("PName"),
				request.getParameter("PNIC"), request.getParameter("PhoneNo"), request.getParameter("Email"),
				request.getParameter("Address"), request.getParameter("Password"), request.getParameter("PID_form"));
		session.setAttribute("statusMsg", stsMsg);
	}
%> 


<!DOCTYPE html>
<html>
<head>
<title>Patient details</title>
<meta charset="ISO-8859-1">
 <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">
    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Pharmacist details</title>
</head>
<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="adminHome.html"> Go To Admin Home <span class="sr-only">(current)</span>
			</a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>
<br>
<br>
<br>
<br>
<body>


<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1"  aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Patient Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
       
      
       
        
        <!-- Modal body -->
        <div class="modal-body">          
          
          <form method="POST" action="pRedirectUpdate">
          
          							<div class="name">Patient ID</div>
          							
         						 	<input type="hidden" id="PID_form" name="PID_form"/>
										
									<div class="name">Patient code</div>
						
									<input class="form-control" type="text" name="Pcode" id="Pcode_form">
					
									<div class="name">Name</div>
									
									<input class="form-control" type="text" name="PName" id="PName_form">
					

						
							<div class="name">NIC Number</div>
							
									<input class="form-control" type="text" name="PNIC" id="PNIC_form">
								
						
							<div class="name">Phone Number</div>
							
											<input class="form-control" type="text" name="PhoneNo" id="PhoneNo_form">

							<div class="name">Email</div>
							
								
							<input class="form-control" type="email" name="Email" id="Email_form">
							

							<div class="name">Address</div>
									<input class="form-control" type="text" name="Address" id="Address_form">
					

							<div class="name">Password</div>
									<input class="form-control" type="password" name="Password" id="Password_form">

						<div>
							<button class="update_btn btn-primary" type="submit"
					
								value="Save">Update</button>
					</div>
					<div>
					
						 <button  class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
        </div>
        
  
      </div>
      
 
    </div>
  </div>
      </div>

 
   
	<%
		PatientRegister  phobj = new PatientRegister();
	out.print( phobj.readItems());
	%>
	<script >
	$(document).ready(function() {

		  $('a[data-toggle=modal], button[data-toggle=modal]').click(function () {
	
		    var data_id = '';
		    
		    if (typeof $(this).data('id') !== 'undefined') {

		      data_id = $(this).data('id');
		    }
		    
		    $('#PID_form').val(data_id);
		    $('#Pcode_form').val($(this).data('todo').Pcode);
		    $('#PName_form').val($(this).data('todo').PName);
		    $('#PNIC_form').val($(this).data('todo').PNIC);
		    $('#PhoneNo_form').val($(this).data('todo').PhoneNo);
		    $('#Email_form').val($(this).data('todo').Email);
		    $('#Address_form').val($(this).data('todo').Address);
		    $('#Password_form').val($(this).data('todo').Password);
		    
		  })
		});
	</script>
	
</body>
</html>