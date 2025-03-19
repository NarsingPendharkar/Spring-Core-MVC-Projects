<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task - Task Manager</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body style="font-family: 'Poppins', sans-serif;">
    <div class="d-flex">
        <!-- Sidebar -->
        <nav class="bg-dark text-light p-3" style="min-width: 250px;">
            <h2>Task Manager</h2>
            <ul class="nav flex-column">
                <li class="nav-item"><a href="dashboard" class="nav-link text-light">Dashboard</a></li>
                <li class="nav-item"><a href="tasks-list" class="nav-link text-light">Tasks</a></li>
                <li class="nav-item"><a href="createtask" class="nav-link text-light">Create Task</a></li>

                <!-- If user is logged in -->
                <c:if test="${not empty sessionScope.loggedUser}">
                    <li class="nav-item"><span class="nav-link text-light">Welcome, ${sessionScope.loggedUser.username}</span></li>
                    <li class="nav-item"><a href="logout" class="nav-link text-light">Logout</a></li>
                </c:if>

                <!-- If user is not logged in -->
                <c:if test="${empty sessionScope.loggedUser}">
                    <li class="nav-item"><a href="loginPage" class="nav-link text-light">Login</a></li>
                </c:if>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="container-fluid p-4">
            <h1>Edit Task</h1>
            <c:if test="${not empty message}">
                <div id="msg" class="alert alert-danger">
                    <p>${message}</p>
                </div>
            </c:if>
            <form style="font-family:Tahoma;" action="<c:url value='/saveTask'/>" method="post" id="editTaskForm">
                <!-- Hidden Field for Task ID -->
                <input type="hidden" name="task_id" value="${task.task_id}">

                <div class="row">
                    <!-- First Column: Title and Description -->
                    <div class="col-md-6 mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" id="title" name="title" class="form-control" value="${task.title}" placeholder="Enter task title" required>
                        <small id="titleMsg" class="text-danger"></small> <!-- Title validation message -->
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea id="description" name="description" class="form-control" rows="3" placeholder="Enter task description" required>${task.description}</textarea>
                        <small id="descriptionMsg" class="text-danger"></small> <!-- Description validation message -->
                    </div>
                </div>

                <div class="row">
                    <!-- Second Column: Deadline and Priority -->
                    <div class="col-md-6 mb-3">
                        <label for="deadline" class="form-label">Deadline</label>
                        <input type="date" id="deadline" name="deadline" class="form-control" value="${task.deadline != null ? task.deadline : ''}" required>
                        <small id="deadlineMsg" class="text-danger"></small> <!-- Deadline validation message -->
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="priority" class="form-label">Priority</label>
                        <select id="priority" name="priority" class="form-select">
                            <option value="LOW" ${task.priority == 'LOW' ? 'selected' : ''}>Low</option>
                            <option value="MEDIUM" ${task.priority == 'MEDIUM' ? 'selected' : ''}>Medium</option>
                            <option value="HIGH" ${task.priority == 'HIGH' ? 'selected' : ''}>High</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <!-- Third Column: Status and Assignee -->
                    <div class="col-md-6 mb-3">
                        <label for="status" class="form-label">Status</label>
                        <select id="status" name="status" class="form-select">
                            <option value="TODO" ${task.status == 'TODO' ? 'selected' : ''}>To Do</option>
                            <option value="IN_PROGRESS" ${task.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                            <option value="COMPLETED" ${task.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="assignee" class="form-label">Assign To</label>
                        <select id="assignee" name="assignee" class="form-select">
                            <c:forEach var="user" items="${users}">
                                <option value="${user.id}" ${task.assignedUser != null && task.assignedUser.id == user.id ? 'selected' : ''}>${user.username}</option>
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
    <footer class="bg-dark text-light text-center p-3">
        <p>&copy; 2024 Task Management System</p>
        <div>
            <a href="https://github.com/NarsingPendharkar" class="text-light me-3" target="_blank">
                <i class="bi bi-github"></i> GitHub
            </a>
            <a href="mailto:your-email@example.com" class="text-light me-3">
                <i class="bi bi-envelope-fill"></i> mailtonarsing@example.com
            </a>
            <a href="tel:+1234567890" class="text-light">
                <i class="bi bi-telephone-fill"></i> +91-9209259092
            </a>
        </div>
    </footer>

    <!-- Client-side Validation Script -->
    <script>
        document.getElementById('editTaskForm').addEventListener('submit', function(event) {
            let valid = true;

            // Title validation
            var title = document.getElementById('title').value;
            if (title.trim() === '') {
                document.getElementById('titleMsg').innerText = 'Title cannot be empty.';
                valid = false;
            } else {
                document.getElementById('titleMsg').innerText = '';
            }

            // Description validation
            var description = document.getElementById('description').value;
            if (description.trim() === '') {
                document.getElementById('descriptionMsg').innerText = 'Description cannot be empty.';
                valid = false;
            } else {
                document.getElementById('descriptionMsg').innerText = '';
            }

            // Deadline validation
            var deadline = document.getElementById('deadline').value;
            if (deadline === '') {
                document.getElementById('deadlineMsg').innerText = 'Please select a deadline.';
                valid = false;
            } else {
                document.getElementById('deadlineMsg').innerText = '';
            }

            // Prevent form submission if validation fails
            if (!valid) {
                event.preventDefault();
            }
        });
    </script>

    <script src="<c:url value='/js/script.js'/>"></script>
</body>

</html>
