<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/security/tags" 
           prefix="sec" %>
<div class="page-header navbar navbar-fixed-top">
    <div class="page-header-inner ">
        <!-- logo start -->
        <div class="page-logo">
            <a href="<c:url value="/home"/>">
                <img alt="" src="<c:url value="/resources-management/img/logo.png"/>" width="50px" height="50px">
                <span class="logo-default" >Home</span> </a>
        </div>
        <!-- logo end -->
        <ul class="nav navbar-nav navbar-left in">
            <li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
        </ul>

        <!-- start mobile menu -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
            <span></span>
        </a>
        <!-- end mobile menu -->
        <!-- start header menu -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <!-- start notification dropdown -->

                <!-- end notification dropdown -->
                <!-- start message dropdown -->

                <!-- end message dropdown -->
                <!-- start manage admin dropdown -->
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <img alt="" class="img-circle " src="<c:url value="/resources-management/img/boss.jpg"/>" />
                        <span class="username username-hide-on-mobile"> ${userFullName} </span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default animated jello">                        
                        <li>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <a href="<c:url value="/admin/adminProfile"/>">
                                    <i class="icon-user"></i> Admin Profile </a>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <a href="<c:url value="/user/userProfile"/>">
                                    <i class="icon-user"></i> User Profile </a>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_MANAGER')">
                                <a href="<c:url value="/manager/managerProfile"/>">
                                    <i class="icon-user"></i> Manager Profile </a>
                            </sec:authorize>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/contacts"/>">
                                <i class="icon-directions"></i> Help
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/logout"/>">
                                <i class="icon-logout"></i> Log Out </a>
                        </li>
                    </ul>
                </li>
                <!-- end manage admin dropdown -->
                <li class="dropdown dropdown-quick-sidebar-toggler">
                    <a id="headerSettingButton" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
                        <i class="material-icons">settings</i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
