<%@include file="includes/header_simple.jsp" %>

<div id="error-div" class="centered">

    <div class="alert alert-danger animated shake">
        <p>There was an unexpected error (type=${error}, status=${status}): <i>${message}</i></p>
        <p>Click <a href="/">here</a> to go to home page</p>
    </div>

</div>
<%@include file="includes/footer_simple.jsp" %>