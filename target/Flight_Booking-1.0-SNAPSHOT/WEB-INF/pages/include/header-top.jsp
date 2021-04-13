<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/security/tags" 
           prefix="sec" %>

<div class="wrapper">
    <h1><a href="home.html" id="logo">AirLines</a></h1>
    <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
    <nav id="top_nav">
        <ul>
            <li><a href="<c:url value="/home"/>" class="nav1">Home</a></li>
            <li><a href="<c:url value="/contacts"/>" class="nav3">Contact</a></li>
            <sec:authorize access="!isAuthenticated()">
            <li><a href="<c:url value="/login"/>" class="nav4">Login</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li><a href="<c:url value="/admin/adminProfile" />" class="nav7">Admin</a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_USER')">
                <li><a href="<c:url value="/user/userProfile" />" class="nav6">User</a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_MANAGER')">
                <li><a href="<c:url value="/manager/managerProfile" />" class="nav8">Manager</a></li>
                </sec:authorize>
                <li><a href="<c:url value="/logout"/>" class="nav5">Logout</a></li>
            </sec:authorize>            
        </ul>
    </nav>
</div>
