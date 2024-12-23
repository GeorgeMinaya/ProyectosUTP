<%-- 
    Document   : medicos-jsp
    Created on : 18 oct. 2024, 18:50:06
    Author     : George
--%>

<%@page import="BL.*"%>
<%@page import="BE.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String accion = request.getParameter("do") == null ? "" : request.getParameter("do");
    String identificador = request.getParameter("id") == null ? "" : request.getParameter("id");

    MedicoBL _MedicoBL = new MedicoBL();

    // Variables iniciales
    MedicoBE datos_medico = new MedicoBE();

    if ("G".equalsIgnoreCase(accion) && !identificador.isEmpty()) {
        datos_medico = _MedicoBL.GetById(identificador);
    } else if ("U".equalsIgnoreCase(accion)) {
        datos_medico.setID_Medico(request.getParameter("id_update"));
        datos_medico.setDatosBasicos(request);
        _MedicoBL.Update(datos_medico);
        accion = "";
    } else if ("R".equalsIgnoreCase(accion)) {
        datos_medico.setCMP(request.getParameter("cmp"));
        datos_medico.setID_Especialidad(request.getParameter("id_especialidad"));
        datos_medico.setDatosBasicos(request);
        _MedicoBL.Insert(datos_medico);
        accion = "";
    } else if ("D".equalsIgnoreCase(accion)) {
        _MedicoBL.Delete(identificador);
        accion = "";
    }

    //Lista de médicos
    List<MedicoBE> lista = _MedicoBL.ReadAll();

