<%@include file="includes/header_simple.jsp" %>


<%--<!-- Where all the magic happens -->--%>
<%--<!-- LOGIN FORM -->--%>
<%--<div class="text-center" style="padding:50px 0">--%>
<%--<div class="logo"><a class="logo" href="/">--%>
<%--<img alt="CDC" height="45px" src="/public/images/cdc-logo.png">--%>
<%--</a>--%>
<%--<a class="logo" href="/">--%>
<%--<img alt="FHIR" width="100px" src="/public/images/fhir-logo.png">--%>
<%--</a></div>--%>
<%--<!-- Main Form -->--%>
<%--<div class="login-form-1">--%>
<%--<form:form role="form" method="post" id="login-form" class="text-left">--%>
<%--&lt;%&ndash;<form id="login-form" class="text-left">&ndash;%&gt;--%>
<%--<c:if test="${param.error != null}">--%>
<%--<div class="alert alert-warning animated bounce text-center">--%>
<%--<i class="fa fa-warning" style="font-size: 15px;"></i> Invalid username and password.--%>
<%--</div>--%>
<%--</c:if>--%>

<%--<c:if test="${param.logout != null}">--%>
<%--<div class="alert alert-success animated bounce text-center">--%>
<%--<i class="fa fa-check-circle-o fa-fw" style="font-size: 17px;"></i> You have been logged out.--%>
<%--</div>--%>
<%--</c:if>--%>
<%--<div class="login-form-main-message text-center"></div>--%>
<%--<div class="main-login-form">--%>
<%--<div class="login-group">--%>
<%--<div class="form-group">--%>
<%--<label for="lg_username" class="sr-only">Username</label>--%>
<%--<input type="text" class="form-control" id="lg_username" name="username"--%>
<%--placeholder="username">--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label for="lg_password" class="sr-only">Password</label>--%>
<%--<input type="password" class="form-control" id="lg_password" name="password"--%>
<%--placeholder="password">--%>
<%--</div>--%>
<%--<div class="form-group login-group-checkbox">--%>
<%--<input type="checkbox" id="lg_remember" name="remember-me">--%>
<%--<label for="lg_remember">remember</label>--%>
<%--</div>--%>
<%--</div>--%>
<%--<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>--%>
<%--</div>--%>
<%--<div class="etc-login-form text-center">--%>
<%--<p>forgot your password? <a href="/forgot-password">click here</a></p>--%>
<%--&lt;%&ndash;<p>new user? <a href="/signup">create new account</a></p>&ndash;%&gt;--%>
<%--</div>--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>
<%--</form:form>--%>
<%--</div>--%>
<%--<!-- end:Main Form -->--%>
<%--</div>--%>

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

<div id="sign-in" class="centered">

    <div id="sign-in-panel" class="panel panel-primary animated bounceInDown">

        <div class="panel-heading">
            <h3 class="panel-title">Sign in</h3>
        </div>

        <div class="panel-body">

            <div class="row">

                <div class="col-md-4">
                    <div class="logo">
                        <a href="#" style="cursor: default; margin-left: 20%;">
                            <img alt="CDC" height="90px" src="/public/images/cdc-logo.png"
                                 style="margin-top: 8%; margin-bottom: 10%;">
                        </a>
                        <a href="#" style="cursor: default; margin-left: 10%">
                            <img alt="FHIR" width="200px" src="/public/images/fhir-logo.png">
                        </a>
                    </div>
                </div>

                <form:form role="form" method="post" id="sign-in-form">
                <div class="col-md-8"
                     style="border-left:2px solid #ccc;height:225px; padding-left: 20px; padding-right: 20px;padding-bottom: 25px">

                    <div class="form-group">
                        <label for="username">Email address</label>
                        <input id="username" name="username" type="email" class="form-control"
                               placeholder="Enter email"/>
                        <p class="help-block">Enter your email address.</p>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" class="form-control"
                               placeholder="Password"/>
                        <form:errors cssClass="error" path="password"/>
                    </div>

                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input name="remember-me" type="checkbox"> Remember me
                            </label>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 20px">
                        <button id="login-submit-btn" type="submit" class="btn btn-primary ladda-button" data-style="zoom-in"><span
                                class="ladda-label">Sign In</span>
                        </button>
                        <button id="forgot-password-btn" class="btn btn-warning ladda-button" data-style="zoom-in"><span class="ladda-label">Forgot Password</span></button>
                    </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>

<%@include file="includes/footer_simple.jsp" %>