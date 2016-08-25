<%@include file="includes/header_simple.jsp" %>


<div class="centered-alert">
    <c:if test="${param.username_error != null}">
        <div class="alert alert-warning animated bounce text-center">
            <i class="fa fa-warning" style="font-size: 15px;"></i> Sorry. This email already exists.
        </div>
    </c:if>
    <c:if test="${param.name_error != null}">
        <div class="alert alert-warning animated bounce text-center">
            <i class="fa fa-warning" style="font-size: 15px;"></i> Sorry. The name must be at least 2 characters long.
        </div>
    </c:if>
    <c:if test="${param.password_error != null}">
        <div class="alert alert-warning animated bounce text-center">
            <i class="fa fa-warning" style="font-size: 15px;"></i> Sorry. The password does not meet the requirements.
        </div>
    </c:if>
</div>


<div id="sign-up" class="centered">
    <div id="sign-up-panel" class="panel panel-default animated bounceIn">

        <div class="panel-heading">
            <h3 class="panel-title">Signup</h3>
        </div>

        <div class="panel-body">

            <form:form modelAttribute="signupForm" role="form">

                <form:errors/>

                <div class="form-group">
                    <form:label path="email">Email address</form:label>
                    <form:input path="email" type="email" class="form-control" placeholder="Enter email"/>
                    <form:errors cssClass="error" path="email"/>
                        <%--<p class="help-block">Enter a unique email address. It will also be your login id.</p>--%>
                </div>

                <div class="form-group">
                    <form:label path="name">Name</form:label>
                    <form:input path="name" class="form-control" placeholder="Enter name"/>
                    <form:errors cssClass="error" path="name"/>
                        <%--<p class="help-block">Enter your display name.</p>--%>
                </div>

                <div class="form-group">
                    <form:label path="password">Password</form:label>
                    <form:password path="password" class="form-control" placeholder="Password"/>
                    <form:errors cssClass="error" path="password"/>
                </div>

                <button type="submit" class="btn btn-success ladda-button" data-style="zoom-in"><span
                        class="ladda-label">Submit</span>
                </button>

            </form:form>
        </div>
    </div>
</div>
<%@include file="includes/footer_simple.jsp" %>