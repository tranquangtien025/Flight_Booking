<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- BEGIN HEAD -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Responsive Admin Template" />
        <meta name="author" content="SmartUniversity" />
        <title>All Airports</title>
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
        <!-- data tables -->
        <link href="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"/>" rel="stylesheet" type="text/css"/>
        <!-- animation -->
        <link href="<c:url value="/resources-management/assets/css/pages/animate_page.css"/>" rel="stylesheet">
        <!-- Template Styles -->
        <link href="<c:url value="/resources-management/assets/css/style.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources-management/assets/css/plugins.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources-management/assets/css/responsive.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources-management/assets/css/theme-color.css"/>" rel="stylesheet" type="text/css" />
        <!-- favicon -->
        <link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"/>" /> 
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
                                                <span class="title">View All Bookings</span>
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
                                <li class="nav-item active">
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
                                        <li class="nav-item active">
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
                                    <div class="page-title">All Airports</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item active" href="">All Airports</a></li>
                                </ol>
                            </div>
                        </div>
                        
                        <div class="tab-content tab-space">
                            <div class="tab-pane active show" id="tab1">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-box">
                                            <div class="card-head">
                                                <c:if test="${message != null && message!=''}">
                                                    <div class="alert alert-success" role="alert">
                                                        ${message}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="card-body ">
                                                <div class="table-scrollable">
                                                    <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                        <thead>
                                                            <tr>
                                                                <th class="center"> Name </th>
                                                                <th class="center"> Image </th>
                                                                <th class="center"> City </th>
                                                                <th class="center"> Country </th>
                                                                <th class="center"> Status </th>
                                                                <th class="center"> Action </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="airport" items="${airports}">
                                                                <tr class="odd gradeX">                                                                
                                                                    <td class="center">${airport.name}</td>
                                                                    <td class="center">
                                                                        <img src="<c:url 
                                                                             value="/resources-management/img/${airportService.findFirstImageOfAirport(airport.id)}"/>" 
                                                                             width="100px" height="100px"/> 
                                                                    </td>
                                                                    <td class="center">${airport.city.name}</td>
                                                                    <td class="center">${airport.city.country.name}</td>
                                                                    <td class="center">${airport.status}</td>
                                                                    <td class="center">
                                                                        <a href="<c:url value="/manager/editAirport/${airport.id}"/>" class="btn btn-tbl-edit btn-xs">
                                                                            <i class="fa fa-pencil"></i>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab2">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header bg-b-purple">
                                                        <div class="user-name">Pooja Patel</div>
                                                        <div class="name-center">General Manager</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig1.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        A-103, shyam gokul flats, Mahatma Road <br />Mumbai
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header cyan-bgcolor">
                                                        <div class="user-name">Smita Patil</div>
                                                        <div class="name-center">Housekeeper</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig2.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        45, Krishna Tower, Near Bus Stop, Satellite,  <br />Ahmedabad
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header light-dark-bgcolor">
                                                        <div class="user-name">John Smith</div>
                                                        <div class="name-center">Cook</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig3.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        456, Estern evenue, Courtage area,  <br />New York
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header bg-b-orange">
                                                        <div class="user-name">Pooja Patel</div>
                                                        <div class="name-center">General Manager</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig4.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        A-103, shyam gokul flats, Mahatma Road <br />Mumbai
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header bg-b-green">
                                                        <div class="user-name">Smita Patil</div>
                                                        <div class="name-center">Housekeeper</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig5.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        45, Krishna Tower, Near Bus Stop, Satellite,  <br />Ahmedabad
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header bg-b-danger">
                                                        <div class="user-name">John Smith</div>
                                                        <div class="name-center">Cook</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig6.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        456, Estern evenue, Courtage area,  <br />New York
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header bg-b-black">
                                                        <div class="user-name">Pooja Patel</div>
                                                        <div class="name-center">General Manager</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig7.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        A-103, shyam gokul flats, Mahatma Road <br />Mumbai
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header bg-b-yellow">
                                                        <div class="user-name">Smita Patil</div>
                                                        <div class="name-center">Housekeeper</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig8.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        45, Krishna Tower, Near Bus Stop, Satellite,  <br />Ahmedabad
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="m-b-20">
                                                <div class="doctor-profile">
                                                    <div class="profile-header bg-b-pink">
                                                        <div class="user-name">John Smith</div>
                                                        <div class="name-center">Cook</div>
                                                    </div>
                                                    <img src="assets/img/user/usrbig9.jpg" class="user-img"
                                                         alt="">
                                                    <p>
                                                        456, Estern evenue, Courtage area,  <br />New York
                                                    </p>
                                                    <div>
                                                        <p>
                                                            <i class="fa fa-phone"></i><a href="tel:(123)456-7890">
                                                                (123)456-7890</a>
                                                        </p>
                                                    </div>
                                                    <div class="profile-userbuttons">
                                                        <a href="staff_profile.html"
                                                           class="btn btn-circle deepPink-bgcolor btn-sm">Read
                                                            More</a>
                                                    </div>
                                                </div>
                                            </div>
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
        <!-- data tables -->
        <script src="<c:url value="/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"/>" ></script>
        <script src="<c:url value="/resources-management/assets/js/pages/table/table_data.js"/>" ></script>
        <!-- Material -->
        <script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"/>"></script>
        <!-- animation -->
        <script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"/>" ></script>
        <!-- end js include path -->
    </body>
</html>