<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" 
          prefix="fmt" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
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

        <style type="text/css">
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 50px;
            }

            @media print {
                .noprint { display: none; }
                .printme { display: block; }
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
                                    <li class="nav-item active">
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

                                            <li class="nav-item active">
                                                <a href="<c:url value="/manager/bookingDetails/${booking.id}"/>" class="nav-link ">
                                                    <span class="title">View Booking Details</span>
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
                                        <div class="page-title">Details</div>
                                    </div>
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li></i>&nbsp;<a class="parent-item" href="<c:url value="/manager/allBookings"/>">All Bookings</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li><a class="parent-item active" href="">Details</a></li>
                                    </ol>
                                </div>
                            </div>

                            <div class="tab-content tab-space">
                                <div class="tab-pane active show" id="tab1">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card-box">
                                                <div class="card-head noprint">
                                                    <button id = "panel-button" 
                                                            class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                                            data-upgraded = ",MaterialButton">
                                                        <i class = "material-icons">more_vert</i>
                                                    </button>
                                                    <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                                        data-mdl-for = "panel-button">
                                                        <a href="<c:url value="javascript:window.print();"/>" >
                                                            <li class="mdl-menu__item"> 
                                                                <i class="material-icons">print</i>Print
                                                            </li>
                                                        </a>
                                                        <a href="<c:url value="/manager/bookingDetails/export/pdf/${booking.id}"/>">
                                                            <li class = "mdl-menu__item">
                                                                <i class="material-icons">book</i>Export to PDF
                                                            </li>       
                                                        </a>
                                                    </ul>
                                                </div>
                                                <div class="card-body ">

                                                    <mvc:form id="bookingForm" action="${pageContext.request.contextPath}/manager/changeBookingStatus"
                                                              method="post">

                                                        <input type="text" name="id" 
                                                               value="${booking.id}" hidden />

                                                        <img src="<c:url value="/resources-management/img/logo.png"/>" 
                                                             class="img-responsive" alt=""  width="100px" height="100px"
                                                             style="display: block; margin-left: auto; margin-right: auto">
                                                        <h1 style="text-align: center" class="text-hide printme">INVOICE</h1>
                                                        <h1 style="text-align: center" class="noprint">BOOKING DETAILS</h1>
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
                                                                <td class="center">
                                                                    <select name="status">
                                                                        <c:forEach var="status" items="${statuses}">
                                                                            <c:if test="${booking.status == status}">
                                                                                <option value="${status}" selected>${status}</option>
                                                                            </c:if>
                                                                            <c:if test="${booking.status != status}">
                                                                                <option value="${status}">${status}</option>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
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
                                                    </mvc:form>

                                                    <div class="col-lg-12 p-t-20 text-center noprint"> 
                                                        <button form="bookingForm" type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                                        <button onclick="location.href = '<c:url value="/manager/allBookings"/>'"
                                                                class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
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