<%-- 
    Document   : cita_agenda
    Created on : 27 oct. 2024, 4:45:49 p. m.
    Author     : gaminaya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="BE.*"%>
<%@page import="java.util.List"%>
<%@page import="BL.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    EspecialidadBL _EspecialidadBL = new EspecialidadBL();
    List<EspecialidadBE> especialidades = _EspecialidadBL.ReadAll();
    String especialidad_elegida = especialidades.get(0).getID_Especialidad();

    MedicoBL _MedicoBL = new MedicoBL();
    List<MedicoBE> medicos = _MedicoBL.ReadAll();
    
    List<String> horarios = new ArrayList<>();
    
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="source_css.jsp" %>

        <script type="text/javascript" src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/FreddyFY/material-datepicker/1.0.9/dist/material-datepicker.css">
        <script type="text/javascript" src="https://cdn.rawgit.com/FreddyFY/material-datepicker/1.0.9/dist/material-datepicker.min.js"></script>
    </head>
    <body>
        <div class="container min-vh-100 d-flex flex-column justify-content-center">
            <div class="d-flex justify-content-center">
                <form id="frm-datos-medico" action="medicos.jsp?do=X" method="POST" accept-charset="UTF-8" style="width: 800px;">
                    <div class="shadow-blue border-bottom border-end border-4 border-secondary p-4">
                        <div class="row justify-content-between">
                            <p class="h4 text-secondary fw-bolder mb-3"><span class="mdi mdi-text-box-edit-outline"></span> Seleccione la fecha y horario de la cita</p>
                            <div class="col-6 ps-4">
                                <div class="d-flex flex-column w-75">
                                    <md-outlined-text-field id="txt-fecha-cita" label="Fecha de cita" >
                                        <md-icon slot="trailing-icon"><span class="mdi mdi-calendar"></span></md-icon>
                                    </md-outlined-text-field>                            
                                    <input type="text" id="txt-fecha" class="fecha-oculta" >
                                </div>
                                <md-outlined-select class="my-3" name="id_especialidad" label="Especialidad">
                                    <md-icon slot="trailing-icon"><span class="mdi mdi-medication"></span></md-icon>
                                    <% for (EspecialidadBE r : especialidades) {%>
                                    <md-select-option <%=especialidad_elegida.equalsIgnoreCase(r.getID_Especialidad()) ? "selected" : ""%> value="<%=r.getID_Especialidad()%>">
                                        <div slot="headline"><%=r.getNombre_Especialidad()%></div>
                                    </md-select-option>
                                    <%}%>
                                </md-outlined-select>
                                <md-outlined-select class="w-100" name="id_medico" label="Medicos">
                                    <md-icon slot="trailing-icon"><span class="mdi mdi-doctor"></span></md-icon>
                                    <% for (MedicoBE r : medicos) {%>
                                    <md-select-option value="<%=r.getID_Medico()%>">
                                        <div slot="headline"><%=r.GetNombreCompleto()%> </div>                                            
                                    </md-select-option>
                                    <%}%>
                                </md-outlined-select>
                            </div>
                            <div class="col-5 align-self-center">
                                <img src="img/undraw_calendar_re_ki49.svg" alt="" class="img-fluid" />
                            </div>
                        </div>
                        <div class="row mt-4 justify-content-between">
                            <div class="col-3">
                                <md-fab variant="tertiary" class="" aria-label="Cancelar" label="">
                                    <md-icon slot="icon"><span class="mdi mdi-cancel"></span></md-icon>
                                </md-fab>
                            </div>
                            <div class="col-3">
                                <md-fab class="ms-auto" aria-label="Agendar" label="Agendar">
                                    <md-icon slot="icon"><span class="mdi mdi-content-save"></span></md-icon>
                                </md-fab>
                            </div>
                        </div>
                    </div>
                </form>
            </div>            
        </div>


        <script type="text/javascript">

            const txt_fecha_cita = document.getElementById("txt-fecha-cita");
            const txt_fecha = document.getElementById("txt-fecha");

            txt_fecha_cita.addEventListener("click", () => fecha_custom.open());
            txt_fecha_cita.addEventListener("focus", () => fecha_custom.open());

            let fecha_custom = new MaterialDatepicker("#txt-fecha", {
                lang: "es",
                outputFormat: "YYYY-MM-DD",
                onNewDate: function () {
                    txt_fecha_cita.value = txt_fecha.value
                }
            });

        </script>
        <%@include file="source_js.jsp" %>
    </body>
</html>
