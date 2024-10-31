<%-- 
    Document   : login
    Created on : 22 oct. 2024, 11:32:02 p. m.
    Author     : gaminaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="source_css.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container min-vh-100 d-flex flex-column justify-content-center">
            <div class="d-flex me-5">
                <div class="d-flex flex-row justify-content-center p-5">
                    <img src="img/undraw_medicine_v2.svg" alt="" class="w-75" />
                </div>
                <form >
                    <div class="shadow-blue wh-login d-flex flex-column border-bottom border-end border-5 border-secondary justify-content-center align-items-center">

                        <h4 class="text-center text-secondary fw-bolder">CITAS DE HOSPITAL</h4>
                        <small class="mb-5 text-center text-muted">registre sus citas, elija su doctor</small>

                        <md-outlined-text-field class="mt-3" label="Usuario | CMP" value="">
                            <md-icon slot="leading-icon"><span class="mdi mdi-account"></span></md-icon>
                        </md-outlined-text-field>

                        <md-outlined-text-field class="my-3" label="Contraseña" value="" type="password">
                            <md-icon slot="leading-icon"><span class="mdi mdi-key-variant"></span></md-icon>
                        </md-outlined-text-field>

                        <md-fab class="my-4" aria-label="Edit" label="Ingresar" trailing-icon>
                            <md-icon slot="icon"><span class="mdi mdi-login"></span></md-icon>
                        </md-fab>

                        <md-text-button>Registrarse</md-text-button>

                    </div>
                </form>
            </div>
        </div>

        <%@include file="source_js.jsp" %>
    </body>
</html>
