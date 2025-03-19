<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Task Manager</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body style="font-family: 'Poppins', sans-serif;">
    <div class="container d-flex align-items-center justify-content-center vh-100">
        <div class="card p-4" style="width: 400px;">
            <h3 class="text-center">Register</h3>

            <!-- Display Server Messages -->
            <c:if test="${not empty message}">
                <div id="msg" class="alert alert-danger">
                    <p>${message}</p>
                </div>
            </c:if>

            <form action="saveUser" method="post" id="registerForm">
                <!-- Hidden User ID field -->
                <input type="hidden" id="user_id" name="user_id" class="form-control">

                <!-- Username Field -->
                <div class="mb-3">
                    <label for="username" class="form-label">User Name</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
                    <small id="usernameMsg" class="text-danger"></small> <!-- Username validation message -->
                </div>

                <!-- Email Field -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                    <small id="emailMsg" class="text-danger"></small> <!-- Email validation message -->
                </div>

                <!-- Password Field -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                    <small id="passwordMsg" class="text-danger"></small> <!-- Password validation message -->
                </div>

                <!-- Role Selection Field -->
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select id="role" name="role" class="form-control" required>
                        <option value="USER">USER</option>
                        <option value="ADMIN">ADMIN</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>

            <!-- Login Link -->
            <p class="text-center mt-3">
                Already have an account? <a href="loginPage">Login</a>
            </p>
        </div>
    </div>

    
<script type="text/javascript" src="<c:url value='/js/Register.js' />"></script>
</body>

</html>
