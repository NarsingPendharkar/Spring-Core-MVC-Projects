<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Task Management System - Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      height: 100vh;
      display: flex;
      flex-direction: column;
    }

    .card-body {
      text-align: center;
      padding: 2rem;
    }

    .card-title {
      font-size: 1.5rem;
      font-weight: 600;
    }

    .card-text {
      font-size: 2rem;
      color: #333;
      font-weight: 700;
    }

    .sidebar {
      min-width: 250px;
      background-color: #343a40;
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      height: 100%;
      padding: 1rem;
      z-index: 1000;
      display: flex;
      flex-direction: column;
    }

    .sidebar a {
      color: #fff;
      font-size: 1.1rem;
      padding: 10px 15px;
      transition: all 0.3s ease;
    }

    .sidebar a:hover {
      background-color: #495057;
      color: #f1f1f1;
    }

    .sidebar h2 {
      padding: 15px;
      color: #fff;
    }

    .main-content {
      margin-left: 260px;
      padding: 2rem;
      flex-grow: 1;
      display: flex;
      flex-direction: column;
    }

    .footer {
      background-color: #343a40;
      color: #fff;
      text-align: center;
      padding: 1rem;
      margin-top: auto;
    }

    #msg {
      background-color: #f8d7da;
      color: #721c24;
    }

    /* Media Queries */
    @media (max-width: 768px) {
      .sidebar {
        position: relative;
        height: auto;
        min-width: 100%;
      }

      .main-content {
        margin-left: 0;
        padding: 1rem;
      }

      .card-body {
        padding: 1rem;
      }

      .card-title {
        font-size: 1.2rem;
      }

      .card-text {
        font-size: 1.5rem;
      }
    }
  </style>
</head>

<body>
  <div class="d-flex">
    <!-- Sidebar -->
    <nav class="sidebar p-3">
      <h2 class="text-light">Task Manager</h2>
      <ul class="nav flex-column">
        <li class="nav-item"><a href="dashboard" class="nav-link text-light">Dashboard</a></li>
        <li class="nav-item"><a href="tasks-list" class="nav-link text-light">Tasks</a></li>
        <li class="nav-item"><a href="createtask" class="nav-link text-light">Create Task</a></li>
        <!-- If user is logged in -->
        <c:if test="${not empty loggedUser}">
          <li class="nav-item"><span class="nav-link text-light">Welcome, ${loggedUser.username}</span></li>
          <li class="nav-item"><a href="logout" class="nav-link text-light">Logout</a></li>
        </c:if>
        <!-- If user is not logged in -->
        <c:if test="${empty loggedUser}">
          <li class="nav-item"><a href="loginPage" class="nav-link text-light">Login</a></li>
        </c:if>
      </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
      <h1>TODO</h1>
      <c:if test="${not empty message}">
        <div id="msg" class="alert alert-danger">
          <p>${message}</p>
        </div>
      </c:if>
      <div class="row">
        <div class="col-md-3 mb-3">
          <div class="card shadow-lg">
            <div class="card-body">
              <h5 class="card-title">Total Tasks Count</h5>
              <p class="card-text" id="totaltasks">${countotask}</p>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="card shadow-lg">
            <div class="card-body">
              <h5 class="card-title">Completed Tasks</h5>
              <p class="card-text" id="completedtasks">${completedTasks}</p>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <div class="card shadow-lg">
            <div class="card-body">
              <h5 class="card-title">Overdue Tasks</h5>
              <p class="card-text" id="overduetasks">${overdueTasks}</p>
            </div>
          </div>
        </div>
      </div>
      <!-- Chart Section -->
      <div>
        <canvas id="taskChart" style="max-height: 300px;"></canvas>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    const ctx = document.getElementById('taskChart').getContext('2d');
    const taskChart = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: ['To Do', 'In Progress', 'Completed'],
        datasets: [{
          data: [10, 20, 30], // Replace with dynamic data
          backgroundColor: ['#f39c12', '#3498db', '#2ecc71']
        }]
      }
    });
  </script>

  <script type="text/javascript" src="<c:url value='/js/Dashboard.js' />"></script>
</body>

</html>
