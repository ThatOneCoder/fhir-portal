<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="includes/header.jsp" %>
<%@ page import="ca.uhn.fhir.model.dstu2.resource.ValueSet" %>

<c:set var="valuesetUrl" value="${valueset.getId()}"/>
<c:set var="startIndex" value="${fn:indexOf(valuesetUrl, 'ValueSet/') + 9}"/>
<c:set var="endIndex" value="${fn:indexOf(valuesetUrl, '/_history')}"/>
<c:set var="valuesetId" value="${fn:substring(valuesetUrl, startIndex, endIndex)}"/>
<c:set var="valuesetStatus" value="${valueset.getStatus()}"/>
<c:set var="valuesetDate" value="${valueset.getDate()}"/>
<c:set var="valuesetDescription" value="${valueset.getDescription()}"/>
<c:set var="valuesetSystem" value="${valueset.getCodeSystem().getSystem()}"/>
<%
    String system = (String) pageContext.getAttribute("valuesetSystem");
    int lastIndex = system.lastIndexOf("/") + 1;
    system = system.substring(lastIndex);
    pageContext.setAttribute("formattedSystemText", system);
%>
<div class="container-fluid">
<div class="panel breadcrumb-panel">
    <div class="row">
        <div class="btn-group btn-breadcrumb">
            <a href="/" class="btn btn-default"><i class="fa fa-home fa-lg"></i></a>
            <a href="/resource/valueset/view" class="btn btn-default">ValueSets</a>
            <a href="/resource/valueset/${valuesetId}/view" class="btn btn-default">ValueSet</a>
            <a href="#" class="btn btn-default bc-active">Details</a>
        </div>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <i class="fa fa-sitemap fa-fw"></i> ValueSet and Code System Information
    </div>
    <div class="table-responsive">
        <div class="panel-body">
            <table class="table table-bordered table-radius-separate table-double-col-no-header table-hover">
                <colgroup>
                    <col class="col-xs-2">
                    <col class="col-xs-7">
                </colgroup>
                <tbody>

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
</div>
<div class="panel panel-primary">

    <c:set var="codeCount" value="${valueset.getCodeSystem().getConcept().size()}"/>
    <div class="panel-heading">
        <i class="fa fa-list fa-fw"></i> ValueSet Concept Details
    </div>
    <div class="table-responsive">
        <div class="panel-body">
            <table class="table table-bordered table-radius-separate table-double-col-no-header table-hover">
                <colgroup>
                    <col class="col-xs-2">
                    <col class="col-xs-7">
                </colgroup>
                <tbody>
                <c:forEach var="i" begin="0" end="${codeCount - 1}">

                    <c:set var="codeCode" value="${valueset.getCodeSystem().getConcept().get(i).getCode()}"/>
                    <c:if test="${codeCode eq code}">
                        <c:set var="codeDefinition" value="${valueset.getCodeSystem().getConcept().get(i).getDefinition()}"/>
                        <c:set var="codeDisplay" value="${valueset.getCodeSystem().getConcept().get(i).getDisplay()}"/>
                        <c:set var="valuesetSystem" value="${valueset.getCodeSystem().getSystem()}"/>

                        <tr>
                            <td class="td-gg">Concept Code</td>
                            <td>
                                <c:out value="${codeCode}"/>
                            </td>
                        </tr>
                        <%--<tr>--%>
                        <%--<td class="td-gg">Concept Name</td>--%>
                        <%--<td>--%>
                        <%--<c:out value="${codeDisplay}"/>--%>
                        <%--</td>--%>
                        <%--</tr>--%>
                        <tr>
                            <td class="td-gg">Preferred Concept Name</td>
                            <td>
                                <c:out value="${codeDefinition}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">ValueSet Concept Status</td>
                            <td>
                                <c:out value="${valuesetStatus}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">ValueSet Concept Status Date</td>
                            <td>
                                <c:out value="${valuesetDate}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">ValueSet Concept Description</td>
                            <td>
                                <c:out value="${valuesetDescription}"/>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="panel panel-primary">

    <c:set var="codeCount" value="${valueset.getCodeSystem().getConcept().size()}"/>
    <div class="panel-heading">
        <i class="fa fa-list fa-fw"></i> Code System Concept Details
    </div>
    <div class="table-responsive">
        <div class="panel-body">
            <table class="table table-bordered table-radius-separate table-double-col-no-header table-hover">
                <colgroup>
                    <col class="col-xs-2">
                    <col class="col-xs-7">
                </colgroup>
                <tbody>
                <c:forEach var="i" begin="0" end="${codeCount - 1}">

                    <c:set var="codeCode" value="${valueset.getCodeSystem().getConcept().get(i).getCode()}"/>
                    <c:if test="${codeCode eq code}">
                        <c:set var="codeDefinition" value="${valueset.getCodeSystem().getConcept().get(i).getDefinition()}"/>
                        <c:set var="codeDisplay" value="${valueset.getCodeSystem().getConcept().get(i).getDisplay()}"/>
                        <c:set var="valuesetSystem" value="${valueset.getCodeSystem().getSystem()}"/>
                        <tr>
                            <td class="td-gg">Code System Concept Name</td>
                            <td>
                                <c:out value="${codeDisplay}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">Code System Concept Status</td>
                            <td>
                                <c:out value="${valuesetStatus}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">Code System Preferred Concept Name</td>
                            <td>
                                <c:out value="${codeDefinition}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">Date Created</td>
                            <td>
                                <c:out value="${valuesetDate}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-gg">Date Revised</td>
                            <td>
                                <c:out value="${valuesetDate}"/>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="panel panel-primary">

    <c:set var="codeCount" value="${valueset.getCodeSystem().getConcept().size()}"/>
    <div class="panel-heading">
        <i class="fa fa-list fa-fw"></i> Associated ValueSets
    </div>
    <div class="table-responsive">
        <div class="panel-body">
            <table class="table table-bordered table-radius-separate table-double-col-no-header">
                <colgroup>
                    <col class="col-xs-2">
                    <col class="col-xs-7">
                </colgroup>
                <tbody>
                <tr>
                    <td class="td-gg">ValueSet Name</td>
                    <td>
                        N/A
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<%@include file="includes/footer.jsp" %>