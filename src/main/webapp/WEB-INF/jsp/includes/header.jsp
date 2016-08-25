<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FHIR Vocabulary Portal</title>

    <!-- Bootstrap -->
    <link href="/public/lib/bootstrap-3.1.1/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <%--<link href="/public/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- Our CSS -->
    <link href="/public/css/styles.css" rel="stylesheet">

    <%--<!-- MetisMenu CSS -->--%>
    <%--<link href="/public/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">--%>

    <!-- Timeline CSS -->
    <%--<link href="/public/dist/css/timeline.css" rel="stylesheet">--%>

    <!-- Custom CSS -->
    <link href="/public/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <%--<link href="/public/bower_components/morrisjs/morris.css" rel="stylesheet">--%>

    <!-- Custom Fonts -->
    <link href="/public/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="/public/css/animate.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<div>
    <div id="wrapper">
        <nav class="navbar navbar-gg navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <%--<button type="button" class="navbar-toggle" data-toggle="collapse"--%>
                    <%--data-target="#bs-example-navbar-collapse-1">--%>
                    <%--<span class="sr-only">Toggle navigation</span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--</button>--%>
                    <a class="logo" href="/">
                        <img alt="CDC" height="45px" src="/public/images/cdc-logo.png">
                    </a>
                    <a class="logo" href="/">
                        <img alt="FHIR" width="100px" src="/public/images/fhir-logo.png">
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <form class="navbar-form navbar-left" role="search" action="/resource/valueset/search">
                        <div class="form-group">
                            <input type="text" name="text" class="form-control" placeholder="valueset code">
                        </div>
                        <button type="submit" class="btn btn-primary ladda-button" data-style="zoom-in"><span
                                class="ladda-label">Search</span></button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <sec:authorize access="isAnonymous()">

                            <%--<li><a href="<c:url value='/signup' />"><span class="glyphicon glyphicon-list-alt"></span>--%>
                                <%--Sign--%>
                                <%--up</a></li>--%>
                            <%--<li>--%>
                            <div class="btn-group" style="margin-top: 10px; margin-right: 10px;">
                                <a href="/login" class="btn btn-primary ladda-button" data-style="zoom-in"><span class="ladda-label"><i class="fa fa-sign-in"></i> Sign in</span></a>
                            </div>
                            <%--</li>--%>
                        </sec:authorize>

                        <sec:authorize access="isAuthenticated()">
                            <div class="btn-group dropdown" style="margin-top: 10px; margin-right: 10px;">
                                <a class="btn btn-primary" href="#"><i class="fa fa-user fa-fw"></i>
                                    <sec:authentication property="principal.user.name"/></a>
                                <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" role=button href="#"
                                   aria-haspopup="true" aria-expanded="false">
                                    <span class="fa fa-caret-down"></span></a>
                                <ul class="dropdown-menu" data-dropdown-in="bounceIn" data-dropdown-out="bounceOut">
                                    <li><a href="/users/<sec:authentication property='principal.user.id' />"><i
                                            class="fa fa-user fa-fw"></i> Profile</a></li>
                                    <li class="divider"></li>
                                    <li>
                                        <c:url var="logoutUrl" value="/logout"/>
                                        <form:form id="logoutForm" action="${logoutUrl}" method="post">
                                        </form:form>
                                        <a href="#" onclick="document.getElementById('logoutForm').submit()"><i
                                                class="fa fa-sign-out fa-fw"></i> Sign out</a>
                                    </li>
                                </ul>
                            </div>
                        </sec:authorize>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
            <%--</nav>--%>
            <%--<nav>--%>

            <%-- LEFT SIDEBAR START --%>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> ValueSets<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/resource/valueset/view">View</a>
                                </li>
                                <sec:authorize access="isAuthenticated()">
                                    <li>
                                        <a href="/resource/valueset/create">Create</a>
                                    </li>
                                    <li>
                                        <a href="/resource/valueset/update">Update</a>
                                    </li>
                                    <li>
                                        <a href="/resource/valueset/delete">Delete</a>
                                    </li>
                                </sec:authorize>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-list fa-fw"></i> Lists<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/resource/list/view">View</a>
                                </li>
                                <sec:authorize access="isAuthenticated()">
                                    <li>
                                        <a href="/resource/list/create">Create</a>
                                    </li>
                                    <li>
                                        <a href="/resource/list/update">Update</a>
                                    </li>
                                    <li>
                                        <a href="/resource/list/delete">Delete</a>
                                    </li>
                                </sec:authorize>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-eye fa-fw"></i> Observations<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/resource/observation/view">View</a>
                                </li>
                                <sec:authorize access="isAuthenticated()">
                                    <li>
                                        <a href="/resource/observation/view">Create</a>
                                    </li>
                                    <li>
                                        <a href="/resource/observation/view">Update</a>
                                    </li>
                                    <li>
                                        <a href="/resource/observation/view">Delete</a>
                                    </li>
                                </sec:authorize>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper" style="padding-top: 65px; padding-bottom: 55px;">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <sec:authorize access="hasRole('ROLE_UNVERIFIED')">
                        <div class="alert alert-warning alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Your email id is unverified. <a href="/users/resend-verification-mail">Click here</a> to get
                            the verification
                            mail again.
                        </div>
                    </sec:authorize>

                    <c:if test="${not empty flashMessage}">
                        <div class="alert alert-${flashKind} alert-dismissable animated bounce">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${flashMessage}
                        </div>
                    </c:if>
                </div>
            </div>
            <!-- /.row -->
            <%--</div>--%>
            <!-- /#page-wrapper -->

            <%--</div>--%>
            <!-- /#wrapper -->