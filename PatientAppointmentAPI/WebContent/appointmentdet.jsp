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
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Update Appointment Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">          
          
          <form method="POST" action="/aRedirectUpdate">
          	<input type="hidden" id="AID_form" name="AID_form"/>
						<div class="form-row m-b-55">
							<div class="name">Patient code</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="fName" id="fName_form">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Name</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="lName" id="lName_form">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">NIC Number</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="type" id="type_form">
								</div>
							</div>
						</div>
						<div class="form-row m-b-55">
							<div class="name">Phone Number</div>
							<div class="value">
								<div class="row row-refine">
									<div class="col-9">
										<div class="input-group-desc">
											<input class="form-control" type="text" name="phone" id="phone_form">
	                                        
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Email</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="email" name="date" id="date_form">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Address</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="time" id="time_form">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Password</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="password" name="message" id="message_form">
								</div>
							</div>
						</div>

						<div>
							<button class="btn btn-primary" type="submit"
								value="Save">Update</button>


						</div>
					</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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