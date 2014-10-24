<%-- 
    Document   : juego
    Created on : 29-sep-2014, 19:03:38
    Author     : raznara
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-1.11.1.min.js"></script>        
        <script src="js/bootstrap.min.js"></script> 
        <style type="text/css">
            body {
                padding: 20px;
                
            }
            #huecoparanumero {
                font-size: 160px;
                border-color: blueviolet;
                border-width: 5px;
                border-radius: 20px;
                border-style: inset;
                text-align: center;
            }
        </style>
        <title>Página del juego</title>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession();
            String strLoginDeUsuario = (String) miSesion.getAttribute("login");
            if (!"rafa".equals(strLoginDeUsuario)) {
        %>
        <h1>Si no estas logueado no puedes acceder al juego!</h1>
        <a href="index.html">Volver al formulario de login</a>
        <% } else {%>
        <div class="container">
            <!-- Example row of columns -->
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <div class="container">
                            <h1>Bienvenidos al juego de tirar un dado</h1>
                            <p>Este es el juego al que todo el mundo debería jugar.</p>
                        </div>
                    </div>
                    <h1></h1> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div id="huecoparanumero">0</div> 
                </div>
                <div class="col-md-9">
                    <br /><br />
                    <a class="btn btn-danger" id="botonPedirNum" href="">Pedir número</a><br /><br />
                    <a class="btn btn-primary" href="logout">Logout</a><br />
                    <script type="text/javascript">
                        $("#botonPedirNum").click(function (e) {
                            $.ajax({
                                url: "<%=request.getContextPath()%>/damenumero",
                                type: "GET",
                                async: false,
                                dataType: "json",
                                success: function (source) {
                                    $("#huecoparanumero").html(source.numero);
                                }
                            });
                            e.preventDefault();
                        });
                    </script>

                </div>

            </div>
        </div>

        <% }%>
    </body>
</html>
