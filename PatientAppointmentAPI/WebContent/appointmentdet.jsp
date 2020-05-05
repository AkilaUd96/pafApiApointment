<%@page import="model.appointment"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
//Delete item----------------------------------
if (request.getParameter("AID") != null) {
	appointment itemObj = new appointment();
	String stsMsg = itemObj.deleteItem(request.getParameter("AID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<%
	//Update item---------------------------------
	if (request.getParameter("fName") != null) { //`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`
		appointment itemObj = new appointment();
		String stsMsg = itemObj.updateItem(request.getParameter("fName"), request.getParameter("lName"),
				request.getParameter("type"), request.getParameter("phone"), request.getParameter("date"),
				request.getParameter("time"), request.getParameter("message"), request.getParameter("AID_form"));
		session.setAttribute("statusMsg", stsMsg);
	}
%> 
<!DOCTYPE html>
<html>
<head>
<title>Appointment Details</title>
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
<div class="modal" id="exModal" tabindex="-1"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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
          
          <form method="POST" action="aRedirectUpdate">
          
          							<div class="name">appointment ID</div>
          							
         						 	<input type="hidden" id="AID_form" name="AID"/>
										
									<div class="name">First name code</div>
						
									<input class="form-control" type="text" name="fName  " id="fName_form">
					
									<div class="name">Name</div>
									
									<input class="form-control" type="text" name="lName " id="lName_form">
					

						
							<div class="name">NIC Number</div>
							
									<input class="form-control" type="text" name="PNIC" id="PNIC_form">
								
						
							<div class="name">Phone Number</div>
							
											
											 <select name="type" id="type_form" class="form-control">
	                      	<option value="">Select Your Services</option>
	                        <option value="">Neurology</option>
	                        <option value="">Cardiology</option>
	                        <option value="">Dental</option>
	                        <option value="">Ophthalmology</option>
	                        <option value="">Other Services</option>
	                      </select>

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
		appointment  phobj = new appointment();
	out.print( phobj.readItems());
	%>
	<script>
	$(document).ready(function() {

		  $('a[data-toggle=modal], button[data-toggle=modal]').click(function () {
	
		    var data_id = '';
		    
		    if (typeof $(this).data('id') !== 'undefined') {

		      data_id = $(this).data('id');
		    }
		    
		    $('#AID_form').val(data_id);
		    $('#fName_form').val($(this).data('todo').fName);
		    $('#lName_form').val($(this).data('todo').lName);
		    $('#type_form').val($(this).data('todo').type);
		    $('#phone_form').val($(this).data('todo').phone);
		    $('#date_form').val($(this).data('todo').date);
		    $('#time_form').val($(this).data('todo').time);
		    $('#message_form').val($(this).data('todo').messege);
		    
		  })
		});
	</script>
	
</body>
</html>