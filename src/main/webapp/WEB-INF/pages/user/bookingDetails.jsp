<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" 
          prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <!-- BEGIN HEAD -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Responsive Admin Template" />
        <meta name="author" content="SmartUniversity" />
        <title>Booking Details</title>
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

        <style>
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 50px;
            }
        </style>
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
                                            <div class="profile-usertitle-job"> User </div>
                                        </div>
                                        <div class="sidebar-userpic-btn">
                                            <a class="tooltips" href="<c:url value="/user/userProfile"/>" data-placement="top" data-original-title="Profile">
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
                                        <i class="material-icons">person</i>
                                        <span class="title">User Informations</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li class="nav-item">
                                            <a href="<c:url value="/user/editUser/${user.id}"/>" class="nav-link ">
                                                <span class="title">Edit User Details</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="<c:url value="/user/viewHistory/${user.phoneNumber}"/>" class="nav-link ">
                                                <span class="title">View History</span>
                                            </a>
                                        </li>                                        
                                        <li class="nav-item active">
                                            <a href="<c:url value="/user/bookingDetails/${booking.id}"/>" class="nav-link ">
                                                <span class="title">View Booking Details</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">

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
                                    <div class="page-title">Details</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li></i>&nbsp;<a class="parent-item" href="<c:url value="/user/viewHistory/${user.phoneNumber}"/>">View History</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item active" href="<c:url value="/user/bookingDetails/${booking.id}"/>">Details</a></li>
                                </ol>
                            </div>
                        </div>

                        <div class="tab-content tab-space">
                            <div class="tab-pane active show" id="tab1">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-box">
                                            <div class="card-head">

                                            </div>
                                            <div class="card-body ">
                                                <h1 style="text-align: center">BOOKING DETAILS</h1>
                                                <table class="table table-hover order-column full-width" id="example4">
                                                    <tr>
                                                        <th class="center"> Booking Date </th>
                                                        <td class="center">
                                                            <fmt:setLocale value="en_US" scope="session"/>
                                                            <fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${booking.bookingDate}"/>                                                                    
                                                        </td>
                                                        <th class="center"> Booking Number </th>
                                                        <td class="center">${booking.bookingNumber}</td>
                                                        <th class="center"> Booking Status </th>
                                                        <td class="center">${booking.status}</td>
                                                    </tr>
                                                </table>

                                                <c:forEach items="${flightService.getListFlightByBookingId(booking.id)}" var="flight">
                                                    <table class="table table-hover order-column full-width" id="example4">
                                                        <tr>
                                                            <td colspan="4" style="font-weight: bold">
                                                                DEPARTURE: <fmt:formatDate pattern="EEEEE dd MMMMM yyyy" value="${flight.departureDate}"/>
                                                                -> 
                                                                ARRIVAL: <fmt:formatDate pattern="EEEEE dd MMMMM yyyy" value="${flight.arrivalDate}"/>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td rowspan="2">
                                                                ${flight.operation.name}<br>
                                                                ${flight.flightNumber}<br>
                                                                <br>
                                                                Duration:<br>
                                                                ${flight.flightRoute.duration}
                                                            </td>
                                                            <th colspan="2" class="center">
                                                                ${flight.flightRoute.departure.name} -> ${flight.flightRoute.destination.name}
                                                            </th>
                                                            <td rowspan="2">
                                                                Aircraft:<br>
                                                                ${flight.aircraft.name}<br>
                                                                ${flight.aircraft.number}<br>
                                                                <br>
                                                                ${flight.status}
                                                            </td>
                                                        </tr>

                                                        <tr>                                                                
                                                            <td>
                                                                Departing At:<br>
                                                                ${flight.departureTime}<br>
                                                                <br>
                                                                Terminal:<br>
                                                                TERMINAL 2
                                                            </td>
                                                            <td>
                                                                Arriving At:<br>
                                                                ${flight.arrivalTime}<br>
                                                                <br>
                                                                Terminal:<br>
                                                                TERMINAL 2
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <table class="table table-hover order-column full-width" id="example4">
                                                        <tr>
                                                            <th>Passenger Name</th>
                                                            <th>Gender</th>
                                                            <th>Seat</th>
                                                            <th>Class</th>
                                                            <th>Ticket</th>
                                                            <th>Service</th>
                                                        </tr>
                                                        <c:forEach items="${bookingDetailService.getListBookingDetailOfBookingAndFlight(booking.id, flight.id)}" var="bd">

                                                            <tr>
                                                                <td>${bd.passenger.fullName}</td>
                                                                <td>${bd.passenger.gender}</td>
                                                                <td>${bd.seat.number}</td>
                                                                <td>${aircraftSeatService.getAircraftSeatOfBookingDetail(bd.flight.id, bd.seat.id).seatType.seatType}</td>
                                                                <td>${bd.ticketType.ticketType}</td>
                                                                <td>
                                                                    <c:forEach items="${serviceService.getListServiceNamesOfBookingDetail(bd.id)}" var="serviceName">
                                                                        ${serviceName}<br>
                                                                    </c:forEach>
                                                                </td>
                                                            </tr>

                                                        </c:forEach>
                                                    </table>        

                                                </c:forEach>
                                                <p style="font-weight: bold; padding-top: 10px; text-align: right;">Total Cost: 
                                                    <fmt:setLocale value="vi_VN" scope="session"/>
                                                    <fmt:formatNumber type="currency" value="${totalCost}" currencySymbol="VND"/>
                                                </p> 
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
                <div class="chat-sidebar-container" data-close-on-body-click="false">
                    <div class="chat-sidebar">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a href="#quick_sidebar_tab_1" class="nav-link active tab-icon"  data-toggle="tab">Theme
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#quick_sidebar_tab_3" class="nav-link tab-icon"  data-toggle="tab">  Settings
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane chat-sidebar-settings in show active animated shake" role="tabpanel" id="quick_sidebar_tab_1">
                                <div class="slimscroll-style">
                                    <div class="theme-light-dark">
                                        <h6>Sidebar Theme</h6>
                                        <button type="button" data-theme="white" class="btn lightColor btn-outline btn-circle m-b-10 theme-button">Light Sidebar</button>
                                        <button type="button" data-theme="dark" class="btn dark btn-outline btn-circle m-b-10 theme-button">Dark Sidebar</button>
                                    </div>
                                    <div class="theme-light-dark">
                                        <h6>Sidebar Color</h6>
                                        <ul class="list-unstyled">
                                            <li class="complete">
                                                <div class="theme-color sidebar-theme">
                                                    <a href="#" data-theme="white"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="dark"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="blue"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="indigo"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="cyan"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="green"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="red"><span class="head"></span><span class="cont"></span></a>
                                                </div>
                                            </li>
                                        </ul>
                                        <h6>Header Brand color</h6>
                                        <ul class="list-unstyled">
                                            <li class="theme-option">
                                                <div class="theme-color logo-theme">
                                                    <a href="#" data-theme="logo-white"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="logo-dark"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="logo-blue"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="logo-indigo"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="logo-cyan"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="logo-green"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="logo-red"><span class="head"></span><span class="cont"></span></a>
                                                </div>
                                            </li>
                                        </ul>
                                        <h6>Header color</h6>
                                        <ul class="list-unstyled">
                                            <li class="theme-option">
                                                <div class="theme-color header-theme">
                                                    <a href="#" data-theme="header-white"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="header-dark"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="header-blue"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="header-indigo"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="header-cyan"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="header-green"><span class="head"></span><span class="cont"></span></a>
                                                    <a href="#" data-theme="header-red"><span class="head"></span><span class="cont"></span></a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Start Doctor Chat --> 

                            <!-- End Doctor Chat --> 
                            <!-- Start Setting Panel --> 
                            <div class="tab-pane chat-sidebar-settings animated slideInUp" id="quick_sidebar_tab_3">
                                <div class="chat-sidebar-settings-list slimscroll-style">
                                    <div class="chat-header"><h5 class="list-heading">Layout Settings</h5></div>
                                    <div class="chatpane inner-content ">
                                        <div class="settings-list">
                                            <div class="setting-item">
                                                <div class="setting-text">Sidebar Position</div>
                                                <div class="setting-set">
                                                    <select class="sidebar-pos-option form-control input-inline input-sm input-small ">
                                                        <option value="left" selected="selected">Left</option>
                                                        <option value="right">Right</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">Header</div>
                                                <div class="setting-set">
                                                    <select class="page-header-option form-control input-inline input-sm input-small ">
                                                        <option value="fixed" selected="selected">Fixed</option>
                                                        <option value="default">Default</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">Sidebar Menu </div>
                                                <div class="setting-set">
                                                    <select class="sidebar-menu-option form-control input-inline input-sm input-small ">
                                                        <option value="accordion" selected="selected">Accordion</option>
                                                        <option value="hover">Hover</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">Footer</div>
                                                <div class="setting-set">
                                                    <select class="page-footer-option form-control input-inline input-sm input-small ">
                                                        <option value="fixed">Fixed</option>
                                                        <option value="default" selected="selected">Default</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="chat-header"><h5 class="list-heading">Account Settings</h5></div>
                                        <div class="settings-list">
                                            <div class="setting-item">
                                                <div class="setting-text">Notifications</div>
                                                <div class="setting-set">
                                                    <div class="switch">
                                                        <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                                               for = "switch-1">
                                                            <input type = "checkbox" id = "switch-1" 
                                                                   class = "mdl-switch__input" checked>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">Show Online</div>
                                                <div class="setting-set">
                                                    <div class="switch">
                                                        <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                                               for = "switch-7">
                                                            <input type = "checkbox" id = "switch-7" 
                                                                   class = "mdl-switch__input" checked>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">Status</div>
                                                <div class="setting-set">
                                                    <div class="switch">
                                                        <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                                               for = "switch-2">
                                                            <input type = "checkbox" id = "switch-2" 
                                                                   class = "mdl-switch__input" checked>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">2 Steps Verification</div>
                                                <div class="setting-set">
                                                    <div class="switch">
                                                        <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                                               for = "switch-3">
                                                            <input type = "checkbox" id = "switch-3" 
                                                                   class = "mdl-switch__input" checked>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="chat-header"><h5 class="list-heading">General Settings</h5></div>
                                        <div class="settings-list">
                                            <div class="setting-item">
                                                <div class="setting-text">Location</div>
                                                <div class="setting-set">
                                                    <div class="switch">
                                                        <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                                               for = "switch-4">
                                                            <input type = "checkbox" id = "switch-4" 
                                                                   class = "mdl-switch__input" checked>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">Save Histry</div>
                                                <div class="setting-set">
                                                    <div class="switch">
                                                        <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                                               for = "switch-5">
                                                            <input type = "checkbox" id = "switch-5" 
                                                                   class = "mdl-switch__input" checked>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="setting-item">
                                                <div class="setting-text">Auto Updates</div>
                                                <div class="setting-set">
                                                    <div class="switch">
                                                        <label class = "mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                                               for = "switch-6">
                                                            <input type = "checkbox" id = "switch-6" 
                                                                   class = "mdl-switch__input" checked>
                                                        </label>
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