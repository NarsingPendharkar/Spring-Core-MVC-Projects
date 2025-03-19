<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

// Fetch doctors from database
DoctorDao dao = new DoctorDao(DBConnect.getConn());
List<Doctor> doctors = dao.getAllDoctor();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.form-control {
	border-radius: 5px;
}

.btn-custom {
	background-color: #28a745;
	color: white;
	font-weight: bold;
}

.btn-custom:hover {
	background-color: #218838;
}

.icon {
	margin-right: 8px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white">Book an Appointment</p>
	</div>

	<div class="container p-3">
		<div class="row">
			<!-- Doctor Image Section -->
			<div class="col-md-5 p-5 text-center">
				<img alt="Doctor" src="img/doct.jpg" class="img-fluid rounded">
			</div>

			<!-- Appointment Form -->
			<div class="col-md-7">
				<div class="card paint-card">
					<div class="card-body">
						<h3 class="text-center">User Appointment</h3>

						<!-- Error & Success Messages -->
						<c:if test="${not empty errorMsg}">
							<p class="alert alert-danger text-center">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="alert alert-success text-center">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="appAppointment" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-user icon"></i> Full Name</label>
								<input required type="text" class="form-control" name="fullname" placeholder="Enter your full name">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-venus-mars icon"></i> Gender</label>
								<select class="form-control" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-birthday-cake icon"></i> Age</label>
								<input required type="number" class="form-control" name="age" placeholder="Enter your age">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-calendar icon"></i> Appointment Date</label>
								<input type="date" class="form-control" required name="appoint_date">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-envelope icon"></i> Email</label>
								<input required type="email" class="form-control" name="email" placeholder="Enter your email">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-phone icon"></i> Phone No</label>
								<input maxlength="10" required type="number" class="form-control" name="phno" placeholder="Enter your phone number">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-heartbeat icon"></i> Diseases</label>
								<input required type="text" class="form-control" name="diseases" placeholder="Enter your health issue">
							</div>

							<div class="col-md-6">
								<label class="form-label"><i class="fa fa-user-md icon"></i> Doctor</label>
								<select required class="form-control" name="doct">
									<option value="">-- Select --</option>
									<% for (Doctor d : doctors) { %>
										<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
									<% } %>
								</select>
							</div>

							<div class="col-md-12">
								<label class="form-label"><i class="fa fa-map-marker icon"></i> Full Address</label>
								<textarea required name="address" class="form-control" rows="3" placeholder="Enter your address"></textarea>
							</div>

							<!-- Submit Button -->
							<div class="text-center">
								<c:if test="${empty userObj}">
									<a href="user_login.jsp" class="btn btn-custom col-md-6">Login to Book</a>
								</c:if>

								<c:if test="${not empty userObj}">
									<button class="btn btn-custom col-md-6">Submit</button>
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="footer.jsp"%>

</body>
</html>
