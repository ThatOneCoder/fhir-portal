<%@include file="includes/header.jsp" %>

<div class="panel breadcrumb-panel">
    <div class="row">
        <div class="btn-group btn-breadcrumb">
            <a href="/" class="btn btn-default"><i class="fa fa-home fa-lg"></i></a>
            <a href="/resource/valueset/view" class="btn btn-default">ValueSets</a>
        </div>
    </div>
</div>



<div class="panel panel-primary">
    <div class="panel-heading">
        <i class="fa fa-server fa-fw"></i> Server Information<a class="btn btn-success btn-sm" href="#"
                                                       style="margin-left: 10px;"
                                                       title="The FHIR Server is active and available for use."> Status -
        Active <i class="fa fa-check-circle-o fa-fw" style="color: white;"></i></a>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-radius-separate table-double-col-no-header">
            <colgroup>
                <col class="col-xs-1">
                <col class="col-xs-7">
            </colgroup>
            <tbody>
            <tr>
                <td class="td-gg">Server</td>
                <td>CDC FHIR Test Server</td>
            </tr>
            <tr>
                <td class="td-gg">Software</td>
                <td>
                    HAPI FHIR Server - 1.3
                </td>
            </tr>
            <tr>
                <td class="td-gg">FHIR Base</td>
                <td>
                    <a href="${fhirServerBase}" target="_blank">${fhirServerBase}</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="panel panel-warning">
    <div class="panel-heading">
        <i class="fa fa-exclamation-triangle fa-fw"></i> Notice
    </div>
    <div class="panel-body">
        <h4>
            <b>Assurance of Confidentiality:</b>
        </h4>
        <p>The voluntarily provided information obtained in this information system that would permit identification of
            any individual or institution is collected with a guarantee that it will be held in strict confidence, will
            be used only for the purposes stated, and will not otherwise be disclosed or released without the consent of
            the individual, or the institution in accordance with Sections 304, 306 and 308(d) of the Public Health
            Service Act (42 USC 242b, 242k, and 242m(d)).
        </p>
        </br>
        <h4>
            <b>Intrusion Detection and Security</b>
        </h4>
        <p>This site is maintained by the U.S. Government and is protected by various provisions of Title 18 of the U.S.
            Code. Violations of Title 18 are subject to criminal prosecution in Federal court. For site security
            purposes and to ensure that this service remains available to all users, CDC employs software programs to
            identify unauthorized attempts to upload or change information, or otherwise cause damage. Unauthorized
            attempts to upload or change information on this Website are strictly prohibited and may be punishable by
            law, including the Computer Fraud and Abuse Act of 1986 and the National Information Infrastructure
            Protection Act of 1996.
        </p>
    </div>
</div>
<div class="panel panel-danger">
    <div class="panel-heading">
        <i class="fa fa-exclamation-circle fa-fw"></i> Warning
    </div>
    <div class="panel-body">
        <p>You are accessing a US Government information system, which includes (1) this computer, (2) this computer
            network, (3) all computers connected to this network, and (4) all devices and storage media attached to this
            network or to a computer on this network. This information system is provided for US Government-authorized
            use only. Unauthorized or improper use of this system may result in disciplinary action, as well as civil
            and criminal penalties. By using this information system, you understand and consent to the following: You
            have no reasonable expectation of privacy regarding any communication or data transiting or stored on this
            information system. At any time, and for any lawful government purpose, the government may monitor,
            intercept, and search and seize any communication or data transiting or stored on this information system.
            Any communication or data transiting or stored on this information system may be disclosed or used for any
            lawful Government purpose.
        </p>
    </div>
</div>
<%@include file="includes/footer.jsp" %>