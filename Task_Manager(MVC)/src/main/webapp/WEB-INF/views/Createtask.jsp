<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create/Update Task - Task Manager</title>
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
      <h1>Create/Update Task</h1>

      <!-- Message if any -->
      <c:if test="${not empty message}">
        <div id="msg" class="alert alert-danger">
          <p>${message}</p>
        </div>
      </c:if>

      <form action="saveTask" method="post">
        <div class="row">
          <!-- First Column: Title and Description -->
          <div class="col-md-6 mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" id="title" name="title" class="form-control" placeholder="Enter task title">
            <input type="hidden" id="task_id" name="task_id" class="form-control" placeholder="Enter task_id">
          </div>

          <div class="col-md-6 mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea id="description" name="description" class="form-control" rows="3" placeholder="Enter task description"></textarea>
          </div>
        </div>

        <div class="row">
          <!-- Second Column: Deadline and Priority -->
          <div class="col-md-6 mb-3">
            <label for="deadline" class="form-label">Deadline</label>
            <input type="date" id="deadline" name="deadline" class="form-control" >
          </div>

          <div class="col-md-6 mb-3">
            <label for="priority" class="form-label">Priority</label>
            <select id="priority" name="priority" class="form-select">
              <option value="LOW">Low</option>
              <option value="MEDIUM">Medium</option>
              <option value="HIGH">High</option>
            </select>
          </div>
        </div>

        <div class="row">
          <!-- Third Column: Status and Assignee -->
          <div class="col-md-6 mb-3">
            <label for="status" class="form-label">Status</label>
            <select id="status" name="status" class="form-select">
              <option value="TODO">To Do</option>
              <option value="IN_PROGRESS">In Progress</option>
              <option value="COMPLETED">Completed</option>
            </select>
          </div>

          <div class="col-md-6 mb-3">
            <label for="assignee" class="form-label">Assign To</label>
            <select id="assignee" name="assignee" class="form-select">
              <c:forEach var="user" items="${users}">
                <option value="${user.id}">${user.username}</option>
              </c:forEach>
            </select>
          </div>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-success">Save Task</button>
      </form>
    </div>
  </div>

  <!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

  <script src="<c:url value='/js/common.js' />"></script>
</body>

</html>
