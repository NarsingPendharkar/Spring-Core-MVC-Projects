<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - MedCare Hospital</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        body {
            background: url('<c:url value="/images/medcare.jpg"></c:url>') no-repeat center center fixed;
            background-size: cover;
        }
        .overlay {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
        }
        .dashboard-card {
            transition: transform 0.3s;
        }
        .dashboard-card:hover {
            transform: scale(1.05);
        }
        .health-tips {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
	<%@include file="navbar.jsp"%>
    <div class="container mt-4 overlay">
        <h2 class="text-center text-success">Welcome to MedCare Hospital</h2>
        <p class="text-center">Your health is our priority. Manage your tasks efficiently with our system.</p>

        <div class="row mt-4">
            <c:if test="${role == 'ROLE_ADMIN'}">
                <div class="col-md-4">
                    <div class="card dashboard-card shadow-sm text-center">
                        <div class="card-body">
                            <i class="fas fa-user-md fa-3x text-success"></i>
                            <h5 class="card-title">Manage Doctors</h5>
                            <a href="#" class="btn btn-success">Go</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card dashboard-card shadow-sm text-center">
                        <div class="card-body">
                            <i class="fas fa-calendar-check fa-3x text-success"></i>
                            <h5 class="card-title">Appointments</h5>
                            <a href="#" class="btn btn-success">View</a>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${role == 'ROLE_DOCTOR'}">
                <div class="col-md-4">
                    <div class="card dashboard-card shadow-sm text-center">
                        <div class="card-body">
                            <i class="fas fa-user-injured fa-3x text-success"></i>
                            <h5 class="card-title">My Patients</h5>
                            <a href="#" class="btn btn-success">View</a>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${role == 'ROLE_USER'}">
                <div class="col-md-4">
                    <div class="card dashboard-card shadow-sm text-center">
                        <div class="card-body">
                            <i class="fas fa-calendar-plus fa-3x text-success"></i>
                            <h5 class="card-title">Book Appointment</h5>
                            <a href="#" class="btn btn-success">Book Now</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="row mt-5">
            <div class="col-md-12">
                <h3 class="text-success">Health Tips</h3>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card health-tips shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Stay Hydrated</h5>
                                <p>Drink at least 8 glasses of water daily to stay healthy.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card health-tips shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Exercise Regularly</h5>
                                <p>At least 30 minutes of daily exercise keeps your body fit.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card health-tips shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Eat Balanced Meals</h5>
                                <p>Include fruits and vegetables in your diet for good health.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <%@include file="footer.jsp" %>>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src='<c:url value="/js/dashboard.js"></c:url>'></script>
</body>
</html>
