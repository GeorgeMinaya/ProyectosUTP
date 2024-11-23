<%-- 
    Document   : registro_usuario
    Created on : 25 oct. 2024, 9:23:20 p. m.
    Author     : gaminaya
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DateFormat formato_fecha = new SimpleDateFormat("yyyy-MM-dd");
    Calendar c = Calendar.getInstance();
    c.setTime(new Date());
    c.add(Calendar.YEAR, -20);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="source_css.jsp" %>
    </head>
    <body class="p-5">
        <div class="container shadow-blue border-bottom border-end border-4 border-secondary mt-5 p-4">
            <form id="frm-datos-medico" action="medicos.jsp?do=X" method="POST" accept-charset="UTF-8">
                <div class="row">
                    <div class="col-8">
                        <p class="h4 text-secondary fw-bolder"><span class="mdi mdi-account-details"></span> Información personal del nuevo usuario</p>
                        <div class="row row-cols-2 mt-4 mb-5 ms-4">
                            <div class="col ">
                                <md-outlined-text-field class="w-100 mb-4" id="txt-busqueda" label="Ingrese sus apellidos" value="" >
                                    <md-icon slot="leading-icon"><span class="mdi mdi-account-multiple"></span></md-icon>
                                </md-outlined-text-field>
                                <md-outlined-text-field class="w-100" id="txt-busqueda" label="Ingrese sus nombres" value="" >
                                    <md-icon slot="leading-icon"><span class="mdi mdi-account"></span></md-icon>
                                </md-outlined-text-field>
                            </div>
                            <div class="col">
                                <md-outlined-text-field class="mb-4" id="txt-busqueda" label="DNI" value="" >
                                    <md-icon slot="leading-icon"><span class="mdi mdi-card-account-details"></span></md-icon>
                                </md-outlined-text-field>
                                <div class="d-flex flex-column w-50">
                                    <md-outlined-text-field id="txt-fecha-cumpleaños" label="Fecha cumpleaños"  value="<%=formato_fecha.format(c.getTime())%>" >
                                        <md-icon slot="leading-icon"><span class="mdi mdi-cake-variant"></span></md-icon>
                                    </md-outlined-text-field>
                                    <input type="date" id="txt-fecha" class="fecha-oculta" >
                                </div>
                            </div>
                        </div>
                        <p class="h4 text-secondary fw-bolder"><span class="mdi mdi-account-tie"></span> Información de contacto del nuevo usuario</p>
                        <div class="row row-cols-2 mt-4 mb-5 ms-4">
                            <div class="col">
                                <md-outlined-text-field class="w-100 mb-4" id="txt-busqueda" label="Ingrese su dirección" value="" >
                                    <md-icon slot="leading-icon"><span class="mdi mdi-map-marker-account"></span></md-icon>
                                </md-outlined-text-field>
                                <md-outlined-text-field class="w-100" id="txt-busqueda" label="Ingrese su correo electrónico" value="" >
                                    <md-icon slot="leading-icon"><span class="mdi mdi-email"></span></md-icon>
                                </md-outlined-text-field>
                            </div>
                            <div class="col">
                                <md-outlined-text-field class="mb-4" id="txt-busqueda" label="DNI" value="" >
                                    <md-icon slot="leading-icon"><span class="mdi mdi-phone"></span></md-icon>
                                </md-outlined-text-field>                                
                            </div>
                        </div>
                    </div>                    
                    <div class="col-4 align-self-center">
                        <img src="img/undraw_steps_re_odoy.svg" alt="" class="img-fluid" />
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
            </form>
        </div>
        <script type="text/javascript">
            const txt_fecha_cumpleaños = document.getElementById("txt-fecha-cumpleaños");
            const txt_fecha = document.getElementById("txt-fecha");

            txt_fecha_cumpleaños.addEventListener("click", () => txt_fecha.showPicker());
            txt_fecha_cumpleaños.addEventListener("focus", () => txt_fecha.showPicker());
            txt_fecha.addEventListener("change", () => txt_fecha_cumpleaños.value = txt_fecha.value);
        </script>

        <%@include file="source_js.jsp" %>
    </body>
</html>
