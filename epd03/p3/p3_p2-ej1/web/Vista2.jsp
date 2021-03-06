<%@page import="aparcamiento.DatosParking"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="aparcamiento.CocheModelo"%>
<%! List<CocheModelo> cochesAparcados = DatosParking.cochesZonaAzul();%>
<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Epd3_p3_p2_ej1</title>
    </head>
    <body>
        <header><h1>Aparcamiento Zona Azul</h1></header>
        <div class="container">
            <div class="row">
                <div class="col-25">
                    <label>�Que vehiculos quieres ver?</label>
                </div>
                <div class="col-75">
                    <label class="labelRadio">Vehiculos que exceden el tiempo en zona azul</label><input class="radioEstudio" type="radio" name="estudiadoIt" value="si">
                    <input class="radioEstudio" type="radio" name="estudiadoIt" value="no"><label class="labelRadio">Vehiculos que no</label>
                </div>
            </div>
            <script type="text/javascript">

                $(document).ready(function () {
                    $(".radioEstudio").click(function (evento) {

                        var valor = $(this).val();

                        if (valor === 'si') {
                            $("#siEstudio").css("display", "block");
                            $("#noEstudio").css("display", "none");
                        } else {
                            $("#siEstudio").css("display", "none");
                            $("#noEstudio").css("display", "block");
                        }
                    });
                });

            </script>
            <div id="siEstudio" class="row" style="display: none;">
                <table border="2">
                    <tr>
                        <th>Matricula</th>
                        <th>Modelo</th>
                        <th>Hora de entrada</th>
                        <th>Hora de salida</th>
                        <th>Tiempo permitido</th>
                    </tr>
                    <%
                        for (CocheModelo cm : cochesAparcados) {
                            //Matricula
                            String matricula = cm.getMatricula();
                            //Modelo
                            String modelo = cm.getModelo();
                            //Hora entrada y salida
                            SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm");
                            Date horaEntrada = cm.getHoraEntrada().getTime();
                            String HoraEntrada = formatoHora.format(horaEntrada.getTime());

                            int diferencia = -1;
                            String HoraSalida = "";
                            Calendar horaSalida = cm.getHoraSalida();

                            if (horaSalida != null) {
                                Date horaSalida1 = cm.getHoraSalida().getTime();
                                HoraSalida = formatoHora.format(horaSalida.getTime());
                                long minutosHoraEntrada = horaEntrada.getTime();
                                long minutosHoraSalida = horaSalida1.getTime();
                                diferencia = (int) ((minutosHoraSalida - minutosHoraEntrada) / (1000 * 60));

                            } else {
                                HoraSalida = "--";
                                diferencia = -1;
                            }
                            //Tiempo permitido
                            int tiempoPermitido = cm.getTiempoPermitido();
                            String TiempoPermitido = String.valueOf(tiempoPermitido);

                            if (diferencia > tiempoPermitido) {
                    %>
                    <tr>
                        <td><%=matricula%></td>
                        <td><%=modelo%></td>
                        <td><%=HoraEntrada%></td>
                        <td><%=HoraSalida%></td>
                        <td><%=TiempoPermitido%></td>
                    </tr>
                    <%}
                        }%>

                </table>
            </div>
            <div id="noEstudio" class="row" style="display: none;">
                <table border="2">
                    <tr>
                        <th>Matricula</th>
                        <th>Modelo</th>
                        <th>Hora de entrada</th>
                        <th>Hora de salida</th>
                        <th>Tiempo permitido</th>
                    </tr>
                    <%
                        for (CocheModelo cm : cochesAparcados) {
                            //Matricula
                            String matricula = cm.getMatricula();
                            //Modelo
                            String modelo = cm.getModelo();
                            //Hora entrada y salida
                            SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm");
                            Date horaEntrada = cm.getHoraEntrada().getTime();
                            String HoraEntrada = formatoHora.format(horaEntrada.getTime());

                            int diferencia = -1;
                            String HoraSalida = "";
                            Calendar horaSalida = cm.getHoraSalida();

                            if (horaSalida != null) {
                                Date horaSalida1 = cm.getHoraSalida().getTime();
                                HoraSalida = formatoHora.format(horaSalida.getTime());
                                long minutosHoraEntrada = horaEntrada.getTime();
                                long minutosHoraSalida = horaSalida1.getTime();
                                diferencia = (int) ((minutosHoraSalida - minutosHoraEntrada) / (1000 * 60));

                            } else {
                                HoraSalida = "--";
                                diferencia = -1;
                            }
                            //Tiempo permitido
                            int tiempoPermitido = cm.getTiempoPermitido();
                            String TiempoPermitido = String.valueOf(tiempoPermitido);

                            if (diferencia <= tiempoPermitido) {
                    %>
                    <tr>
                        <td><%=matricula%></td>
                        <td><%=modelo%></td>
                        <td><%=HoraEntrada%></td>
                        <td><%=HoraSalida%></td>
                        <td><%=TiempoPermitido%></td>
                    </tr>
                    <%}
                        }%>

                </table>
            </div>


            <% //Busqueda de coches %>

            <form method="post">
                <div class="row">
                    <div class="col-25">
                        <label>Buscar coches por matricula</label>
                    </div>
                    <div class="col-75">
                        <input type="text" name="matriculaCoche">
                        <input type="submit" name="buscar" value="buscar">
                    </div>
                </div>
            </form>

            <%

                if (request.getParameter("buscar") != null) {

                    String matriculaRecibida = (String) request.getParameter("matriculaCoche");
                    if (matriculaRecibida != null && matriculaRecibida != "") {
            %>

            <div class="row">
                <table border="2">
                    <tr>
                        <th>Matricula</th>
                        <th>Modelo</th>
                        <th>Hora de entrada</th>
                        <th>Hora de salida</th>
                        <th>Tiempo permitido</th>
                    </tr>
                    <%
                        for (CocheModelo cm : cochesAparcados) {
                            //Matricula
                            String matricula = cm.getMatricula();
                            //Modelo
                            String modelo = cm.getModelo();
                            //Hora entrada y salida
                            SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm");
                            Date horaEntrada = cm.getHoraEntrada().getTime();
                            String HoraEntrada = formatoHora.format(horaEntrada.getTime());

                            String HoraSalida = "";
                            Calendar horaSalida = cm.getHoraSalida();

                            if (horaSalida != null) {
                                Date horaSalida1 = cm.getHoraSalida().getTime();
                                HoraSalida = formatoHora.format(horaSalida.getTime());

                            } else {
                                HoraSalida = "--";

                            }
                            //Tiempo permitido
                            int tiempoPermitido = cm.getTiempoPermitido();
                            String TiempoPermitido = String.valueOf(tiempoPermitido);

                            if (matricula.startsWith(matriculaRecibida)) {
                    %>
                    <tr>
                        <td><%=matricula%></td>
                        <td><%=modelo%></td>
                        <td><%=HoraEntrada%></td>
                        <td><%=HoraSalida%></td>
                        <td><%=TiempoPermitido%></td>
                    </tr>

                    <%}
                        }%>

                </table>

            </div>
            <% }
                } %>


            <form method="post">
                <div class="row">
                    <div class="col-25">
                        <label>Coches que siguen en el aparcamiento</label>
                    </div>
                    <div class="col-75">

                        <input type="submit" name="buscar1" value="buscar">
                    </div>
                </div>
            </form>

            <%

                if (request.getParameter("buscar1") != null) {


            %>

            <div class="row">
                <table border="2">
                    <tr>
                        <th>Matricula</th>
                        <th>Modelo</th>
                        <th>Hora de entrada</th>
                        <th>Hora de salida</th>
                        <th>Tiempo permitido</th>
                    </tr>
                    <%                      for (CocheModelo cm : cochesAparcados) {
                            //Matricula
                            String matricula = cm.getMatricula();
                            //Modelo
                            String modelo = cm.getModelo();
                            //Hora entrada y salida
                            SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm");
                            Date horaEntrada = cm.getHoraEntrada().getTime();
                            String HoraEntrada = formatoHora.format(horaEntrada.getTime());

                            String HoraSalida = "";
                            Calendar horaSalida = cm.getHoraSalida();

                            if (horaSalida != null) {
                                Date horaSalida1 = cm.getHoraSalida().getTime();
                                HoraSalida = formatoHora.format(horaSalida.getTime());

                            } else {
                                HoraSalida = "--";

                            }

                            //Tiempo permitido
                            int tiempoPermitido = cm.getTiempoPermitido();
                            String TiempoPermitido = String.valueOf(tiempoPermitido);

                            if (HoraSalida == "--") {
                    %>
                    <tr>
                        <td><%=matricula%></td>
                        <td><%=modelo%></td>
                        <td><%=HoraEntrada%></td>
                        <td><%=HoraSalida%></td>
                        <td><%=TiempoPermitido%></td>
                    </tr>

                    <%}
                        }%>

                </table>

            </div>
            <% }%>
        </div>
    </body>
</html>
