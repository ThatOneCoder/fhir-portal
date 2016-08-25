<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="includes/header.jsp" %>
<%@ page import="ca.uhn.fhir.model.dstu2.resource.ValueSet" %>

<c:choose>
    <c:when test="${valueset.getDescription() ne 'NOT FOUND'}">
        <c:set var="valuesetFullUrl" value="${valueset.getId()}"/>
        <c:set var="startIndex" value="${fn:indexOf(valuesetFullUrl, 'ValueSet/') + 9}"/>
        <c:set var="endIndex" value="${fn:indexOf(valuesetFullUrl, '/_history')}"/>
        <c:set var="valuesetId" value="${fn:substring(valuesetFullUrl, startIndex, endIndex)}"/>
        <c:set var="valuesetStatus" value="${valueset.getStatus()}"/>
        <c:set var="valuesetDate" value="${valueset.getDate()}"/>
        <c:set var="valuesetDescription" value="${valueset.getDescription()}"/>
        <c:set var="valuesetUrl" value="${valueset.getUrl()}"/>


        <div class="panel breadcrumb-panel">
            <div class="row">
                <div class="btn-group btn-breadcrumb">
                    <a href="/" class="btn btn-default"><i class="fa fa-home fa-lg"></i></a>
                    <a href="/resource/valueset/view" class="btn btn-default">ValueSets</a>
                    <a href="/resource/valueset/${valuesetId}/view" class="btn btn-default bc-active">ValueSet</a>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-sitemap fa-fw"></i> ValueSet
                <a class="btn btn-warning btn-sm" href="#" style="margin-left: 10px;" title="The ValueSet version currently being view is: version <c:out value="${current_version}"/>">Version <c:out value="${current_version}"/></a>
                <a class="btn btn-success btn-sm" href="#" style="margin-left: 10px;" title="The ValueSet is active and available for use.">
                Status -
                Active <i class="fa fa-check-circle-o fa-fw" style="color: white;"></i></a>
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
                            <li><a href="/resource/valueset/${valuesetId}/edit"><i
                                    class="fa fa-pencil-square-o fa-fw"></i> Edit</a></li>
                            <li class="divider"></li>
                            <li><a href="/resource/valueset/${valuesetId}/copy"><i
                                    class="fa fa-copy fa-fw"></i> Copy</a></li>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <li>
                                    <a href="/resource/valueset/${valuesetId}/delete">
                                        <i class="fa fa-remove fa-fw"></i> Delete
                                    </a>
                                </li>
                            </sec:authorize>
                        </ul>
                    </div>
                </sec:authorize>
                <div class="btn-group dropdown pull-right" style="margin-left: 10px;">
                    <a class="btn btn-default btn-sm" href="#"><i class="fa fa-navicon fa-fw"></i>
                        Versions</a>
                    <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" role=button href="#"
                       aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-caret-down" style="color: black"></span></a>
                    <ul class="dropdown-menu" data-dropdown-in="bounceIn" data-dropdown-out="bounceOut">
                        <c:forEach items="${versions}" var="version">
                            <li><a href="/resource/valueset/${valuesetId}/view/${version}"><c:out
                                    value="${version}"/></a></li>
                            <%--<li class="divider"></li>--%>
                            <%--<li><a href="/resource/valueset/${valuesetId}/copy"><i--%>
                            <%--class="fa fa-copy fa-fw"></i> Copy</a></li>--%>
                        </c:forEach>
                    </ul>
                </div>
                    <%--<div>--%>
                    <%--<select id="version_list">--%>
                    <%--<c:forEach items="#{versions}" var="version">--%>
                    <%--<option value="#{item.value}">#{version}</option>--%>
                    <%--</c:forEach>--%>
                    <%--</select>--%>
                    <%--</div>--%>
            </div>
            <div class="panel-body">
                <table class="table table-bordered table-radius-separate table-double-col-no-header">
                    <colgroup>
                        <col class="col-xs-1">
                        <col class="col-xs-7">
                    </colgroup>
                    <tbody>
                        <c:set var="valuesetSystem" value="${valueset.getCodeSystem().getSystem()}"/>
                            <%
                        String system = (String) pageContext.getAttribute("valuesetUrl");
                        int lastIndex = system.lastIndexOf("/") + 1;
                        system = system.substring(lastIndex);
                        pageContext.setAttribute("formattedSystemText", system);
                    %>
                    <tr>
                        <td class="td-gg">ValueSet Code</td>
                        <td><c:out value="${formattedSystemText}"/></td>
                    </tr>
                    <tr>
                        <td class="td-gg">ValueSet URL</td>
                        <td><a href="<c:out value='${valueset.getUrl()}'/>" target="_blank"><c:out
                                value="${valueset.getUrl()}"/></a></td>
                    </tr>
                    <tr>
                        <td class="td-gg">ValueSet Name</td>
                        <td>
                            <c:out value="${valueset.getName()}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-gg">ValueSet Version</td>
                        <td>
                            <c:out value="${valueset.getVersion()}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-gg">ValueSet Description</td>
                        <td>
                            <c:out value="${valueset.getDescription()}"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="panel panel-primary">

            <c:set var="codeCount" value="${valueset.getCodeSystem().getConcept().size()}"/>
            <div class="panel-heading">
                <i class="fa fa-list fa-fw"></i> Code List<span class="badge"
                                                                style="margin-left: 10px;">${codeCount}</span>
            </div>
            <div class="panel-body">
                <div class="table-responsive" style="overflow-x: auto">
                    <c:choose>
                        <c:when test="${codeCount > 0}">
                            <table class="table table-bordered table-hover table-pagination display dataTable"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Name</th>
                                    <th>Preferred Name</th>
                                    <th>System</th>
                                    <th>ValueSet</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" begin="0" end="${codeCount - 1}">
                                    <c:set var="codeCode"
                                           value="${valueset.getCodeSystem().getConcept().get(i).getCode()}"/>
                                    <c:set var="codeDisplay"
                                           value="${valueset.getCodeSystem().getConcept().get(i).getDisplay()}"/>
                                    <c:set var="codeDisplay"
                                           value="${valueset.getCodeSystem().getConcept().get(i).getDisplay()}"/>
                                    <c:set var="codeDefinition"
                                           value="${valueset.getCodeSystem().getConcept().get(i).getDefinition()}"/>
                                    <tr>
                                        <td>
                                            <c:out value="${codeCode}"/>
                                        </td>
                                        <td>
                                            <c:out value="${codeDisplay}"/>
                                        </td>
                                        <td>
                                            <c:out value="${codeDefinition}"/>
                                        </td>
                                        <td class="url-data">
                                            <c:out value="${formattedSystemText}"/>
                                        </td>
                                        <td>
                                                <%--<c:out value="${valuesetId}"/>--%>
                                            <c:out value="${valueset.getName()}"/>
                                        </td>
                                        <td>
                                            <a class="btn btn-info btn-sm ladda-button" type="button"
                                               data-style="zoom-in"
                                               href="<c:out value="/resource/valueset/${valuesetId}/code/${codeCode}/view"/> "><span
                                                    class="ladda-label"><i
                                                    class="fa fa-list-alt fa-fw"></i> Details</span></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <span><i class="fa fa-chain-broken fa-lg"></i> No Codes Found</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

    </c:when>
    <c:otherwise>
        <div class="panel">
            <div class="row">
                <div class="btn-group btn-breadcrumb">
                    <a href="/" class="btn btn-default"><i class="fa fa-home fa-lg"></i></a>
                    <a href="/resource/valueset/view" class="btn btn-default">ValueSets</a>
                    <a href="#" class="btn btn-default bc-active">ValueSet Codes</a>
                </div>
            </div>
        </div>

        <div class="panel panel-danger">
            <div class="panel-heading">
                <i class="fa fa-exclamation-circle fa-fw"></i> Warning
            </div>
            <div class="panel-body">
                <table class="table table-bordered table-radius-separate table-double-col-no-header table-hover">
                    <colgroup>
                        <col class="col-xs-1">
                        <col class="col-xs-7">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td class="td-gg">Concept Code</td>
                        <td><c:out value="${searchCode}"/></td>
                    </tr>
                    <tr>
                        <td class="td-gg">Results</td>
                        <td><span>code <strong class="text-danger">${searchCode}</strong> was not found</span>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </c:otherwise>
</c:choose>
<%@include file="includes/footer.jsp" %>