<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<%--<script src="/public/lib/bootstrap-3.1.1/js/bootstrap.min.js"></script>--%>

<!-- jQuery -->
<script src="/public/bower_components/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/public/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<%-- Dropdown Effect JavaScript--%>
<script src="/public/js/dropdown-effects.js"></script>

<%-- Bootstrap Dialog --%>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/public/bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<%--<script src="/public/bower_components/raphael/raphael-min.js"></script>--%>
<script src="/public/bower_components/morrisjs/morris.min.js"></script>
<%--<script src="/public/js/morris-data.js"></script>--%>

<!-- Custom Theme JavaScript -->
<script src="/public/dist/js/sb-admin-2.js"></script>

<%-- Ladda Bootstrap JS --%>
<link rel="stylesheet" href="/public/ladda-bootstrap-master/dist/ladda-themeless.min.css">
<script src="/public/ladda-bootstrap-master/dist/spin.min.js"></script>
<script src="/public/ladda-bootstrap-master/dist/ladda.min.js"></script>


<link rel="stylesheet" href="/public/css/btn-breadcrumb-arrows.css">
<%--<link rel="stylesheet" href="/public/css/tutorial.css">--%>
<%--<link rel="stylesheet" href="/public/css/default.css">--%>

<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>

<script type="application/javascript">
    Ladda.bind('.ladda-button');

    $(function() {
//        if ($.browser.webkit) {
//            $('input[name="password"]').attr('autocomplete', 'off');
//            $('input[name="username"]').attr('autocomplete', 'off');
//        }
//       $('.alert').change(function() {
//           setTimeout(function() { $(this).alert('close') }, 2000);
//       })
        $("#sign-in-form").submit(function(e) {
            var form = this;
            e.preventDefault();

            setTimeout(function() {
                form.submit();
            }, 1000);
        });
        $("#login-submit-btn").click(function(e) {
            $('div.alert').addClass("bounceOutUp");
            setTimeout(function() {
                $('#sign-in-panel').addClass("bounceOutUp");
            }, 100);

        });

        $("#forgot-password-btn").click(function(e) {

            setTimeout(function() {
                window.location.href = "/forgot-password"
            }, 300);

        });

        $('i.deleteIcon').click(function() {
            var deleteIconItself = $(this);
            deleteIconItself.removeClass("fa-minus-circle");
            deleteIconItself.addClass("fa-spinner fa-pulse")
//            deleteIconItself.addClass("fa-spin")
            BootstrapDialog.show({
                title: '<i class="fa fa-exclamation-circle fa-fw"></i> Warning',
                cssClass: 'modify-modal',
                type: BootstrapDialog.TYPE_DANGER,
                message: 'A valueset cannot be restored once it has been deleted. Do you wish to continue?',
                closable: true,
                closeByBackdrop: false,
                closeByKeyboard: false,
                buttons: [{
                    label: 'Yes',
                    cssClass: 'btn-success',
                    action: function(dialogItself) {
                        deleteIconItself.closest('tr').hide(750);
                        dialogItself.close();
                    }
                }, {
                    label: 'No',
                    cssClass: 'btn-danger',
                    action: function(dialogItself) {
                        dialogItself.close();
                        deleteIconItself.removeClass("fa-spinner fa-pulse")
                        deleteIconItself.addClass("fa-minus-circle");
                    }
                }]
            });
        });

//        $('.sign-in-form-button').click(function (e) {
//            e.preventDefault();
//
//            $('#sign-in-form').removeClass("bounceInDown");
//            $('#sign-in-form').addClass("bounceInOut");
//            $('#sign-in-form').addClass("animate");
////            $('#sign-in-form').animate();
//
//        })
    });

    //    (function($) {
    //        "use strict";
    //
    //        // Options for Message
    //        //----------------------------------------------
    //        var options = {
    //            'btn-loading': '<i class="fa fa-spinner fa-pulse"></i>',
    //            'btn-success': '<i class="fa fa-check"></i>',
    //            'btn-error': '<i class="fa fa-remove"></i>',
    //            'msg-success': '<i class="fa fa-lock" style="color: goldenrod"></i> Login Sucessful: Redirecting <i class="fa fa-spinner fa-pulse" style="color: forestgreen"></i>',
    //            'msg-error': 'Incorrect login credentials!',
    //            'useAJAX': true,
    //        };
    //
    //        // Login Form
    //        //----------------------------------------------
    //        // Validation
    //        $("#login-form").validate({
    //            rules: {
    //                username: "required",
    //                password: "required",
    //            },
    //            errorClass: "form-invalid"
    //        });
    //
    //        // Form Submission
    //        $("#login-form").submit(function(e) {
    //            var thisForm = $(this);
    //            var username = $('input[name=username]').val();
    //            var password = $('input[name=password]').val();
    //            var rememberme = $('input[type=checkbox][name=rememberme]').prop("checked");
    //            remove_loading($(this));
    //
    //            e.preventDefault();
    //
    //            if(options['useAJAX'] == true)
    //            {
    //
    ////                var form = this;
    //
    ////                setTimeout(function () {
    ////                    form.submit();
    ////                }, 4000);
    //
    //                $.ajax({
    //                    type: 'POST',
    //                    url: '/login',
    //                    cache: false,
    //                    data: {
    //                        username: username,
    //                        password: password,
    //                        rememberme: rememberme
    //                    },
    //                    success: function (response) {
    //                        form_loading(thisForm);
    //
    //                        setTimeout(function() {
    //                            form_failed(thisForm);
    //                        }, 2000);
    //
    ////                        window.location.href = "/"
    //                    }, fail: function (response) {
    //                        setTimeout(function() {
    //                            form_failed(thisForm);
    //                        }, 2000);
    //                    }
    //                });
    //                // in milliseconds
    //                // Dummy AJAX request (Replace this with your AJAX code)
    //                // If you don't want to use AJAX, remove this
    ////                dummy_submit_form($(this));
    //
    //                // Cancel the normal submission.
    //                // If you don't want to use AJAX, remove this
    //                return false;
    //            }
    //
    //        });
    //
    //        // Register Form
    //        //----------------------------------------------
    //        // Validation
    //        $("#register-form").validate({
    //            rules: {
    //                reg_username: "required",
    //                reg_password: {
    //                    required: true,
    //                    minlength: 5
    //                },
    //                reg_password_confirm: {
    //                    required: true,
    //                    minlength: 5,
    //                    equalTo: "#register-form [name=reg_password]"
    //                },
    //                reg_email: {
    //                    required: true,
    //                    email: true
    //                },
    //                reg_agree: "required",
    //            },
    //            errorClass: "form-invalid",
    //            errorPlacement: function( label, element ) {
    //                if( element.attr( "type" ) === "checkbox" || element.attr( "type" ) === "radio" ) {
    //                    element.parent().append( label ); // this would append the label after all your checkboxes/labels (so the error-label will be the last element in <div class="controls"> )
    //                }
    //                else {
    //                    label.insertAfter( element ); // standard behaviour
    //                }
    //            }
    //        });
    //
    //        // Form Submission
    //        $("#register-form").submit(function() {
    //            remove_loading($(this));
    //
    //            if(options['useAJAX'] == true)
    //            {
    //                // Dummy AJAX request (Replace this with your AJAX code)
    //                // If you don't want to use AJAX, remove this
    //                dummy_submit_form($(this));
    //
    //                // Cancel the normal submission.
    //                // If you don't want to use AJAX, remove this
    ////                return false;
    //            }
    //        });
    //
    //        // Forgot Password Form
    //        //----------------------------------------------
    //        // Validation
    //        $("#forgot-password-form").validate({
    //            rules: {
    //                fp_email: "required",
    //            },
    //            errorClass: "form-invalid"
    //        });
    //
    //        // Form Submission
    //        $("#forgot-password-form").submit(function() {
    //            remove_loading($(this));
    //
    //            if(options['useAJAX'] == true)
    //            {
    //                // Dummy AJAX request (Replace this with your AJAX code)
    //                // If you don't want to use AJAX, remove this
    //                dummy_submit_form($(this));
    //
    //                // Cancel the normal submission.
    //                // If you don't want to use AJAX, remove this
    //                return false;
    //            }
    //        });
    //
    //        // Loading
    //        //----------------------------------------------
    //        function remove_loading($form)
    //        {
    //            $form.find('[type=submit]').removeClass('error success');
    //            $form.find('.login-form-main-message').removeClass('show error success').html('');
    //        }
    //
    //        function form_loading($form)
    //        {
    //            $form.find('[type=submit]').addClass('clicked').html(options['btn-loading']);
    //        }
    //
    //        function form_success($form)
    //        {
    //            $form.find('[type=submit]').addClass('success').html(options['btn-success']);
    //            $form.find('.login-form-main-message').addClass('show success').html(options['msg-success']);
    //        }
    //
    //        function form_failed($form)
    //        {
    //            $form.find('[type=submit]').addClass('error').html(options['btn-error']);
    //            $form.find('.login-form-main-message').addClass('show error').html(options['msg-error']);
    //        }
    //
    //        // Dummy Submit Form (Remove this)
    //        //----------------------------------------------
    //        // This is just a dummy form submission. You should use your AJAX function or remove this function if you are not using AJAX.
    //        function dummy_submit_form($form)
    //        {
    //            if($form.valid())
    //            {
    //                form_loading($form);
    //
    //                setTimeout(function() {
    //                    form_success($form);
    //                }, 2000);
    //            }
    //        }
    //
    //    })(jQuery);


