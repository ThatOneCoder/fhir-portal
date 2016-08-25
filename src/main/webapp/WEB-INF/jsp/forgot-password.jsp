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

<div id="forgot-password" class="centered">

    <div id="forgot-password-panel" class="panel panel-primary animated bounceInDown">

        <div class="panel-heading">
            <h3 class="panel-title">Forgot password?</h3>
        </div>

        <div class="panel-body">

            <form:form modelAttribute="forgotPasswordForm" role="form">

                <form:errors/>

                <div class="form-group">
                    <form:label path="email">Email address</form:label>
                    <form:input path="email" type="email" class="form-control" placeholder="Enter email"/>
                    <form:errors cssClass="error" path="email"/>
                    <%--<p class="help-block">Please enter your email id</p>--%>
                </div>

                <button type="submit" class="btn btn-success">Reset password</button>

            </form:form>
        </div>
    </div>
</div>

<%@include file="includes/footer_simple.jsp" %>
