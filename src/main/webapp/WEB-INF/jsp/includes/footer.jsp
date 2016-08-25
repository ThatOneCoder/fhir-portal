<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="ca.uhn.fhir.model.dstu2.resource.ValueSet" %>
</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<nav class="navbar navbar-gg navbar-fixed-bottom">
    <div class="container-fluid">
        <div class="center-block">
            <div class="row">
                <div class="text-center" style="margin-top:17px; font-size: 10px;">
                    <span style="margin-right: 5px;">U.S. Department of Health & Human Services</span>
                    <span style="margin-right: 5px;">|</span>
                    <span style="margin-right: 5px;">Centers for Disease Control and Prevention (CDC)</span>
                    <span style="margin-right: 5px;">|</span>
                    <span>National Healthcare Safety Network (NHSN)</span>
                </div>
            </div>
        </div>
        <%--<a class="logo" href="#">--%>
        <%--<img alt="FHIR" width="100px" src="/public/images/fhir-logo.png">--%>
        <%--</a>--%>
    </div>
    </div>
</nav>

<%-- Page Wrapper--%>

<%--</div>--%>

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

<script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
<%--<script src="https://cdn.datatables.net/1.10.11/js/dataTables.jqueryui.min.js"></script>--%>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css">
<%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">--%>
<%--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.jqueryui.min.css">--%>
<%--<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css">--%>

<script type="application/javascript">
    Ladda.bind('.ladda-button');

    $(function() {
//       $('.alert').change(function() {
//           setTimeout(function() { $(this).alert('close') }, 2000);
//       })
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
                closable: false,
                closeByBackdrop: false,
                closeByKeyboard: false,
                buttons: [{
                    label: 'Yes',
                    cssClass: 'btn-success',
                    action: function(dialogItself) {
                        deleteIconItself.closest('tr').addClass("animated fadeOutUp").hide(600);
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


        $('.table-pagination').DataTable(
            {
                "lengthMenu": [10, 15, 20, 50, 75, 100]
            }
        );

        $('input#vsCodeDisplay').keyup(function() {
//            console.log("vs code CHANGED!");
            var vsCode = $(this).val();
//            console.log("vsCode: " + vsCode);
            var urlInput = $('input#url');
            var urlInputVal = urlInput.val();
            var urlSlashIndex = urlInputVal.lastIndexOf("/");
//            var vsCode = urlInputVal.substring(urlSlashIndex+1);
            urlInput.val(urlInputVal.substring(0, urlSlashIndex) + "/" + vsCode)

        });

        $('input#url').keyup(function() {
//            console.log("url CHANGED!");
            var vsCode = $('input#vsCodeDisplay');
//            console.log("vsCode: " + vsCode);
            var urlInput = $('input#url');
            var urlInputVal = urlInput.val();
            var urlSlashIndex = urlInputVal.lastIndexOf("/");
            var vsCodeVal = urlInputVal.substring(urlSlashIndex+1);
            vsCode.val(vsCodeVal);

        });

    }); // page load end


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
    /*.table > tbody > tr > td {*/
    /*vertical-align: middle;*/
    /*}*/

    i.deleteIcon {
        color: #d80000;
        font-size: 17px;
        cursor: pointer;
    }

    .modify-modal {
        z-index: 1000000 !important;
        /*display: flex !important;*/
        top: 30% !important;
        overflow-y: hidden;
    }

    .modal-backdrop {
        z-index: 100000 !important;
    }

    /*table.dataTable thead .sorting:after {*/
    /*visibility: hidden;;*/
    /*}*/

    table.dataTable thead th {
        position: relative;
        background-image: none !important;
    }

    table.dataTable thead th.sorting:after,
    table.dataTable thead th.sorting_asc:after,
    table.dataTable thead th.sorting_desc:after {
        position: absolute;
        top: 12px;
        right: 8px;
        display: block;
        font-family: FontAwesome;
    }

    table.dataTable thead th.sorting:after {
        content: "\f0dc";
        color: #ddd;
        font-size: 0.8em;
        padding-top: 0.12em;
    }

    table.dataTable thead th.sorting_asc:after {
        content: "\f0de";
    }

    table.dataTable thead th.sorting_desc:after {
        content: "\f0dd";
    }

    /*a.btn.btn-default::before :hover{*/
    /*background-color: #ccc !important;*/
    /*}*/

</style>
</body>
</html>
