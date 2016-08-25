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

        
        

        <form:form modelAttribute="valueset" class="form-horizontal" role="form">
            <div class="panel breadcrumb-panel">
                <div class="row">
                    <div class="btn-group btn-breadcrumb">
                        <a href="/" class="btn btn-default"><i class="fa fa-home fa-lg"></i></a>
                        <a href="/resource/valueset/view" class="btn btn-default">ValueSets</a>
                        <a href="/resource/valueset/${valuesetId}/view" class="btn btn-default">ValueSet View</a>
                        <a href="/resource/valueset/${valuesetId}/edit" class="btn btn-default bc-active">ValueSet
                            Edit</a>
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
                            <td><input id="vsCodeDisplay" value="${formattedSystemText}" name="vsCodeDisplay" class="form-control"
                                       placeholder="ValueSet Code"/></td>
                        </tr>
                        <tr>
                            <td class="td-gg">ValueSet URL</td>
                            <td><form:input path="url" class="form-control" placeholder="ValueSet URL"/></td>
                        </tr>
                        <tr>
                            <td class="td-gg">ValueSet Name</td>
                            <td>
                                <form:input path="name" class="form-control" placeholder="ValueSet Name"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">ValueSet Version</td>
                            <td>
                                <form:input path="version" class="form-control" placeholder="ValueSet Version"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">ValueSet Description</td>
                            <td>
                                <form:input path="description" class="form-control" placeholder="ValueSet Description"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="panel panel-primary">

                <c:set var="codeCount" value="${valueset.getCodeSystem().getConcept().size()}"/>
                <%--<c:set var="newRow" value="<tr><td><form:input path='codeSystem.concept${[codeCount]}.code' class='form-control' placeholder='ValueSet Code Code'/></td><td><form:input path='codeSystem.concept${[codeCount]}.display' class='form-control' placeholder='ValueSet Code Display'/></td><td><form:input path='codeSystem.concept${[codeCount]}.definition' class='form-control' placeholder='ValueSet Code Definition'/></td><td class='url-data'><input value='${formattedSystemText}' class='form-control' placeholder='ValueSet Description' disabled title='Update Prohibited: Field can only be edited within the ValueSet'/></td><td><input value='${valueset.getName()}' class='form-control' placeholder='ValueSet Description' disabled title='Update Prohibited: Field can only be edited within the ValueSet'/></td></tr>"/>--%>
                <div class="panel-heading">
                    <i class="fa fa-list fa-fw"></i> Code List<span class="badge"
                                                                    style="margin-left: 10px;">${codeCount}</span>
                    <%--<div class="btn-group dropdown" style="margin-left: 10px;">--%>
                        <%--<a class="btn btn-default btn-sm" href="#"><i class="fa fa-navicon fa-fw"></i>--%>
                            <%--Actions</a>--%>
                        <%--<a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" role=button href="#"--%>
                           <%--aria-haspopup="true" aria-expanded="false">--%>
                            <%--<span class="fa fa-caret-down" style="color: black"></span></a>--%>
                        <%--<ul class="dropdown-menu" data-dropdown-in="bounceIn" data-dropdown-out="bounceOut">--%>
                            <%--<li><a onclick='return addCode()' id="addCodeBtn"><i--%>
                                    <%--class="fa fa-plus fa-fw"></i> Add</a></li>--%>
                            <%--<li class="divider"></li>--%>
                            <%--<li><a href="#"><i--%>
                                    <%--class="fa fa-remove fa-fw"></i> Remove</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>
                </div>
                <div class="panel-body">
                    <div class="table-responsive" style="overflow-x: auto">
                        <c:choose>
                            <c:when test="${codeCount > 0}">
                                <table id="code-table"
                                       class="table table-bordered table-hover table-pagination display dataTable">
                                    <thead>
                                    <th>Code</th>
                                    <th>Name</th>
                                    <th>Preferred Name</th>
                                    <th>Code System</th>
                                    <th>ValueSet</th>
                                        <%--<th></th>--%>
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
                                                <form:input path="codeSystem.concept${[i]}.code" class="form-control"
                                                            placeholder="ValueSet Code Code"/><span hidden><c:out value="${codeCode}"/></span>
                                            </td>
                                            <td>
                                                <form:input path="codeSystem.concept${[i]}.display" class="form-control"
                                                            placeholder="ValueSet Code Display"/><span hidden><c:out value="${codeDisplay}"/></span>
                                            </td>
                                            <td>
                                                <form:input path="codeSystem.concept${[i]}.definition"
                                                            class="form-control"
                                                            placeholder="ValueSet Code Definition"/><span hidden><c:out value="${codeDefinition}"/></span>
                                            </td>
                                            <td class="url-data">
                                                <input value="${formattedSystemText}" class="form-control"
                                                       placeholder="ValueSet Description" disabled
                                                       title="Update Prohibited: Field can only be edited within the ValueSet"/><span hidden><c:out value="${formattedSystemText}"/></span>
                                            </td>
                                            <td>
                                                <input value="${valueset.getName()}" class="form-control"
                                                       placeholder="ValueSet Description" disabled
                                                       title="Update Prohibited: Field can only be edited within the ValueSet"/><span hidden><c:out value="${valueset.getName()}"/></span>
                                            </td>
                                                <%--<td>--%>
                                                <%--<a class="btn btn-info btn-sm ladda-button" type="button"--%>
                                                <%--data-style="zoom-in"--%>
                                                <%--href="<c:out value="/resource/valueset/${valuesetId}/code/${codeCode}/view"/> " disabled="true"><span--%>
                                                <%--class="ladda-label"><i--%>
                                                <%--class="fa fa-list-alt fa-fw"></i> Details</span></a>--%>
                                                <%--</td>--%>
                                        </tr>
                                    </c:forEach>
                                    <%--<tr>--%>
                                        <%--<td>--%>
                                            <%--<form:input path="codeSystem.concept${[codeCount]}.code"--%>
                                                        <%--class="form-control" placeholder="ValueSet Code Code"/>--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<form:input path="codeSystem.concept${[codeCount]}.display"--%>
                                                        <%--class="form-control" placeholder="ValueSet Code Display"/>--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<form:input path="codeSystem.concept${[codeCount]}.definition"--%>
                                                        <%--class="form-control" placeholder="ValueSet Code Definition"/>--%>
                                        <%--</td>--%>
                                        <%--<td class="url-data">--%>
                                            <%--<input value="${formattedSystemText}" class="form-control"--%>
                                                   <%--placeholder="ValueSet Description" disabled--%>
                                                   <%--title="Update Prohibited: Field can only be edited within the ValueSet"/>--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<input value="${valueset.getName()}" class="form-control"--%>
                                                   <%--placeholder="ValueSet Description" disabled--%>
                                                   <%--title="Update Prohibited: Field can only be edited within the ValueSet"/>--%>
                                        <%--</td>--%>
                                            <%--&lt;%&ndash;<td>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<a class="btn btn-info btn-sm ladda-button" type="button"&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;data-style="zoom-in"&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;href="<c:out value="/resource/valueset/${valuesetId}/code/${codeCode}/view"/> " disabled="true"><span&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;class="ladda-label"><i&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;class="fa fa-list-alt fa-fw"></i> Details</span></a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                    <%--</tr>--%>
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
            <div class="form-group">
                <div class="text-center">
                    <button type="submit" value="save" class="btn btn-success ladda-button" data-style="zoom-in"><span
                            class="ladda-label">Save</span></button>
                    <a href="/resource/valueset/${valuesetId}/view" class="btn btn-danger ladda-button"
                       data-style="zoom-in"><span class="ladda-label">Cancel</span></a>
                </div>
            </div>
        </form:form>
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
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"/>--%>
<%--<script type="application/javascript">--%>

    <%--function addCode() {--%>
        <%--console.log("added row!");--%>
        <%--$('#code-table > tbody').append("${newRow}");--%>
    <%--}--%>
<%--</script>--%>

<%@include file="includes/footer.jsp" %>