<%@include file="includes/header_simple.jsp" %>

<div class="centered-alert">
    <c:if test="${param.error != null}">
        <div class="alert alert-warning animated bounce text-center">
            <i class="fa fa-warning" style="font-size: 15px;"></i> Invalid username and password.
        </div>
    </c:if>

    <c:if test="${param.logout != null}">
        <div class="alert alert-success animated bounce text-center">
            <i class="fa fa-check-circle-o fa-fw" style="font-size: 17px;"></i> You have been logged out.
        </div>
    </c:if>
</div>

<div id="reset-password" class="centered">

    <div id="reset-password-panel" class="panel panel-default">

        <div class="panel-heading">
            <h3 class="panel-title">Reset password</h3>
        </div>

        <div class="panel-body">

            <form:form modelAttribute="resetPasswordForm" role="form">

                <form:errors/>

                <div class="form-group">
                    <form:label path="password">Type new password</form:label>
                    <form:password path="password" class="form-control" placeholder="Password"/>
                    <form:errors cssClass="error" path="password"/>
                </div>

                <div class="form-group">
                    <form:label path="retypePassword">Retype new password</form:label>
                    <form:password path="retypePassword" class="form-control" placeholder="Retype password"/>
                    <form:errors cssClass="error" path="retypePassword"/>
                </div>

                <button type="submit" class="btn btn-success">Submit</button>

            </form:form>
        </div>
    </div>

<%@include file="includes/footer_simple.jsp" %>