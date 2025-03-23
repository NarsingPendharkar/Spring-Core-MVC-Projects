<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head><title>Patients</title></head>
<body>
    <h2>Patient List</h2>
    <ul>
    <c:set var="name"  value="Narsing">
   <h1><c:out value="${name}"></c:out></h1> 
    </c:set>   
    </ul>
</body>
</html>