%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="source_css.jsp" %>
        <title>Citas Clinica</title>
    </head>
    <body class="p-3">
        <div class="container shadow-blue border-bottom border-end border-4 border-secondary mt-5 p-4">
            <div class="row">
                <div class="col<%=accion.isEmpty() ? "" : "-8"%>">
                    <p class="h4 text-secondary fw-bolder"><span class="mdi mdi-text-box-edit-outline"></span> Mantenimiento de médicos disponibles</p>
                    <div class="d-flex flex-row ms-4 my-4">
                        <md-outlined-text-field class="w-50" id="txt-busqueda" label="Buscar por Nombre | Apellido | CMP" value="" >
                            <md-icon slot="leading-icon"><span class="mdi mdi-magnify"></span></md-icon>
                        </md-outlined-text-field>
                        <md-fab label="Buscar" aria-label="Buscar" title="Buscar" class="mx-4" >
                            <md-icon slot="icon"><span class="mdi mdi-24px mdi-magnify"></span></md-icon>
                        </md-fab>
                        <a href="medicos.jsp?do=C">
                            <md-fab aria-label="Registrar" title="Registrar nuevo médico" >
                                <md-icon slot="icon"><span class="mdi mdi-24px mdi-account-plus"></span></md-icon>
                            </md-fab>
                        </a>

                    </div>
                    <table class="table table-hover">
                        <thead class="table-primary text-muted">
                            <tr>
                                <th>CMP</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Especialidad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                for (MedicoBE r : lista) {
                            %>
                            <tr class="text-muted">
                                <td><%=r.getCMP()%></td>
                                <td><%=r.getNombre()%></td>
                                <td><%=r.getApellido()%></td>
                                <td><%=r.getNombre_Especialidad()%></td>
                                <td>
                                    <%if (r.getID_Medico().equalsIgnoreCase(identificador)) {%>
                                    <span class="mdi mdi-24px mdi-text-search-variant text-secondary"></span>
                                    <%} else {%>
                                    <a href="medicos.jsp?do=G&id=<%=r.getID_Medico()%>"><span class="mdi mdi-24px mdi-chevron-double-right text-info"></span></a>
                                        <%}%>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                <div class="col shadow border-bottom border-end border-3 border-secondary rounded-3 p-4 <%=accion.isEmpty() ? "d-none" : ""%>">
                    <%
                        EspecialidadBL _EspecialidadBL = new EspecialidadBL();
                        List<EspecialidadBE> especialidades = _EspecialidadBL.ReadAll();
                        String primero = especialidades.get(0).getID_Especialidad();
                    %>
                    <%if ("C".equalsIgnoreCase(accion)) {%>                    
                    <form id="frm-datos-medico" action="medicos.jsp?do=R" method="POST" accept-charset="UTF-8">
                        <div class="row">
                            <a href="medicos.jsp" class="text-secondary text-end mb-2"><span class="mdi mdi-24px mdi-close"></span></a>
                            <md-outlined-text-field class="" label="CMP" name="cmp" value="CMP"></md-outlined-text-field>
                            <md-outlined-text-field class="my-4" label="Nombres" name="nombre" ></md-outlined-text-field>
                            <md-outlined-text-field class="" label="Apellidos" name="apellido" ></md-outlined-text-field>
                            <md-outlined-text-field class="my-4" label="Telefono" name="telefono" ></md-outlined-text-field>
                            <md-outlined-text-field class="" label="Email" name="email" ></md-outlined-text-field>
                            <md-outlined-select class="my-4" name="id_especialidad">
                                <% for (EspecialidadBE r : especialidades) {%>
                                <md-select-option <%=primero.equalsIgnoreCase(r.getID_Especialidad()) ? "selected" : ""%> value="<%=r.getID_Especialidad()%>">
                                    <div slot="headline"><%=r.getNombre_Especialidad()%></div>
                                </md-select-option>
                                <%}%>
                            </md-outlined-select>                                
                        </div>
                        <div class="d-flex flex-row-reverse mt-5">
                            <md-fab label="Registrar" aria-label="Registrar" onclick="submitForm()">
                                <md-icon slot="icon"><span class="mdi mdi-24px mdi-check-bold"></span></md-icon>
                            </md-fab>
                        </div>
                    </form>
                    <%} else {%>
                    <form id="frm-datos-medico" action="medicos.jsp?do=U" method="POST" accept-charset="UTF-8">                            
                        <div class="row">
                            <a href="medicos.jsp" class="text-secondary text-end mb-2"><span class="mdi mdi-24px mdi-close"></span></a>
                            <md-outlined-text-field class="" label="CMP" value="<%=datos_medico.getCMP()%>" disabled></md-outlined-text-field>
                            <md-outlined-text-field class="my-4" label="Nombres" name="nombre" value="<%=datos_medico.getNombre()%>"></md-outlined-text-field>
                            <md-outlined-text-field class="" label="Apellidos" name="apellido" value="<%=datos_medico.getApellido()%>"></md-outlined-text-field>
                            <md-outlined-text-field class="my-4" label="Telefono" name="telefono" value="<%=datos_medico.getTeléfono()%>"></md-outlined-text-field>
                            <md-outlined-text-field class="" label="Email" name="email" value="<%=datos_medico.getEmail()%>"></md-outlined-text-field>
                            <md-outlined-text-field class="my-4" label="Especialidad" value="<%=datos_medico.getNombre_Especialidad()%>" disabled></md-outlined-text-field>
                            <input type="hidden" name="id_update" value="<%=identificador%>" />
                        </div>
                        <div class="d-flex flex-row mt-5">
                            <a href="medicos.jsp?do=D&id=<%=identificador%>" class="flex-grow-1">
                                <md-fab variant="tertiary" aria-label="Eliminar" title="Eliminar">
                                    <md-icon slot="icon"><span class="mdi mdi-24px mdi-trash-can-outline"></span></md-icon>
                                </md-fab>                                    
                            </a>                                
                            <md-fab label="Guardar" aria-label="Guardar cambios" title="Guardar cambios" onclick="submitForm()">
                                <md-icon slot="icon"><span class="mdi mdi-24px mdi-content-save"></span></md-icon>
                            </md-fab>
                        </div>
                    </form>
                    <%}%>
                </div>
            </div>            
        </div>
        <br/>
        <br/>
        <br/>
        <script type="text/javascript">

            function submitForm() {
                const form = document.getElementById('frm-datos-medico');
                form.addEventListener('submit', (event) => {
                    event.preventDefault();
                });

                form.submit();
            }
        </script>
        <%@include file="source_js.jsp" %>
    </body>
</html>
