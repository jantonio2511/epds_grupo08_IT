<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Coche"%>
<%
    List<Coche> cochesAparcadosAun = (List<Coche>) request.getAttribute("buscarCochesAparcados");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Epd4_p3</title>
    </head>
    <body>
        <header><h1>Aparcamiento Zona Azul</h1></header>
        <div class="container">
            <% if (request.getParameter("buscar1") != null) {%>

            <table border="2">
                <tr>
                    <th>Matricula</th>
                    <th>Modelo</th>
                    <th>Hora de entrada</th>
                    <th>Hora de salida</th>
                    <th>Ti&eacute;mpo permitido</th>
                </tr>
                <%                    try {
                        if (cochesAparcadosAun.isEmpty()) {
                            out.write("La lista de coches esta vacia");
                        } else {

                            for (Coche cm : cochesAparcadosAun) {

                                //Matricula
                                String matricula = cm.getMatricula();
//                        //Modelo
                                String modelo = cm.getModelo();
//                        //Hora entrada y salida
                                Date horaEntrada = cm.getHoraEntrada();
                                Date horaSalida = cm.getHoraSalida();
//                        //Formato fecha
                                SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm");
                                String HoraEntrada = formatoHora.format(horaEntrada.getTime());
                                String HoraSalida = horaSalida == null ? "--" : formatoHora.format(horaSalida.getTime());
//                        //Tiempo permitido
                                int tiempoPermitido = cm.getTiempoPermitido();
                                String TiempoPermitido = String.valueOf(tiempoPermitido);
                %>
                <tr>
                    <td><%=matricula%></td>
                    <td><%=modelo%></td>
                    <td><%=HoraEntrada%></td>
                    <td><%=HoraSalida%></td>
                    <td><%=TiempoPermitido%></td>
                </tr>
                <%}
                        }
                    } catch (Exception e) {
                        out.write(e.getMessage());
                    }%>

            </table>

            <% }%>
            <div class="row">

                <div class="col-25">
                    <label>¿Que vehiculos quieres ver?</label>
                </div>
                <div class="col-75">
                    <form action="ParkingServlet" method="post">
                        <input type="hidden" name="accion" value="consultarAparcamiento" />
                        <input type="submit" name="noExceden" value="Coches Aparcados" />
                    </form>
                    <form name="TiempoPermitido" action="ParkingServlet" method="post">
                        <input type="hidden" name="accion" value="excedenTiempo" />
                        <input type="submit" name="exceden" value="Vehiculos que Exceden el tiempo en zona azul" />
                    </form>
                    <form action="ParkingServlet" method="post">
                        <input type="hidden" name="accion" value="noExcedenTiempo" />
                        <input type="submit" name="noExceden" value="Vehiculos que no Exceden el tiempo en zona azul" />
                    </form>
                </div>
            </div>

            <form name="buscarPorMatricula" action="ParkingServlet" method="post">
                <div class="row">
                    <div class="col-25">
                        <label>Buscar coches por matricula</label>
                    </div>
                    <div class="col-75">
                        <input type="text" name="matriculaCoche" placeholder="Introduzca matricula..."/>
                        <input type="hidden" name="accion" value="buscarMatricula" />
                        <input type="submit" name="buscar" value="buscar" />

                    </div>
                </div>
            </form>

        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
