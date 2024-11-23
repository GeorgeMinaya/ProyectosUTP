<%-- 
    Document   : atencion_consultorio
    Created on : 21 nov. 2024, 01:58:07
    Author     : George
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="source_css.jsp" %>

    </head>
    <body>
        <div class="container min-vh-100 d-flex flex-column justify-content-center">
            <div class="d-flex justify-content-center">
                <form id="frm-atencion-pendiente" action="atencion_pendiente.jsp?do=X" method="POST" accept-charset="UTF-8" class="w-100">
                    <div class="shadow-blue border-bottom border-end border-4 border-secondary p-4">
                        <div class="row justify-content-between">                                                        
                            <p class="h4 text-secondary fw-bolder mb-4"><span class="mdi mdi-medical-bag"></span> Consultorio C103 </p>                            
                            <div class="col shadow border-4 border-start border-info rounded-1 p-2 mx-2">
                                <p class="text-center text-secondary fw-bolder fs-5">Historial</p>
                                <md-list>
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text"><span class="mdi mdi-calendar"></span> x</div>                                        
                                    </md-list-item >
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text"><span class="mdi mdi-calendar"></span> x</div>                                        
                                    </md-list-item >
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text"><span class="mdi mdi-calendar"></span> x</div>                                        
                                    </md-list-item >
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text"><span class="mdi mdi-calendar"></span> x</div>                                        
                                    </md-list-item >
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text"><span class="mdi mdi-calendar"></span> x</div>                                        
                                    </md-list-item >
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text"><span class="mdi mdi-calendar"></span> x</div>                                        
                                    </md-list-item >
                                </md-list>
                            </div>
                            <div class="col-4 d-flex flex-column justify-content-between">
                                <div class="shadow-sm border-4 border-start border-secondary rounded-1">
                                    <md-list-item >
                                        <md-icon slot="end"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text">CMP001</div>
                                    </md-list-item >                                   
                                </div>
                                <img src="img/undraw_doctor_kw-5-l.svg" alt="" class="img-fluid w-75 my-4" />
                                <div class="shadow-sm border-4 border-start border-secondary rounded-1">
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-account-injury-outline"></span></md-icon>
                                            <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">PACIENTE</div>
                                        <div slot="trailing-supporting-text"></div>
                                    </md-list-item >
                                </div>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="d-flex justify-content-between">
                                <md-fab variant="tertiary" class="" aria-label="Cancelar" label="">
                                    <md-icon slot="icon"><span class="mdi mdi-cancel"></span></md-icon>
                                </md-fab>
                                <md-fab class="" aria-label="Iniciar atención" label="Iniciar atención">
                                    <md-icon slot="icon"><span class="mdi mdi-content-save"></span></md-icon>
                                </md-fab>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
