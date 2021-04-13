<%-- 
    Document   : tables
    Created on : Feb 28, 2021, 12:11:44 PM
    Author     : TIEN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" 
          prefix="fmt" %>
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
        <title>Manager Profile</title>
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
        <!-- favicon -->
        <link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"/>" /> 
        
        <script type="text/javascript">
            function validation() {
                var currentPassword = $('#currentPassword').val();
                var newPassword = $('#newPassword').val();
                var error = 0;

                if (currentPassword === "") {
                    document.getElementById("currentPasswordError").innerHTML = "This field is required";
                    error += 1;
                } else if (currentPassword.length < 8) {
                    document.getElementById("currentPasswordError").innerHTML = "Password must be greater than or equals to 8 characters";
                    error += 1;
                } else {
                    document.getElementById("currentPasswordError").innerHTML = "";
                }
                
                if (newPassword === "") {
                    document.getElementById("newPasswordError").innerHTML = "This field is required";
                    error += 1;
                } else if (newPassword.length < 8) {
                    document.getElementById("newPasswordError").innerHTML = "Password must be greater than or equals to 8 characters";
                    error += 1;
                } else if (newPassword == currentPassword) {
                    document.getElementById("newPasswordError").innerHTML = "New Password must be different from Current Password";
                    error += 1;
                } else {
                    document.getElementById("newPasswordError").innerHTML = "";
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
                                                <img src="<c:url value="/resources-management/img/boss.jpg"/>" class="img-responsive" alt=""> </div>
                                        </div>
                                        <div class="profile-usertitle">
                                            <div class="sidebar-userpic-name"> ${userFullName} </div>
                                            <div class="profile-usertitle-job"> Manager </div>
                                        </div>
                                        <div class="sidebar-userpic-btn">
                                            <a class="tooltips" href="<c:url value="/manager/managerProfile"/>" data-placement="top" data-original-title="Profile">
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
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">business_center</i>
                                        <span class="title">Manage Bookings</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/allBookings"/>" class="nav-link ">
                                                <span class="title">All Bookings</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">flight_takeoff</i>
                                        <span class="title">Manage Flights</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/addFlight"/>" class="nav-link ">
                                                <span class="title">Add Flight Details</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/allFlights"/>" class="nav-link ">
                                                <span class="title">View All Flights</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">swap_calls</i>
                                        <span class="title">Manage Flight Routes</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/addFlightRoute"/>" class="nav-link ">
                                                <span class="title">Add Flight Route Details</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/allFlightRoutes"/>" class="nav-link ">
                                                <span class="title">View All Flight Routes</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">room</i>
                                        <span class="title">Manage Airports</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/addAirport"/>" class="nav-link ">
                                                <span class="title">Add Airport Details</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/allAirports"/>" class="nav-link ">
                                                <span class="title">View All Airports</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">flight</i>
                                        <span class="title">Manage Aircrafts</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/addAircraft"/>" class="nav-link ">
                                                <span class="title">Add Aircraft Details</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/allAircrafts"/>" class="nav-link ">
                                                <span class="title">View All Aircrafts</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">event_available</i>
                                        <span class="title">Manage Promotions</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/addPromotion"/>" class="nav-link ">
                                                <span class="title">Add Promotion Details</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/allPromotions"/>" class="nav-link ">
                                                <span class="title">View All Promotions</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">face</i>
                                        <span class="title">Manage Services</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/addService"/>" class="nav-link ">
                                                <span class="title">Add Service Details</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="<c:url value="/manager/allServices"/>" class="nav-link ">
                                                <span class="title">View All Services</span>
                                            </a>
                                        </li>
                                    </ul>
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
                                    <div class="page-title">Manager Profile</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item active" href="<c:url value="/manager/managerProfile"/>">Manager Profile</a></li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN PROFILE SIDEBAR -->
                                <div class="profile-sidebar">
                                    <div class="card card-topline-aqua">
                                        <div class="card-body no-padding height-9">
                                            <div class="row">
                                                <div class="profile-userpic">
                                                    <img src="<c:url value="/resources-management/img/boss.jpg"/>" class="img-responsive" alt=""> </div>
                                            </div>
                                            <div class="profile-usertitle">
                                                <div class="profile-usertitle-name"> ${user.fullName} </div>
                                                <div class="profile-usertitle-job"> Manager </div>
                                            </div>
                                            <!-- END SIDEBAR MANAGER TITLE -->
                                            <!-- SIDEBAR BUTTONS -->
                                            <!-- END SIDEBAR BUTTONS -->
                                        </div>
                                    </div>                                    
                                    <div class="card">
                                        <div class="card-head card-topline-aqua">
                                            <header>Address</header>
                                        </div>
                                        <div class="card-body no-padding height-9">
                                            <div class="row text-center m-t-10">
                                                <div class="col-md-12">
                                                    <p>${user.address}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                                <!-- END BEGIN PROFILE SIDEBAR -->
                                <!-- BEGIN PROFILE CONTENT -->
                                <div class="profile-content">
                                    <div class="row">
                                        <div class="profile-tab-box">
                                            <div class="p-l-20">
                                                <ul class="nav ">
                                                    <li class="nav-item tab-all"><a
                                                            class="nav-link ${active1} show" href="#tab1" data-toggle="tab">Account Information</a></li>
                                                    <li class="nav-item tab-all p-l-20"><a class="nav-link ${active2}"
                                                                                           href="#tab3" data-toggle="tab">Change Password</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="white-box">
                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <div class="tab-pane ${active1} fontawesome-demo" id="tab1">
                                                    <div id="biography" >
                                                        <div class="row">
                                                            <div class="col-md-12 col-12 b-r"> <strong>Full Name</strong>
                                                                <br>
                                                                <p class="text-muted">${user.fullName}</p>
                                                            </div>
                                                            <div class="col-md-12 col-12 b-r"> <strong>Gender</strong>
                                                                <br>
                                                                <p class="text-muted">${user.gender}</p>
                                                            </div>
                                                            <div class="col-md-12 col-12 b-r"> <strong>Mobile</strong>
                                                                <br>
                                                                <p class="text-muted">${user.phoneNumber}</p>
                                                            </div>
                                                            <div class="col-md-12 col-12 b-r"> <strong>Email</strong>
                                                                <br>
                                                                <p class="text-muted">${user.email}</p>
                                                            </div>
                                                            <div class="col-md-12 col-12"> <strong>Birthday</strong>
                                                                <br>
                                                                <p class="text-muted">
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${user.birthday}"/>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <hr>                                                        
                                                    </div>
                                                </div>
                                                
                                                <div class="tab-pane ${active2}" id="tab3">
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12">
                                                            <div class="card-head">
                                                                <header>Change Password</header>
                                                                
                                                            </div>
                                                            <div class="card-body " id="bar-parent1">
                                                                <form action="<c:url value="/manager/changePassword"/>" 
                                                                      method="get"
                                                                      onsubmit="return validation();"> 

                                                                    <div class="form-group">
                                                                        <label for="currentPassword">Current Password</label>
                                                                        <input type="password" class="form-control" id="currentPassword" placeholder="Current Password" name="currentPassword">                                                                        
                                                                    </div>
                                                                    <div>
                                                                        <p style="color: red" id="currentPasswordError">${error}</p>
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        <label for="newPassword">New Password</label>
                                                                        <input type="password" class="form-control" id="newPassword" placeholder="New Password" name="newPassword">
                                                                    </div>
                                                                    <div>
                                                                        <p style="color: red" id="newPasswordError"></p>
                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END PROFILE CONTENT -->
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
            </div></div>
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
        <!-- animation -->
        <script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"/>" ></script>
        <!-- end js include path -->
    </body>
</html>