<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration Page</title>
<%@include file="allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

.form-control {
	border-radius: 5px;
}

.btn-custom {
	background-color: #007bff;
	color: white;
	font-weight: bold;
}

.btn-custom:hover {
	background-color: #0056b3;
}

.icon {
	margin-right: 10px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container p-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<h4 class="text-center">User Registration</h4>

						<!-- Success Message -->
						<c:if test="${not empty succMsg}">
							<p class="alert alert-success text-center">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<!-- Error Message -->
						<c:if test="${not empty errorMsg}">
							<p class="alert alert-danger text-center">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="/admin/saveuser" method="get">
							<div class="mb-3">
								<label class="form-label"><i class="fa fa-user icon"></i>Username</label>
								<input required name="username" type="text" class="form-control"
									placeholder="Enter your username">
							</div>

							<div class="mb-3">
								<label class="form-label"><i class="fa fa-envelope icon"></i>Email</label>
								<input required name="email" type="email" class="form-control"
									placeholder="Enter your email">
							</div>

							<div class="mb-3">
								<label class="form-label"><i class="fa fa-phone icon"></i>Phone</label>
								<input required name="phone" type="text" class="form-control"
									placeholder="Enter your phone number">
							</div>

							<div class="mb-3">
								<label class="form-label"><i class="fa fa-lock icon"></i>Password</label>
								<input required id="password" name="password" type="password" class="form-control"
									placeholder="Enter your password">
							</div>

							<div class="mb-3">
								<label class="form-label"><i class="fa fa-users icon"></i>Select Role</label>
								<select name="role" id="role" class="form-control" required>
									<option value="USER">User</option>
									<option value="ADMIN">Admin</option>
									<option value="DOCTOR">Doctor</option>
								</select>
							</div>

							<button type="submit" class="btn btn-custom col-md-12">
								<i class="fa fa-user-plus"></i> Register
							</button>
						</form>

						<div class="text-center mt-3">
							Already have an account? <a href="login" class="text-decoration-none">Login here</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
