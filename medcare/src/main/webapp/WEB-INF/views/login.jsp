<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>
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
	background-color: #28a745;
	color: white;
	font-weight: bold;
}

.btn-custom:hover {
	background-color: #218838;
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
			<div class="col-md-5">
				<div class="card paint-card">
					<div class="card-body">
						<h4 class="text-center">User Login</h4>

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

						<!-- Error Message for Failed Login -->
						<c:if test="${param.error != null}">
							<p class="alert alert-danger text-center">Invalid username or
								password</p>
						</c:if>

						<form action="${pageContext.request.contextPath}/login" method="post">
							<div class="mb-3">
								<label class="form-label"><i class="fa fa-envelope icon"></i>Username</label>
								<input required name="username" type="text" class="form-control"
									placeholder="Enter your username">
							</div>

							<div class="mb-3">
								<label class="form-label"><i class="fa fa-lock icon"></i>Password</label>
								<input required name="password" type="password"
									class="form-control" placeholder="Enter your password">
							</div>

							<button type="submit" class="btn btn-custom col-md-12">
								<i class="fa fa-sign-in"></i> Login
							</button>
						</form>

						<div class="text-center mt-3">
							Don't have an account? <a href="register"
								class="text-decoration-none">Create one</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
