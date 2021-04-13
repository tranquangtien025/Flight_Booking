<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
        <meta name="author" content="GeeksLabs">
        <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>Login Page</title>

        <!-- Bootstrap CSS -->
        <link href="<c:url value="/resources-management/css/bootstrap.min.css"/>" rel="stylesheet">
        <!-- bootstrap theme -->
        <link href="<c:url value="/resources-management/css/bootstrap-theme.css"/>" rel="stylesheet">
        <!--external css-->
        <!-- font icon -->
        <link href="<c:url value="/resources-management/css/elegant-icons-style.css"/>" rel="stylesheet" />
        <link href="<c:url value="/resources-management/css/font-awesome.css"/>" rel="stylesheet" />
        <!-- Custom styles -->
        <link href="<c:url value="/resources-management/css/style.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources-management/css/style-responsive.css"/>" rel="stylesheet" />
    </head>

    <body class="login-img3-body">
        <div class="container">

            <div class="row" style="padding-top: 10px">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="back-link back-backend">
                        <a href="home.html" class="btn btn-primary">Back to Home</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="login-form" style="margin-top: 100px">
                        <form id="loginForm" action="<c:url value="j_spring_security_check"/>" method="post">
                            <div class="login-wrap">
                                <p class="login-img"><i class="icon_lock_alt"></i></p>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon_profile"></i></span>
                                    <input type="email" class="form-control" id="email" placeholder="Username@gmail.com" autofocus name="username">
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                                    <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                                </div>
                                <label class="checkbox">
                                    <input type="checkbox" name="remember-me" id="rememberMe"> Remember me
                                </label>
                                <!-- /login?error=true -->
                                <c:if test="${message != null && message != ''}">
                                    <p style="color: #E67D21; font-weight: bold">${message}</p>
                                </c:if>

                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>

                        <button form="loginForm" class="btn btn-primary btn-lg btn-block" style="width: 308px; margin: 0 20px;" type="submit" onclick="isRememberMe()">Login</button>
                        <button onclick="location.href='<c:url value="/register"/>'" class="btn btn-info btn-lg btn-block" style="width: 308px; margin: 5px 20px 20px 20px;" type="submit">Signup</button>
                    </div>

                    <script>
                        const rmCheck = document.getElementById("rememberMe"),
                                emailInput = document.getElementById("email")
//                        ,
//                                passwordInput = document.getElementById("password")
                                ;

                        if (localStorage.checkbox && localStorage.checkbox !== "") {
                            rmCheck.setAttribute("checked", "checked");
                            emailInput.value = localStorage.username;
//                            passwordInput.value = localStorage.password;
                        } else {
                            rmCheck.removeAttribute("checked");
                            emailInput.value = "";
//                            passwordInput.value = "";
                        }

                        function isRememberMe() {
                            if (rmCheck.checked && emailInput.value !== "") {
                                localStorage.username = emailInput.value;
                                localStorage.checkbox = rmCheck.value;
//                                localStorage.password = passwordInput.value;
                            } else {
                                localStorage.username = "";
                                localStorage.checkbox = "";
//                                localStorage.password = "";
                            }
                        }
                    </script>


                </div>
            </div>
        </div>
    </body>
</html>
