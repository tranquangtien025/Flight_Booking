<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="mvc" %>
<!DOCTYPE html>
<html lang="en">
    <!-- BEGIN HEAD -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Responsive Admin Template" />
        <meta name="author" content="SmartUniversity" />
        <title>User</title>
        <!-- google font -->
        <link href="<c:url value="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"/>" rel="stylesheet" type="text/css" />
        <!-- icons -->
        <link href="<c:url value="/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
        <!--bootstrap -->
        <link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
        <!-- Material Design Lite CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material/material.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/material_style.css"/>">
        <!-- animation -->
        <link href="<c:url value="/resources-management/assets/css/pages/animate_page.css"/>" rel="stylesheet">
        <!-- Template Styles -->
        <link href="<c:url value="/resources-management/assets/css/style.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources-management/assets/css/plugins.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources-management/assets/css/responsive.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources-management/assets/css/theme-color.css"/>" rel="stylesheet" type="text/css" />
        <!-- dropzone -->
        <link href="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.css"/>" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css"/>" />
        <!-- favicon -->
        <link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"/>" /> 

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

                if (birthday === "") {
                    document.getElementById("birthdayError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("birthdayError").innerHTML = "";
                }

                if (phoneNumber === "") {
                    document.getElementById("phoneNumberError").innerHTML = "This field is required";
                    error += 1;
                } else if (!/(84|0[3|5|7|8|9])+([0-9]{8})\b/g.test(phoneNumber)) {
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
    <!-- END HEAD -->
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <!-- start header -->
            <jsp:include page="../include/start-header.jsp"/>
            <!-- end header -->
            <!-- start page container -->
            <div class="page-container">
                <!-- start sidebar menu -->
                <div class="sidebar-container">
                    <div class="sidemenu-container navbar-collapse collapse fixed-menu">
                        <div id="remove-scroll">
                            <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                                <li class="sidebar-toggler-wrapper hide">
                                    <div class="sidebar-toggler">
                                        <span></span>
                                    </div>
                                </li>
                                <li class="sidebar-user-panel">
                                    <div class="user-panel">
                                        <div class="row">
                                            <div class="sidebar-userpic">
                                                <img src="<c:url value="/resources-management/img/ninja.jpg"/>" class="img-responsive" alt=""> </div>
                                        </div>
                                        <div class="profile-usertitle">
                                            <div class="sidebar-userpic-name"> ${userFullName} </div>
                                            <div class="profile-usertitle-job"> Admin </div>
                                        </div>
                                        <div class="sidebar-userpic-btn">
                                            <a class="tooltips" href="<c:url value="/admin/adminProfile"/>" data-placement="top" data-original-title="Profile">
                                                <i class="material-icons">person_outline</i>
                                            </a>
                                            <a class="tooltips" href="<c:url value="/logout"/>" data-placement="top" data-original-title="Logout">
                                                <i class="material-icons">input</i>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="menu-heading">
                                    <span>-- Main</span>
                                </li>                                
                                <li class="nav-item active">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">people</i>
                                        <span class="title">Manage Users</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <c:if test="${action == 'add'}">
                                        <ul class="sub-menu">
                                            <li class="nav-item active">
                                                <a href="<c:url value="/admin/addUser"/>" class="nav-link ">
                                                    <span class="title">Add User Details</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="<c:url value="/admin/allUsers"/>" class="nav-link ">
                                                    <span class="title">View All Users</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
                                        <ul class="sub-menu">
                                            <li class="nav-item">
                                                <a href="<c:url value="/admin/addUser"/>" class="nav-link ">
                                                    <span class="title">Add User Details</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="<c:url value="/admin/allUsers"/>" class="nav-link ">
                                                    <span class="title">View All Users</span>
                                                </a>
                                            </li>
                                            <li class="nav-item active">
                                                <a href="<c:url value="/admin/editUser/${user.id}"/>" class="nav-link ">
                                                    <span class="title">Edit User Details</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </c:if>
                                </li>                                
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end sidebar menu -->
                <!-- start page content -->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <c:if test="${action == 'add'}">
                                        <div class="page-title">Add User Details</div>
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
                                        <div class="page-title">Edit User Details</div>
                                    </c:if>                                                   
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <c:if test="${action == 'add'}">
                                        <li><a class="parent-item active" href="">Add User Details</a></li>
                                        </c:if>
                                        <c:if test="${action == 'edit'}">
                                        <li><a class="parent-item active" href="">Edit User Details</a></li>
                                        </c:if>                                    
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box">
                                    <div class="card-head">
                                        <header>Basic Information</header>

                                    </div>
                                    <div class="card-body">

                                        <mvc:form id="userForm" action="${pageContext.request.contextPath}/admin/userResult/${action}"
                                                  method="post" 
                                                  modelAttribute="user"
                                                  onsubmit="return validation();"
                                                  >

                                            <c:if test="${action == 'edit'}">
                                                <input type="text" name="id" 
                                                       value="${user.id}" hidden />
                                            </c:if>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" value="${user.fullName}" id = "fullName" name="fullName">
                                                        <label class = "mdl-textfield__label">Full Name</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="fullNameError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" id = "email" value="${user.email}" name="email" placeholder="test@example.com"> 
                                                        <label class = "mdl-textfield__label" >Email</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="emailError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "password" id = "password" value="${user.password}" name="password">
                                                        <label class = "mdl-textfield__label" >Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="passwordError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <br><input class = "mdl-textfield__input" type = "date" id = "birthday" value="${user.birthday}" name="birthday">
                                                        <label class = "mdl-textfield__label" >Birthday</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br><br>
                                                    <p style="color: red" id="birthdayError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20">
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" value="${user.phoneNumber}"
                                                               pattern = "-?[0-9]*(\.[0-9]+)?" id = "phoneNumber" name="phoneNumber">
                                                        <label class = "mdl-textfield__label" for = "text5">Phone Number</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="phoneNumberError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <select name="gender" class="mdl-textfield__input">
                                                            <c:forEach var="gender" items="${genders}">
                                                                <c:if test="${user.gender == gender}">
                                                                    <option value="${gender}" selected>${gender}</option>
                                                                </c:if>
                                                                <c:if test="${user.gender != gender}">
                                                                    <option value="${gender}">${gender}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <label for="sample2" class="mdl-textfield__label">Gender</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" value="${user.address}" id = "address" name="address">
                                                        <label class = "mdl-textfield__label">Address</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="addressError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <select name="status" class="mdl-textfield__input">
                                                            <c:forEach var="status" items="${statuses}">
                                                                <c:if test="${user.status == status}">
                                                                    <option value="${status}" selected>${status}</option>
                                                                </c:if>
                                                                <c:if test="${user.status != status}">
                                                                    <option value="${status}">${status}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <label for="sample2" class="mdl-textfield__label">Status</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 

                                                </div>
                                            </div>

                                            <div class="row">
                                                <% boolean exist = false; %>

                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <br><select name="listUserRoleId" class="mdl-textfield__input" multiple>
                                                            <c:forEach var="userRole" items="${userRoles}">
                                                                <c:forEach var="selectedRole" items="${userService.getListRoleIdOfUser(user.id)}">                                                                    
                                                                    <c:if test="${selectedRole == userRole.id}">
                                                                        <% exist = true; %>
                                                                    </c:if>
                                                                </c:forEach>       
                                                                <% if (exist == true) {%>
                                                                <option value="${userRole.id}" selected>${userRole.role}</option>
                                                                <% } %>
                                                                <% if (exist == false) {%>
                                                                <option value="${userRole.id}">${userRole.role}</option>
                                                                <%}%>
                                                                <% exist = false;%>
                                                            </c:forEach>
                                                        </select>
                                                        <label for="sample2" class="mdl-textfield__label">Role</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 

                                                </div>
                                            </div>

                                        </mvc:form>

                                        <div class="col-lg-12 p-t-20 text-center"> 
                                            <button form="userForm" type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                            <button onclick="location.href = '<c:url value="/admin/allUsers"/>'"
                                                    class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
                <!-- end page content -->
                <!-- start chat sidebar -->
                <jsp:include page="../include/start-sidebar.jsp"/>
                <!-- end chat sidebar -->
            </div>
            <!-- end page container -->
            <!-- start footer -->
            <jsp:include page="../include/management-footer.jsp"/>
            <!-- end footer -->
        </div>
        <!-- start js include path -->
        <script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>"></script>
        <!-- bootstrap -->
        <script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"/>" ></script>
        <!-- Common js-->
        <script src="<c:url value="/resources-management/assets/js/app.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/js/layout.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/js/theme-color.js"/>" ></script>
        <!-- Material -->
        <script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/material_select/getmdl-select.js"/>" ></script>
        <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js"/>"></script>
        <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"/>"></script>
        <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js"/>"></script>
        <!-- dropzone -->
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js"/>" ></script>
        <!-- animation -->
        <script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"/>" ></script>
        <!-- end js include path -->
    </body>
</html>