</script>

<style>
    /* navbar */
    .navbar-gg {
        background-color: #e2e2e2;
        border-color: #E7E7E7;
        z-index: 10000;
    }

    .navbar-gg, .thead-gg {
        background-image: -webkit-linear-gradient(top, #c6c6c6 0%, #ededed 100%);
        background-image: -o-linear-gradient(top, #c6c6c6 0%, #ededed 100%);
        background-image: linear-gradient(to bottom, #c6c6c6 0%, #ededed 100%);
        background-repeat: repeat-x;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff004400', endColorstr='#ff009900', GradientType=0);
    }

    td.td-gg {
        background-color: #e9e9e9;
    }

    .navbar-gg {
        -webkit-box-shadow: 0 8px 6px -6px #999;
        -moz-box-shadow: 0 8px 6px -6px #999;
        box-shadow: 0 8px 6px -6px #999;

        /* the rest of your styling */
    }

    td.url-data {
        max-width: 500px;
        word-break: break-all;
    }

    /* removes light grey shadow below breadcrumb. it isn't really noticeable but it is bothersome*/
    .breadcrumb-panel {
        border-bottom: none;
        box-shadow: none;
    }

    /*.thead-gg th{*/
    /*!*word-break:break-all;*!*/
    /*}*/

    /*#valueset-view-table td{*/
    /*!*word-break:break-all*!*/
    /*text-wrap: normal;*/
    /*}*/

    .sidebar {
        margin-top: 6px;
    }

    .dropdown-menu {
        background-color: #fcfcfc;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        /*margin-top: 1px;*/
        min-width: 150px;
        -webkit-box-shadow: 0 8px 6px -6px #999;
        -moz-box-shadow: 0 8px 6px -6px #999;
        box-shadow: 0 8px 6px -6px #999;
    }

    .nav .open > a, .nav .open > a:hover, .nav .open > a:focus {
        color: #fff;
        background-color: #428BCA;
        border-color: #285e8e;
    }

    .table-radius-separate {
        border-collapse: separate;
        border: solid lightgrey 1px;
        border-radius: 4px;
        -moz-border-radius: 4px;
    }

    .table-collapse {
        border-collapse: collapse;
    }

    table.table-radius-separate th {
        border-bottom-color: darkgrey !important;
    }

    table.table-double-col-no-header tr :first-child {
        border-right-width: 2px;
        border-right-color: darkgrey !important;
    }

    a.bc-active {
        color: #FFF;
        background-color: #b6b6b6;
        border-color: #9a9a9a;
    }

    /*.panel {*/
    /*overflow: auto;*/
    /*}*/
    .table > tbody > tr > td {
        vertical-align: middle;
    }

    i.deleteIcon {
        color: #d80000;
        font-size: 17px;
        cursor: pointer;
    }

    .modify-modal {
        z-index: 1000000 !important;
        /*display: flex !important;*/
        top: 30% !important;
    }

    .modal-backdrop {
        z-index: 100000 !important;
    }

    input:-webkit-autofill {
        background-color: white !important;
        color: white !important;
        -webkit-box-shadow: 0 0 0px 1000px #ffffff inset !important;

    }

    #sign-in-panel, #sign-up-panel {
        /*margin-top: 10%;*/
        /*margin-left: 30%;*/
        width: 700px;
        height: 310px;
        -webkit-box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
        -moz-box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
        box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
    }

    #sign-up-panel {
        height: 325px;
    }

    div#sign-in, div#sign-up, div#error-div {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    #forgot-password-panel {
        /*margin-top: 10%;*/
        /*margin-left: 30%;*/
        width: 500px;
        height: 235px;
        -webkit-box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
        -moz-box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
        box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
    }

    div#forgot-password {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    div.centered-alert {
        width: 700px;
        position: fixed;
        top: 28%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .alert {
        -webkit-box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
        -moz-box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
        box-shadow: 5px 4px 5px 0px rgba(137, 137, 143, 0.55);
    }

    html,
    body {
        background: #efefef;
        padding: 10px;
        font-family: 'Varela Round';
    }

    input[type=checkbox] {
        /* All browsers except webkit*/
        transform: scale(1.2);

        /* Webkit browsers*/
        -webkit-transform: scale(1.2);
        content: '\2714';
    }

