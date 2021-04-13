<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
        <meta name="author" content="GeeksLabs">
        <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
        <link rel="shortcut icon" href="img/favicon.png">

        <title>Register Page</title>

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
        
        <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"/>"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#birthday').on('change', function () {
                    var today = new Date().toISOString().slice(0, 10);

                    if ($('#birthday').val() > today) {
                        $('#birthday').val(today);
                    }
                });
            });
        </script>
        
        <script type="text/javascript">
            function validation() {
                var fullName = $('#fullName').val();
                var email = $('#email').val();
                var password = $('#password').val();
                var repassword = $('#repassword').val();
                var today = new Date().toISOString().slice(0, 10);
                var birthday = $('#birthday').val();
                var phoneNumber = $('#phoneNumber').val();
                var address = $('#address').val();
                var error = 0;

                if (fullName === "") {
                    document.getElementById("fullNameError").innerHTML = "This field is required";
                    error += 1;
                } else if (fullName.length > 30 || fullName.length < 3) {
                    document.getElementById("fullNameError").innerHTML = "This field must be greater than or equals to 3 and less than or equals to 30 characters";
                    error += 1;
                } else {
                    document.getElementById("fullNameError").innerHTML = "";
                }
                for (var i = 0; i < fullName.length; i++) {
                    if (!fullName[i].match(/[a-zA-Z ]/)) {
                        document.getElementById("fullNameError").innerHTML = "Full Name must be full and used Alphabet and space mark only";
                    }
                }

                if (email === "") {
                    document.getElementById("emailError").innerHTML = "This field is required";
                    error += 1;
                } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                    document.getElementById("emailError").innerHTML = "Input email invalid";
                    error += 1;
                } else {
                    document.getElementById("emailError").innerHTML = "";
                }

                if (password === "") {
                    document.getElementById("passwordError").innerHTML = "This field is required";
                    error += 1;
                } else if (password.length < 8) {
                    document.getElementById("passwordError").innerHTML = "Password must be greater than or equals to 8 characters";
                    error += 1;
                } else {
                    document.getElementById("passwordError").innerHTML = "";
                }
                
                if (repassword === "") {
                    document.getElementById("repasswordError").innerHTML = "This field is required";
                    error += 1;
                } else if (repassword !== password) {
                    document.getElementById("repasswordError").innerHTML = "Input Re-Password is not correct";
                    error += 1;
                } else {
                    document.getElementById("repasswordError").innerHTML = "";
                }

                if (birthday === "") {
                    document.getElementById("birthdayError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("birthdayError").innerHTML = "";
                }

                if (phoneNumber === "") {
                    document.getElementById("phoneNumberError").innerHTML = "This field is required";
                    error += 1;
                } else if (!/(84|0[3|5|7|8|9])+([0-9]{8})\b/g.test(phoneNumber)){
                    document.getElementById("phoneNumberError").innerHTML = "Input phone number invalid";
                    error += 1;
                } else {
                    document.getElementById("phoneNumberError").innerHTML = "";
                }

                if (address === "") {
                    document.getElementById("addressError").innerHTML = "This field is required";
                    error += 1;
                } else if (address.length > 40) {
                    document.getElementById("addressError").innerHTML = "This field must be not greater than 40 characters";
                    error += 1;
                } else {
                    document.getElementById("addressError").innerHTML = "";
                }

                if (error === 0) {
                    return true;
                } else {
                    return false;
                }
            }


        </script>
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
                    <div class="login-form" style="margin-top: 20px">
                        <mvc:form id="registerForm" action="${pageContext.request.contextPath}/registerResult" 
                                  method="post" modelAttribute="user"
                                  onsubmit="return validation();"
                                  >
                            <div class="login-wrap">
                                <p class="login-img" style="font-weight: bold"></i>Register</p>
                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Full Name <span style="color: red">(*)</span></p>
                                    <input type="text" class="form-control" id="fullName" placeholder="Nguyen Van A" autofocus name="fullName">                                                       
                                </div>
                                <div>
                                    <p style="color: red" id="fullNameError"></p>
                                </div>

                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Email <span style="color: red">(*)</span></p>
                                    <input type="text" class="form-control" id="email" placeholder="Username@gmail.com" autofocus name="email">                                    
                                </div>
                                <div>
                                    <p style="color: red" id="emailError"></p>
                                </div>

                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Password <span style="color: red">(*)</span></p>
                                    <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                                </div>    
                                <div>
                                    <p style="color: red" id="passwordError"></p>
                                </div> 
                                
                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Re-Password <span style="color: red">(*)</span></p>
                                    <input type="password" class="form-control" id="repassword" placeholder="Password" name="">
                                </div>    
                                <div>
                                    <p style="color: red" id="repasswordError"></p>
                                </div> 

                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Mobile <span style="color: red">(*)</span></p>
                                    <input type="text" class="form-control" id="phoneNumber" placeholder="" name="phoneNumber">                                    
                                </div>
                                <div>
                                    <p style="color: red" id="phoneNumberError"></p>
                                </div>

                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Birthday <span style="color: red">(*)</span></p>
                                    <input type="date" class="form-control" id="birthday" placeholder="" name="birthday">
                                </div>
                                <div>
                                    <p style="color: red" id="birthdayError"></p>
                                </div>                  
                                
                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Gender <span style="color: red">(*)</span></p>
                                    <select name="gender" class="mdl-textfield__input" style="height: 40px">
                                        <c:forEach var="gender" items="${genders}">
                                            <c:if test="${user.gender == gender}">
                                                <option value="${gender}" selected>${gender}</option>
                                            </c:if>
                                            <c:if test="${user.gender != gender}">
                                                <option value="${gender}">${gender}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div>
                                    <p style="color: red" id=""></p>
                                </div>
                                
                                <div class="input-group">
                                    <p class="input-group-addon" style="font-weight: bold; border-right: 1px solid #000">Address <span style="color: red">(*)</span></p>
                                    <input type="text" class="form-control" id="address" name="address">
                                </div>
                                <div>
                                    <p style="color: red" id="addressError"></p>
                                </div>

                                <input type="text" value="UNACTIVE" name="status" hidden />

                                <!--                                <label class="checkbox">
                                                                    <input type="checkbox" value="agree"> Agree with the terms and conditions for Registration
                                                                </label>-->

                                <c:if test="${message != null && message != ''}">
                                    <p style="color: #E67D21; font-weight: bold">${message}</p>
                                </c:if>

                            </div>

                        </mvc:form>

                        <button form="registerForm" class="btn btn-primary btn-lg btn-block" 
                                style="width: 308px; margin: 0 20px 20px 20px;" type="submit" onclick="agree()">Register</button>

                    </div>     
                </div>
            </div>
        </div>
    </body>
</html>
