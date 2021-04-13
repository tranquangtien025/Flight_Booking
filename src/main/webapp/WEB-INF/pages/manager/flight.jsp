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
        <title>Flight</title>
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
                $('#departureDate').on('change', function () {
                    var today = new Date().toISOString().slice(0, 10);

                    if ($('#departureDate').val() < today) {
                        $('#departureDate').val(today);
                    }
                    if ($('#arrivalDate').val() !== '') {
                        if ($('#departureDate').val() > $('#arrivalDate').val()) {
                            $('#departureDate').val($('#arrivalDate').val());
                        } else if ($('#arrivalDate').val() === $('#departureDate').val()) {
                            $('#arrivalTime').val($('#departureTime').val());
                        }
                    }
                });

                $('#arrivalDate').on('change', function () {
                    var today = new Date().toISOString().slice(0, 10);

                    if ($('#arrivalDate').val() < today) {
                        $('#arrivalDate').val(today);
                    }
                    if ($('#departureDate').val() !== '') {
                        if ($('#arrivalDate').val() < $('#departureDate').val()) {
                            $('#arrivalDate').val($('#departureDate').val());
                        } else if ($('#arrivalDate').val() === $('#departureDate').val()) {
                            $('#arrivalTime').val($('#departureTime').val());
                        }
                    }
                });

                $('#departureTime').on('change', function () {
                    if ($('#departureDate').val() === $('#arrivalDate').val()) {
                        if ($('#arrivalTime').val() !== '') {
                            if ($('#departureTime').val() > $('#arrivalTime').val()) {
                                $('#departureTime').val($('#arrivalTime').val());
                            }
                        }
                    }
                });

                $('#arrivalTime').on('change', function () {
                    if ($('#departureDate').val() === $('#arrivalDate').val()) {
                        if ($('#departureTime').val() !== '') {
                            if ($('#arrivalTime').val() < $('#departureTime').val()) {
                                $('#arrivalTime').val($('#departureTime').val());
                            }
                        }
                    }
                });
            });
        </script>

        <script type="text/javascript">
            function validation() {
                var flightNumber = $('#flightNumber').val();
                var departureDate = $('#departureDate').val();
                var arrivalDate = $('#arrivalDate').val();
                var departureTime = $('#departureTime').val();
                var arrivalTime = $('#arrivalTime').val();
                var error = 0;

                if (flightNumber === "") {
                    document.getElementById("flightNumberError").innerHTML = "This field is required";
                    error += 1;
                } else if (flightNumber.length > 6 || flightNumber.length < 3) {
                    document.getElementById("flightNumberError").innerHTML = "This field must be from 3 to 6 characters";
                    error += 1;
                } else {
                    document.getElementById("flightNumberError").innerHTML = "";
                }

                if (departureDate === "") {
                    document.getElementById("departureDateError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("departureDateError").innerHTML = "";
                }

                if (arrivalDate === "") {
                    document.getElementById("arrivalDateError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("arrivalDateError").innerHTML = "";
                }

                if (departureTime === "") {
                    document.getElementById("departureTimeError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("departureTimeError").innerHTML = "";
                }

                if (arrivalTime === "") {
                    document.getElementById("arrivalTimeError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("arrivalTimeError").innerHTML = "";
                }
                
                if (departureTime === arrivalTime && departureTime !== "" && arrivalTime !== "") {
                    document.getElementById("departureTimeError").innerHTML = "Departure Time must be different from Arrival Time";
                    document.getElementById("arrivalTimeError").innerHTML = "Arrival Time must be different from Departure Time";
                    error += 1;
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
                                                <span class="title">View All Bookings</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item active">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">flight_takeoff</i>
                                        <span class="title">Manage Flights</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <c:if test="${action == 'add'}">
                                        <ul class="sub-menu">
                                            <li class="nav-item active">
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
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
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
                                            <li class="nav-item active">
                                                <a href="<c:url value="/manager/editFlight/${flight.id}"/>" class="nav-link ">
                                                    <span class="title">Edit Flight Details</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </c:if>
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
                                    <c:if test="${action == 'add'}">
                                        <div class="page-title">Add Flight Details</div>
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
                                        <div class="page-title">Edit Flight Details</div>
                                    </c:if>                                                   
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <c:if test="${action == 'add'}">
                                        <li><a class="parent-item active" href="">Add Flight Details</a></li>
                                        </c:if>
                                        <c:if test="${action == 'edit'}">
                                        <li><a class="parent-item active" href="">Edit Flight Details</a></li>
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

                                        <mvc:form id="flightForm" action="${pageContext.request.contextPath}/manager/flightResult/${action}"
                                                  method="post" 
                                                  modelAttribute="flight"
                                                  onsubmit="return validation();">

                                            <c:if test="${action == 'edit'}">
                                                <input type="text" name="id" 
                                                       value="${flight.id}" hidden />
                                            </c:if>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" id = "flightNumber"
                                                               value="${flight.flightNumber}" name="flightNumber"
                                                               placeholder="Ex: VN210">
                                                        <label class = "mdl-textfield__label">Flight Number</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="flightNumberError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <select name="flightRoute.id" class="mdl-textfield__input">
                                                            <c:forEach var="flightRoute" items="${flightRoutes}">
                                                                <c:if test="${flight.flightRoute.id == flightRoute.id}">
                                                                    <option value="${flightRoute.id}" selected>${flightRoute.departure.name} - ${flightRoute.destination.name}</option>
                                                                </c:if>
                                                                <c:if test="${flight.flightRoute.id != flightRoute.id}">
                                                                    <option value="${flightRoute.id}">${flightRoute.departure.name} - ${flightRoute.destination.name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <label for="sample2" class="mdl-textfield__label">Flight Route</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <br><input class = "mdl-textfield__input" type = "date" id="departureDate" 
                                                                   value="${flight.departureDate}" name="departureDate">
                                                        <label class = "mdl-textfield__label">Departure Date</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="departureDateError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <br><input class = "mdl-textfield__input" type = "date" id="arrivalDate" 
                                                                   value="${flight.arrivalDate}" name="arrivalDate">
                                                        <label class = "mdl-textfield__label">Arrival Date</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="arrivalDateError"></p>
                                                </div>
                                            </div>                                            

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <br><input class = "mdl-textfield__input" type = "time" id="departureTime" 
                                                                   value="${flight.departureTime}" name="departureTime">
                                                        <label class = "mdl-textfield__label">Departure Time</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="departureTimeError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <br><input class = "mdl-textfield__input" type = "time" id = "arrivalTime" 
                                                                   value="${flight.arrivalTime}" name="arrivalTime">
                                                        <label class = "mdl-textfield__label">Arrival Time</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="arrivalTimeError"></p>
                                                </div>                                                    
                                            </div>                                            

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <select name="aircraft.id" class="mdl-textfield__input">
                                                            <c:forEach var="aircraft" items="${aircrafts}">
                                                                <c:if test="${flight.aircraft.id == aircraft.id}">
                                                                    <option value="${aircraft.id}" selected>${aircraft.name}</option>
                                                                </c:if>
                                                                <c:if test="${flight.aircraft.id != aircraft.id}">
                                                                    <option value="${aircraft.id}">${aircraft.name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <label for="sample2" class="mdl-textfield__label">Aircraft</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <select name="operation.id" class="mdl-textfield__input">
                                                            <c:forEach var="operation" items="${operations}">
                                                                <c:if test="${flight.operation.id == operation.id}">
                                                                    <option value="${operation.id}" selected>${operation.name}</option>
                                                                </c:if>
                                                                <c:if test="${flight.operation.id != operation.id}">
                                                                    <option value="${operation.id}">${operation.name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <label for="sample2" class="mdl-textfield__label">Operation</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <select name="status" class="mdl-textfield__input">
                                                            <c:forEach var="status" items="${statuses}">
                                                                <c:if test="${flight.status == status}">
                                                                    <option value="${status}" selected>${status}</option>
                                                                </c:if>
                                                                <c:if test="${flight.status != status}">
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

                                        </mvc:form>

                                        <div class="col-lg-12 p-t-20 text-center"> 
                                            <button form="flightForm" type="submit" 
                                                    class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink"                                                    
                                                    >Submit</button>
                                            <button onclick="location.href = '<c:url value="/manager/allFlights"/>'"
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