</style>

<%--<style>--%>
<%--/*--------------------------------------------------------------------%>
<%--[Master Stylesheet]--%>

<%--Project    	: Aether--%>
<%--Version		: 1.0--%>
<%--Last change	: 2015/03/27--%>
<%---------------------------------------------------------------------*/--%>
<%--/*--------------------------------------------------------------------%>
<%--[Table of contents]--%>

<%--1. General Structure--%>
<%--2. Anchor Link--%>
<%--3. Text Outside the Box--%>
<%--4. Main Form--%>
<%--5. Login Button--%>
<%--6. Form Invalid--%>
<%--7. Form - Main Message--%>
<%--8. Custom Checkbox & Radio--%>
<%--9. Misc--%>
<%---------------------------------------------------------------------*/--%>
<%--/*=== 1. General Structure ===*/--%>
<%--html,--%>
<%--body {--%>
<%--background: #efefef;--%>
<%--padding: 10px;--%>
<%--font-family: 'Varela Round';--%>
<%--}--%>
<%--/*=== 2. Anchor Link ===*/--%>
<%--a {--%>
<%--color: #aaaaaa;--%>
<%--transition: all ease-in-out 200ms;--%>
<%--}--%>
<%--a:hover {--%>
<%--color: #333333;--%>
<%--text-decoration: none;--%>
<%--}--%>
<%--/*=== 3. Text Outside the Box ===*/--%>
<%--.etc-login-form {--%>
<%--color: #919191;--%>
<%--padding: 10px 20px;--%>
<%--}--%>
<%--.etc-login-form p {--%>
<%--margin-bottom: 5px;--%>
<%--}--%>
<%--/*=== 4. Main Form ===*/--%>
<%--.login-form-1 {--%>
<%--/*max-width: 300px;*/--%>
<%--width: 600px;--%>
<%--border-radius: 5px;--%>
<%--display: inline-block;--%>

<%--}--%>
<%--.main-login-form {--%>
<%--position: relative;--%>
<%--}--%>
<%--.login-form-1 .form-control {--%>
<%--border: 0;--%>
<%--box-shadow: 0 0 0;--%>
<%--border-radius: 0;--%>
<%--background: transparent;--%>
<%--color: #555555;--%>
<%--padding: 7px 0;--%>
<%--font-weight: bold;--%>
<%--height:auto;--%>
<%--}--%>
<%--.login-form-1 .form-control::-webkit-input-placeholder {--%>
<%--color: #999999;--%>
<%--}--%>
<%--.login-form-1 .form-control:-moz-placeholder,--%>
<%--.login-form-1 .form-control::-moz-placeholder,--%>
<%--.login-form-1 .form-control:-ms-input-placeholder {--%>
<%--color: #999999;--%>
<%--}--%>
<%--.login-form-1 .form-group {--%>
<%--margin-top: 20px;--%>
<%--margin-bottom: 20px;--%>
<%--border-bottom: 2px solid #efefef;--%>
<%--padding-right: 20px;--%>
<%--position: relative;--%>
<%--}--%>
<%--.login-form-1 .form-group:last-child {--%>
<%--border-bottom: 0;--%>
<%--margin-bottom: 0;--%>
<%--margin-top: 0;--%>
<%--}--%>
<%--.login-group {--%>
<%--background: #ffffff;--%>
<%--color: #999999;--%>
<%--border-radius: 8px;--%>
<%--padding: 10px 20px;--%>
<%---webkit-box-shadow: 0 8px 6px -6px #999;--%>
<%---moz-box-shadow: 0 8px 6px -6px #999;--%>
<%--box-shadow: 0 8px 6px -6px #999;--%>
<%--}--%>
<%--.login-group-checkbox {--%>
<%--padding: 5px 0;--%>
<%--}--%>
<%--/*=== 5. Login Button ===*/--%>
<%--.login-form-1 .login-button {--%>
<%--position: absolute;--%>
<%--right: -25px;--%>
<%--top: 50%;--%>
<%--background: #ffffff;--%>
<%--color: #999999;--%>
<%--padding: 11px 0;--%>
<%--width: 75px;--%>
<%--height: 75px;--%>
<%--margin-top: -40px;--%>
<%--border: 5px solid #efefef;--%>
<%--border-radius: 50%;--%>
<%--transition: all ease-in-out 500ms;--%>
<%--/*-webkit-box-shadow: 0px 4px 5px 0px #999;*/--%>
<%--/*-moz-box-shadow: 0px 4px 5px 0px #999;*/--%>
<%--/*box-shadow: 0px 4px 5px 0px #999;*/--%>
<%--}--%>
<%--.login-form-1 .login-button:hover {--%>
<%--color: #555555;--%>
<%--transform: rotate(450deg);--%>
<%--}--%>
<%--.login-form-1 .login-button.clicked {--%>
<%--color: #555555;--%>
<%--}--%>
<%--.login-form-1 .login-button.clicked:hover {--%>
<%--transform: none;--%>
<%--}--%>
<%--.login-form-1 .login-button.clicked.success {--%>
<%--color: #2ecc71;--%>
<%--}--%>
<%--.login-form-1 .login-button.clicked.error {--%>
<%--color: #e74c3c;--%>
<%--}--%>
<%--/*=== 6. Form Invalid ===*/--%>
<%--label.form-invalid {--%>
<%--position: absolute;--%>
<%--top: 0;--%>
<%--right: 0;--%>
<%--z-index: 5;--%>
<%--display: block;--%>
<%--margin-top: -25px;--%>
<%--padding: 7px 9px;--%>
<%--background: #777777;--%>
<%--color: #ffffff;--%>
<%--border-radius: 5px;--%>
<%--font-weight: bold;--%>
<%--font-size: 11px;--%>
<%--}--%>
<%--label.form-invalid:after {--%>
<%--top: 100%;--%>
<%--right: 10px;--%>
<%--border: solid transparent;--%>
<%--content: " ";--%>
<%--height: 0;--%>
<%--width: 0;--%>
<%--position: absolute;--%>
<%--pointer-events: none;--%>
<%--border-color: transparent;--%>
<%--border-top-color: #777777;--%>
<%--border-width: 6px;--%>
<%--}--%>
<%--/*=== 7. Form - Main Message ===*/--%>
<%--.login-form-main-message {--%>
<%--background: #ffffff;--%>
<%--color: #999999;--%>
<%--border-left: 3px solid transparent;--%>
<%--border-radius: 3px;--%>
<%--margin-bottom: 8px;--%>
<%--font-weight: bold;--%>
<%--height: 0;--%>
<%--padding: 0 20px 0 17px;--%>
<%--opacity: 0;--%>
<%--transition: all ease-in-out 200ms;--%>
<%--}--%>
<%--.login-form-main-message.show {--%>
<%--height: auto;--%>
<%--opacity: 1;--%>
<%--padding: 10px 20px 10px 17px;--%>
<%--}--%>
<%--.login-form-main-message.success {--%>
<%--border-left-color: #2ecc71;--%>
<%--}--%>
<%--.login-form-main-message.error {--%>
<%--border-left-color: #e74c3c;--%>
<%--}--%>
<%--/*=== 8. Custom Checkbox & Radio ===*/--%>
<%--/* Base for label styling */--%>
<%--[type="checkbox"]:not(:checked),--%>
<%--[type="checkbox"]:checked,--%>
<%--[type="radio"]:not(:checked),--%>
<%--[type="radio"]:checked {--%>
<%--position: absolute;--%>
<%--left: -9999px;--%>
<%--}--%>
<%--[type="checkbox"]:not(:checked) + label,--%>
<%--[type="checkbox"]:checked + label,--%>
<%--[type="radio"]:not(:checked) + label,--%>
<%--[type="radio"]:checked + label {--%>
<%--position: relative;--%>
<%--padding-left: 25px;--%>
<%--padding-top: 1px;--%>
<%--cursor: pointer;--%>
<%--}--%>
<%--/* checkbox aspect */--%>
<%--[type="checkbox"]:not(:checked) + label:before,--%>
<%--[type="checkbox"]:checked + label:before,--%>
<%--[type="radio"]:not(:checked) + label:before,--%>
<%--[type="radio"]:checked + label:before {--%>
<%--content: '';--%>
<%--position: absolute;--%>
<%--left: 0;--%>
<%--top: 2px;--%>
<%--width: 17px;--%>
<%--height: 17px;--%>
<%--border: 0px solid #aaa;--%>
<%--background: #f0f0f0;--%>
<%--border-radius: 3px;--%>
<%--box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3);--%>
<%--}--%>
<%--/* checked mark aspect */--%>
<%--[type="checkbox"]:not(:checked) + label:after,--%>
<%--[type="checkbox"]:checked + label:after,--%>
<%--[type="radio"]:not(:checked) + label:after,--%>
<%--[type="radio"]:checked + label:after {--%>
<%--position: absolute;--%>
<%--color: #555555;--%>
<%--transition: all .2s;--%>
<%--}--%>
<%--/* checked mark aspect changes */--%>
<%--[type="checkbox"]:not(:checked) + label:after,--%>
<%--[type="radio"]:not(:checked) + label:after {--%>
<%--opacity: 0;--%>
<%--transform: scale(0);--%>
<%--}--%>
<%--[type="checkbox"]:checked + label:after,--%>
<%--[type="radio"]:checked + label:after {--%>
<%--opacity: 1;--%>
<%--transform: scale(1);--%>
<%--}--%>
<%--/* disabled checkbox */--%>
<%--[type="checkbox"]:disabled:not(:checked) + label:before,--%>
<%--[type="checkbox"]:disabled:checked + label:before,--%>
<%--[type="radio"]:disabled:not(:checked) + label:before,--%>
<%--[type="radio"]:disabled:checked + label:before {--%>
<%--box-shadow: none;--%>
<%--border-color: #8c8c8c;--%>
<%--background-color: #878787;--%>
<%--}--%>
<%--[type="checkbox"]:disabled:checked + label:after,--%>
<%--[type="radio"]:disabled:checked + label:after {--%>
<%--color: #555555;--%>
<%--}--%>
<%--[type="checkbox"]:disabled + label,--%>
<%--[type="radio"]:disabled + label {--%>
<%--color: #8c8c8c;--%>
<%--}--%>
<%--/* accessibility */--%>
<%--[type="checkbox"]:checked:focus + label:before,--%>
<%--[type="checkbox"]:not(:checked):focus + label:before,--%>
<%--[type="checkbox"]:checked:focus + label:before,--%>
<%--[type="checkbox"]:not(:checked):focus + label:before {--%>
<%--border: 1px dotted #f6f6f6;--%>
<%--}--%>
<%--/* hover style just for information */--%>
<%--label:hover:before {--%>
<%--border: 1px solid #f6f6f6 !important;--%>
<%--}--%>
<%--/*=== Customization ===*/--%>
<%--/* radio aspect */--%>
<%--[type="checkbox"]:not(:checked) + label:before,--%>
<%--[type="checkbox"]:checked + label:before {--%>
<%--border-radius: 3px;--%>
<%--}--%>
<%--[type="radio"]:not(:checked) + label:before,--%>
<%--[type="radio"]:checked + label:before {--%>
<%--border-radius: 35px;--%>
<%--}--%>
<%--/* selected mark aspect */--%>
<%--[type="checkbox"]:not(:checked) + label:after,--%>
<%--[type="checkbox"]:checked + label:after {--%>
<%--content: '\2714';--%>
<%--top: 0;--%>
<%--left: 2px;--%>
<%--font-size: 14px;--%>
<%--}--%>
<%--[type="radio"]:not(:checked) + label:after,--%>
<%--[type="radio"]:checked + label:after {--%>
<%--content: '\2022';--%>
<%--top: 0;--%>
<%--left: 3px;--%>
<%--font-size: 30px;--%>
<%--line-height: 25px;--%>
<%--}--%>
<%--/*=== 9. Misc ===*/--%>
<%--.logo {--%>
<%--padding: 15px 0;--%>
<%--font-size: 25px;--%>
<%--color: #aaaaaa;--%>
<%--font-weight: bold;--%>
<%--}--%>

<%--</style>--%>
</body>
</html>
