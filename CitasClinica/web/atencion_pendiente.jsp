<%-- 
    Document   : atencion_pendiente
    Created on : 20 nov. 2024, 23:43:26
    Author     : George
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");
    Calendar c = Calendar.getInstance();
    c.setTime(new Date());
    c.add(Calendar.DATE, 1);

%>
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
                <form id="frm-atencion-pendiente" action="atencion_pendiente.jsp?do=X" method="POST" accept-charset="UTF-8" class="w-75">
                    <div class="shadow-blue border-bottom border-end border-4 border-secondary p-4">
                        <div class="row justify-content-between">
                            <p class="h4 text-secondary fw-bolder"><span class="mdi mdi-calendar-clock"></span> Lista de citas pendientes </p>

                            <div class="col-5 align-self-start">
                                <img src="img/undraw_medical_research_qg4d.svg" alt="" class="img-fluid mt-3" />
                            </div>                            
                            <div class="col-7 mt-4">
                                <div class="shadow-sm border-4 border-start border-secondary mb-3">
                                    <md-list-item >
                                        <md-icon slot="start"><span class="mdi mdi-doctor"></span></md-icon>
                                        <div slot="headline">JOSE LUIS RODRIGUEZ</div>
                                        <div slot="supporting-text">CARDIOLOGÍA</div>
                                        <div slot="trailing-supporting-text"><span class="mdi mdi-calendar"></span> <%=formato_fecha.format(c.getTime())%></div>                                        
                                    </md-list-item >
                                </div>
                                <md-list class="ms-4">
                                    <md-list-item type="link" href="atencion_pendiente.jsp?do=x">
                                        <md-icon slot="start"><span class="mdi mdi-clipboard-text-clock-outline"></span></md-icon>
                                        <div slot="headline"><span class="mdi mdi-clock-outline"></span> 09:30 - 10:00</div>
                                        <div slot="supporting-text">GEORGE MINAYA ASENCIOS GEORGE MINAYA</div>
                                        <div slot="supporting-text"><span class="mdi mdi-office-building-marker-outline"></span> Piso: 1 <span class="mdi mdi-map-marker-outline"></span> Consultorio: C003 </div>
                                    </md-list-item>                         
                                    <md-list-item type="link" href="atencion_pendiente.jsp?do=x">
                                        <md-icon slot="start"><span class="mdi mdi-clipboard-text-clock-outline"></span></md-icon>
                                        <div slot="headline"><span class="mdi mdi-clock-outline"></span> 09:30 - 10:00</div>
                                        <div slot="supporting-text">GEORGE MINAYA ASENCIOS GEORGE MINAYA</div>
                                        <div slot="supporting-text"><span class="mdi mdi-office-building-marker-outline"></span> Piso: 1 <span class="mdi mdi-map-marker-outline"></span> Consultorio: C003 </div>
                                    </md-list-item>                            
                                    <md-list-item type="link" href="atencion_pendiente.jsp?do=x">
                                        <md-icon slot="start"><span class="mdi mdi-clipboard-text-clock-outline"></span></md-icon>
                                        <div slot="headline"><span class="mdi mdi-clock-outline"></span> 09:30 - 10:00</div>
                                        <div slot="supporting-text">GEORGE MINAYA ASENCIOS GEORGE MINAYA</div>
                                        <div slot="supporting-text"><span class="mdi mdi-office-building-marker-outline"></span> Piso: 1 <span class="mdi mdi-map-marker-outline"></span> Consultorio: C003 </div>
                                    </md-list-item>                             
                                    <md-list-item type="link" href="atencion_pendiente.jsp?do=x">
                                        <md-icon slot="start"><span class="mdi mdi-clipboard-text-clock-outline"></span></md-icon>
                                        <div slot="headline"><span class="mdi mdi-clock-outline"></span> 09:30 - 10:00</div>
                                        <div slot="supporting-text">GEORGE MINAYA ASENCIOS GEORGE MINAYA</div>
                                        <div slot="supporting-text"><span class="mdi mdi-office-building-marker-outline"></span> Piso: 1 <span class="mdi mdi-map-marker-outline"></span> Consultorio: C003 </div>
                                    </md-list-item>
                                </md-list>
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
