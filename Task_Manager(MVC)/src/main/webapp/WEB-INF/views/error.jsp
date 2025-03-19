<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Task Manager</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Poppins', sans-serif;
        }

        .error-container {
            max-width: 600px;
            margin: 100px auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .error-title {
            font-size: 2rem;
            color: #e74c3c;
            text-align: center;
            margin-bottom: 20px;
        }

        .error-message {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 30px;
            text-align: center;
        }

        .btn-home {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            width: 100%;
        }

        .btn-home:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="error-container">
            <h2 class="error-title">Oops! Something Went Wrong</h2>
            <!-- Display the dynamic error message -->
            <p class="error-message">${message != null ? message : "An unexpected error occurred."}</p>
            <!-- Redirect back to login page or home page -->
            <a href="<c:url value='/loginPage' />" class="btn-home">Go Back to Login</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
