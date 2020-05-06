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
    <title>Mediplus - Appointment</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  	<div class="py-1 bg-black top">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
						    <p class="mb-0 register-link"><a href="#" class="mr-3">Sign Up</a><a href="#">Sign In</a></p>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
     <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Mediplus</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="index.jsp" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="Logincheck.jsp" class="nav-link"><span>Admin Login</span></a></li>
	          <li class="nav-item"><a href="PatientMain.jsp" class="nav-link"><span>Patient</span></a></li>
	          <li class="nav-item"><a href="#doctor-section" class="nav-link"><span>Doctors Login</span></a></li>
	          <li class="nav-item"><a href="#blog-section" class="nav-link"><span>Accountant Login</span></a></li>
	          <li class="nav-item"><a href="#contact-section" class="nav-link"><span>Contact</span></a></li>
	          <li class="nav-item cta mr-md-2"><a href="appointmentdet.jsp" class="nav-link">Appointment details</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	 <div>
	  </div>
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
										
									<div class="name">First name </div>
						
									<input class="form-control" type="text" name="fName  " id="fName_form">
					
									<div class="name">Last Name</div>
									
									<input class="form-control" type="text" name="lName " id="lName_form">
					

						
							<script type="text/javascript" src="jquery.js"></script>

<script>
    $(function() {
          $("#type").change(function(){
          var option = $('option:selected', this).attr('type');
          $('#type').val(option);
       });
    });
</script>
								
						
							<div class="name">Type</div>
							
											
											 <select name="type" id="type_form" class="form-control">
	                      	<option value="1">Select Your Services</option>
	                        <option value="2">Neurology</option>
	                        <option value="3">Cardiology</option>
	                        <option value="4">Dental</option>
	                        <option value="5">Ophthalmology</option>
	                        <option value="6">Other Services</option>
	                      </select>

							<div class="name">Phone</div>
							
									<input class="form-control" type="number" name="phone" id="phone_form">

							<div class="name">Date</div>
							
								
							<input class="form-control" type="date" name="date" id="date_form">
							

							<div class="name">time</div>
									<input class="form-control" type="time" name="time" id="time_form">
					

							<div class="name">Password</div>
									<input class="form-control" type="text" name="message" id="message_form">

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