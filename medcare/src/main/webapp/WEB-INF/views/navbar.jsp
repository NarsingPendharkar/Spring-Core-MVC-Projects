<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="fas fa-clinic-medical"></i> MedCare
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/">HOME</a></li>

                <!-- Admin Links -->
                <c:if test="${role == 'ROLE_ADMIN'}">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/manage-users">Manage Users</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/manage-doctors">Manage Doctors</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/appointments">Appointments</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/reports">Reports</a></li>
                </c:if>

                <!-- Doctor Links -->
                <c:if test="${role == 'ROLE_DOCTOR'}">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/doctor/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/doctor/patients">My Patients</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/doctor/appointments">Appointments</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/doctor/prescriptions">Prescriptions</a></li>
                </c:if>

                <!-- User (Patient) Links -->
                <c:if test="${role == 'ROLE_USER'}">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/book-appointment">Book Appointment</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/my-appointments">My Appointments</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/prescriptions">My Prescriptions</a></li>
                </c:if>
            </ul>

            <!-- User Account Section -->
            <ul class="navbar-nav ms-auto">
                <c:choose>
                    <c:when test="${not empty username}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user"></i> <c:out value="${username}" />
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile"><i class="fas fa-user-circle"></i> Profile</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/register"><i class="fas fa-user-plus"></i> Register</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
