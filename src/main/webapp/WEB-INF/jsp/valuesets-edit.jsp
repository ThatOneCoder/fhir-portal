<%@include file="includes/header.jsp" %>
<%@ page import="ca.uhn.fhir.model.dstu2.resource.ValueSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<div class="container-fluid">
    <div class="panel breadcrumb-panel">
        <div class="row">
            <div class="btn-group btn-breadcrumb">
                <a href="/" class="btn btn-default"><i class="fa fa-home fa-lg"></i></a>
                <a href="/resource/valueset" class="btn btn-default bc-active">ValueSets</a>
            </div>
        </div>
    </div>

    <div class="panel panel-primary">

        <div class="panel-heading">
            <i class="fa fa-list fa-fw"></i> ValueSet List<span class="badge"
                                                                style="margin-left: 10px;">${fn: length(vsList)}</span>
            <sec:authorize access="isAuthenticated()">
                <%--<a href="/resource/valueset/${valuesetId}/edit" title="Edit ValueSet"--%>
                <%--class="btn btn-warning btn-sm ladda-button" data-style="zoom-in"><span class="ladda-label">Edit<i--%>
                <%--class="fa fa-pencil-square-o fa-lg" style="margin-left: 5px"></i></span></a>--%>
                <div class="btn-group dropdown" style="margin-left: 10px;">
                    <a class="btn btn-default btn-sm" href="#"><i class="fa fa-navicon fa-fw"></i>
                        Actions</a>
                    <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" role=button href="#"
                       aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-caret-down" style="color: black"></span></a>
                    <ul class="dropdown-menu" data-dropdown-in="bounceIn" data-dropdown-out="bounceOut">
                        <li><a href="/resource/valueset/view"><i
                                class="fa fa-file-text-o fa-fw"></i> View</a></li>
                        <li class="divider"></li>
                        <li><a href="/resource/valueset/add"><i
                                class="fa fa-plus fa-fw"></i> Add</a></li>
                        <li><a href="/resource/valueset/delete"><i
                                class="fa fa-copy fa-fw"></i> Copy</a></li>
                    </ul>
                </div>
            </sec:authorize>
        </div>
        <div class="panel-body">
            <table class="table table-bordered table-striped table-hover table-radius-separate">
                <thead class="thead-gg">
                <th>Action</th>
                <th>Code</th>
                <th>Name</th>
                <th>Version</th>
                <th>Description</th>
                <th></th>
                </thead>
                <tbody>
                <c:forEach items="${vsList}" var="valueset">

                    <c:set var="valuesetUrl" value="${valueset.getId()}"/>
                    <c:set var="startIndex" value="${fn:indexOf(valuesetUrl, 'ValueSet/') + 9}"/>
                    <c:set var="endIndex" value="${fn:indexOf(valuesetUrl, '/_history')}"/>
                    <c:set var="valuesetId" value="${fn:substring(valuesetUrl, startIndex, endIndex)}"/>
                    <c:set var="valuesetStatus" value="${valueset.getStatus()}"/>
                    <c:set var="valuesetDate" value="${valueset.getDate()}"/>
                    <c:set var="valuesetDescription" value="${valueset.getDescription()}"/>
                    <tr>
                        <td style="text-align: center; vertical-align: middle">
                            <div class="deleteIconDiv">
                                <i class="fa fa-minus-circle fa-fw deleteIcon"></i>
                            </div>
                        </td>
                        <td>
                            <c:out value="${valuesetId}"/>
                        </td>
                        <td>
                            <c:out value="${valueset.getName()}"/>
                        </td>
                        <td>
                            <c:out value="${valueset.getVersion()}"/>
                        </td>
                        <td>
                            <c:out value="${valueset.getDescription()}"/>
                        </td>
                        <td>
                            <c:set var="valuesetUrl" value="${valueset.getId()}"/>
                            <c:set var="startIndex" value="${fn:indexOf(valuesetUrl, 'ValueSet/') + 9}"/>
                            <c:set var="endIndex" value="${fn:indexOf(valuesetUrl, '/_history')}"/>
                            <c:set var="valuesetId" value="${fn:substring(valuesetUrl, startIndex, endIndex)}"/>

                            <a class="btn btn-info btn-sm ladda-button" type="button" data-style="zoom-in"
                               href="<c:out value="/resource/valueset/${valuesetId}/view"/> "><span
                                    class="ladda-label"><i
                                    class="fa fa-list-alt fa-fw"></i> Details</span></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>