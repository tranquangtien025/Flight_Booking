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
        <title>Promotion</title>
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
                $('#startDate').on('change', function () {
                    var today = new Date().toISOString().slice(0, 10);

                    if ($('#startDate').val() < today) {
                        $('#startDate').val(today);
                    }
                    if ($('#endDate').val() !== '') {
                        if ($('#startDate').val() > $('#endDate').val()) {
                            $('#startDate').val($('#endDate').val());
                        }
                    }
                });

                $('#endDate').on('change', function () {
                    var today = new Date().toISOString().slice(0, 10);

                    if ($('#endDate').val() < today) {
                        $('#endDate').val(today);
                    }
                    if ($('#startDate').val() !== '') {
                        if ($('#endDate').val() < $('#startDate').val()) {
                            $('#endDate').val($('#startDate').val());
                        } 
                    }
                });
            });
        </script>

        <script type="text/javascript">
            function validation() {
                var name = $('#name').val();
                var startDate = $('#startDate').val();
                var endDate = $('#endDate').val();
                var description = $('#description').val();
                var discount = $('#discount').val();
                var error = 0;

                if (name === "") {
                    document.getElementById("nameError").innerHTML = "This field is required";
                    error += 1;
                } else if (name.length > 40 || name.length < 3) {
                    document.getElementById("nameError").innerHTML = "This field must be greater than or equals to 3 and less than or equals to 40 characters";
                    error += 1;
                } else {
                    document.getElementById("nameError").innerHTML = "";
                }          
                
                if (startDate === "") {
                    document.getElementById("startDateError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("startDateError").innerHTML = "";
                }

                if (endDate === "") {
                    document.getElementById("endDateError").innerHTML = "This field is required";
                    error += 1;
                } else {
                    document.getElementById("endDateError").innerHTML = "";
                }
                
                if (startDate == endDate && startDate !== "" && endDate !== "") {
                    document.getElementById("startDateError").innerHTML = "Start Date must be before End Date";
                    document.getElementById("endDateError").innerHTML = "End Date must be after Start Date";
                    error += 1;
                }
                
                if (description === "") {
                    document.getElementById("descriptionError").innerHTML = "This field is required";
                    error += 1;
                } else if (name.length > 100 || name.length < 3) {
                    document.getElementById("descriptionError").innerHTML = "This field must be greater than or equals to 3 and less than or equals to 100 character";
                    error += 1;
                } else {
                    document.getElementById("descriptionError").innerHTML = "";
                }
                
                if (discount === "") {
                    document.getElementById("discountError").innerHTML = "This field is required";
                    error += 1;
                } else if (discount < 0) {
                    document.getElementById("discountError").innerHTML = "Discount must be greater than or equal to 0 percentage";
                    error += 1;
                } else {
                    document.getElementById("discountError").innerHTML = "";
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
                                <li class="nav-item active">
                                    <a href="#" class="nav-link nav-toggle">
                                        <i class="material-icons">event_available</i>
                                        <span class="title">Manage Promotions</span>
                                        <span class="arrow"></span>
                                    </a>
                                    <c:if test="${action == 'add'}">
                                        <ul class="sub-menu">
                                            <li class="nav-item active">
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
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
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
                                            <li class="nav-item active">
                                                <a href="<c:url value="/manager/editPromotion/${promotion.id}"/>" class="nav-link ">
                                                    <span class="title">Edit Promotion Details</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </c:if>
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
                                        <div class="page-title">Add Promotion Details</div>
                                    </c:if>
                                    <c:if test="${action == 'edit'}">
                                        <div class="page-title">Edit Promotion Details</div>
                                    </c:if>                                                   
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <c:if test="${action == 'add'}">
                                        <li><a class="parent-item active" href="">Add Promotion Details</a></li>
                                        </c:if>
                                        <c:if test="${action == 'edit'}">
                                        <li><a class="parent-item active" href="">Edit Promotion Details</a></li>
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

                                        <mvc:form id="promotionForm" action="${pageContext.request.contextPath}/manager/promotionResult/${action}"
                                                  method="post" 
                                                  modelAttribute="promotion"
                                                  onsubmit="return validation();"
                                                  >

                                            <c:if test="${action == 'edit'}">
                                                <input type="text" name="id" 
                                                       value="${promotion.id}" hidden />
                                            </c:if>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" id="name" 
                                                               value="${promotion.name}" name="name">
                                                        <label class = "mdl-textfield__label">Name</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="nameError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <br><input class = "mdl-textfield__input" type = "date" id = "startDate" 
                                                                   value="${promotion.startDate}" name="startDate">
                                                        <label class = "mdl-textfield__label">Start Date</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br><br>
                                                    <p style="color: red" id="startDateError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <br><input class = "mdl-textfield__input" type = "date" id = "endDate" 
                                                                   value="${promotion.endDate}" name="endDate">
                                                        <label class = "mdl-textfield__label">End Date</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br><br>
                                                    <p style="color: red" id="endDateError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" id = "description"
                                                               value="${promotion.description}" name="description">
                                                        <label class = "mdl-textfield__label" >Description</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="descriptionError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "number" id = "discount"
                                                               value="${promotion.discount}" name="discount">
                                                        <label class = "mdl-textfield__label">Discount (%)</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 
                                                    <br>
                                                    <p style="color: red" id="discountError"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-9 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <select name="status" class="mdl-textfield__input">
                                                            <c:forEach var="status" items="${statuses}">
                                                                <c:if test="${promotion.status == status}">
                                                                    <option value="${status}" selected>${status}</option>
                                                                </c:if>
                                                                <c:if test="${promotion.status != status}">
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
                                                        <br><select name="listFlightId" class="mdl-textfield__input" multiple>
                                                            <c:forEach var="flight" items="${flights}">
                                                                <c:forEach var="selectedFlight" items="${promotionService.getListFlightIdOfPromotion(promotionId)}">                                                                    
                                                                    <c:if test="${selectedFlight == flight.id}">
                                                                        <% exist = true; %>
                                                                    </c:if>
                                                                </c:forEach>       
                                                                <% if (exist == true) {%>
                                                                <option value="${flight.id}" selected> * ${flight.departureDate} / ${flight.departureTime} / ${flight.flightNumber}: ${flight.flightRoute.departure.name} - ${flight.flightRoute.destination.name}</option>
                                                                <% } %>
                                                                <% if (exist == false) {%>
                                                                <option value="${flight.id}"> * ${flight.departureDate} / ${flight.departureTime} / ${flight.flightNumber}: ${flight.flightRoute.departure.name} - ${flight.flightRoute.destination.name}</option>
                                                                <%}%>
                                                                <% exist = false;%>
                                                            </c:forEach>
                                                        </select>
                                                        <label for="sample2" class="mdl-textfield__label">Flight</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20"> 

                                                </div>
                                            </div>

                                        </mvc:form>

                                        <div class="col-lg-12 p-t-20 text-center"> 
                                            <button form="promotionForm" type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                            <button onclick="location.href = '<c:url value="/manager/allPromotions"/>'"
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