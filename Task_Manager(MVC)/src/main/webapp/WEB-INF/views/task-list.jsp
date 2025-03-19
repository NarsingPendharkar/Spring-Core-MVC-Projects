<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tasks - Task Manager</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
   font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

    .sidebar {
      width: 250px;
      background-color: #343a40;
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      padding: 20px;
    }

    .sidebar h2 {
      color: white;
      margin-bottom: 30px;
    }

    .sidebar .nav-item {
      margin-bottom: 10px;
    }

    .sidebar .nav-link {
      color: #fff;
    }

    .sidebar .nav-link:hover {
      background-color: #495057;
    }

    .main-content {
      margin-left: 250px;
      padding: 20px;
      flex-grow: 1;
    }

    .footer {
      background-color: #343a40;
      color: #fff;
      text-align: center;
      padding: 10px;
      margin-top: auto;
    }

    .footer a {
      color: #fff;
      margin: 0 10px;
      text-decoration: none;
    }

    .footer a:hover {
      text-decoration: underline;
    }

    @media (max-width: 768px) {
      .sidebar {
        position: relative;
        width: 100%;
      }

      .main-content {
        margin-left: 0;
      }
    }
  </style>
</head>

<body>
  <div class="d-flex">
    <!-- Sidebar -->
    <nav class="sidebar">
      <h2>Task Manager</h2>
      <ul class="nav flex-column">
        <li class="nav-item"><a href="dashboard" class="nav-link">Dashboard</a></li>
        <li class="nav-item"><a href="tasks-list" class="nav-link">Tasks</a></li>
        <li class="nav-item"><a href="createtask" class="nav-link">Create Task</a></li>

        <!-- If user is logged in -->
        <c:if test="${not empty sessionScope.loggedUser}">
          <li class="nav-item"><span class="nav-link">Welcome, ${sessionScope.loggedUser.username}</span></li>
          <li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
        </c:if>

        <!-- If user is not logged in -->
        <c:if test="${empty sessionScope.loggedUser}">
          <li class="nav-item"><a href="loginPage" class="nav-link">Login</a></li>
        </c:if>
      </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
      <h1>Tasks</h1>

      <!-- Message if any -->
      <c:if test="${not empty message}">
        <div id="msg" class="alert alert-danger">
          <p>${message}</p>
        </div>
      </c:if>

      <!-- Task Table -->
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Title</th>
            <th>Assigned User</th>
            <th>Status</th>
            <th>Deadline</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <!-- Iterating over tasks -->
          <c:forEach var="task" items="${tasks}">
            <tr>
              <td>${task.title}</td>
              <td>${task.assignedUser.username}</td>
              <td>${task.status}</td>
              <td>${task.deadline}</td>
              <td>
                <c:url value="editTask/${task.task_id}" var="editUrl" />
                <a href="${editUrl}"><button class="btn btn-warning btn-sm">Edit</button></a>
                <c:url value="deleteTask/${task.task_id}" var="deleteUrl" />
                <a href="${deleteUrl}"><button class="btn btn-danger btn-sm">Delete</button></a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <!-- Pagination -->
      <div class="d-flex justify-content-between">
        <c:if test="${currentPage > 0}">
          <a href="tasks-list?page=${currentPage - 1}&size=6" class="btn btn-secondary btn-sm">Previous</a>
        </c:if>

        <span>Page ${currentPage + 1} of ${totalPages}</span>

        <c:if test="${currentPage + 1 < totalPages}">
          <a href="tasks-list?page=${currentPage + 1}&size=6" class="btn btn-secondary btn-sm">Next</a>
        </c:if>
      </div>
    </div>
  </div>

<jsp:include page="footer.jsp"></jsp:include>

  <script src="<c:url value='/js/script.js' />"></script>
</body>

</html>
