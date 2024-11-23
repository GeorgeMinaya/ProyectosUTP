<%-- 
    Document   : cita_agenda
    Created on : 27 oct. 2024, 4:45:49 p. m.
    Author     : gaminaya
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
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

    List<String> horas = new ArrayList<>();
    LocalTime horaInicio = LocalTime.of(7, 0); // 07:00
    LocalTime horaFin = LocalTime.of(20, 0);   // 20:00
    DateTimeFormatter formato = DateTimeFormatter.ofPattern("HH:mm");

    while (!horaInicio.isAfter(horaFin)) {
        horas.add(horaInicio.format(formato));  // Agregar la hora formateada a la lista
        horaInicio = horaInicio.plusMinutes(30); // Incrementar 30 minutos
    }

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

        <script type="text/javascript" src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/FreddyFY/material-datepicker/1.0.9/dist/material-datepicker.css">
        <script type="text/javascript" src="https://cdn.rawgit.com/FreddyFY/material-datepicker/1.0.9/dist/material-datepicker.min.js"></script>
    </head>
    <body>
        <div class="container min-vh-100 d-flex flex-column justify-content-center">
            <div class="d-flex justify-content-center">
                <form id="frm-datos-medico" action="medicos.jsp?do=X" method="POST" accept-charset="UTF-8" class="w-75">
                    <div class="shadow-blue border-bottom border-end border-4 border-secondary p-4">
                        <div class="row justify-content-between">
                            <p class="h4 text-secondary fw-bolder mb-4"><span class="mdi mdi-text-box-edit-outline"></span> Seleccione la fecha y horario de la cita</p>                            
                            <div class="col p-5 mx-2 shadow border-4 border-end border-info rounded-1">
                                <div class="d-flex flex-column my-2 w-75">
                                    <md-outlined-text-field class="" id="txt-fecha-cita" label="Fecha de cita" value="<%=formato_fecha.format(c.getTime())%>">
                                        <md-icon slot="trailing-icon"><span class="mdi mdi-calendar"></span></md-icon>
                                    </md-outlined-text-field>                            
                                    <input type="text" id="txt-fecha" class="fecha-oculta" >
                                </div>
                                <md-outlined-select class="w-50" id="txt-hora" label="Hora cita">
                                    <md-icon slot="trailing-icon"><span class="mdi mdi-clock-outline"></span></md-icon>
                                        <% for (String r : horas) {%>
                                    <md-select-option  value="<%=r%>">
                                        <div slot="headline"><%=r%></div>
                                    </md-select-option>
                                    <%}%>
                                </md-outlined-select>
                                <md-outlined-select class="my-3 w-100" id="id-especialidad" label="Especialidad" >
                                    <md-icon slot="trailing-icon"><span class="mdi mdi-medication"></span></md-icon>
                                        <% for (EspecialidadBE r : especialidades) {%>
                                    <md-select-option <%=especialidad_elegida.equalsIgnoreCase(r.getID_Especialidad()) ? "selected" : ""%> value="<%=r.getID_Especialidad()%>">
                                        <div slot="headline"><%=r.getNombre_Especialidad()%></div>
                                    </md-select-option>
                                    <%}%>
                                </md-outlined-select>
                                <md-outlined-select class="w-100" id="id-medico" label="Medicos">
                                    <md-icon slot="trailing-icon"><span class="mdi mdi-doctor"></span></md-icon>

                                </md-outlined-select>
                            </div>
                            <div class="col-5 align-self-end">
                                <img src="img/undraw_calendar_re_ki49.svg" alt="" class="img-fluid" />
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="d-flex justify-content-between">
                                <md-fab variant="tertiary" class="" aria-label="Cancelar" label="" onclick="cerrar_session()">
                                    <md-icon slot="icon"><span class="mdi mdi-cancel"></span></md-icon>
                                </md-fab>
                                <md-fab class="" aria-label="Iniciar atención" label="Agendar">
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
            const _fecha = document.getElementById("txt-fecha");
            const txt_hora = document.getElementById("txt-hora");
            const ddl_especialidad = document.getElementById("id-especialidad")
            const ddl_medico = document.getElementById("id-medico");

            txt_hora.value = "<%=horas.get(0)%>";

            txt_fecha_cita.addEventListener("click", () => fecha_custom.open());
            txt_fecha_cita.addEventListener("focus", () => fecha_custom.open());

            let fecha_custom = new MaterialDatepicker("#txt-fecha", {
                lang: "es",
                outputFormat: "YYYY-MM-DD",
                onNewDate: function () {
                    txt_fecha_cita.value = _fecha.value;
                }
            });

            ddl_especialidad.addEventListener("change", () => {

                const elegido = ddl_especialidad.value;

                ddl_medico.innerHTML = '<md-icon slot="trailing-icon"><span class="mdi mdi-doctor"></span></md-icon>';
                ddl_medico.value = "";

                fetch("MedicoEspecialidad.do?id_especialidad=" + elegido)
                        .then(response => response.json())
                        .then(data => {
                            data.forEach(r => {
                                const optionElement = document.createElement('md-select-option');
                                optionElement.value = r.ID_Medico;
                                optionElement.textContent = r.CMP + " - " + r.Nombre + " " + r.Apellido;
                                ddl_medico.appendChild(optionElement);
                            });
                        })
                        .then(() => {
                            ddl_medico.selectedIndex = 0;
                        });
            });

        </script>
        <%@include file="source_js.jsp" %>
    </body>
</html>
