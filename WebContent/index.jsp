<%--
  Created by IntelliJ IDEA.
  User: eunic
  Date: 09/11/2018
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList"%><%@ page import="java.util.Date"%>
<%@ page import="Modal.Consumo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

    <script type="text/javascript">

        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                title:{
                    text: "Consumo de energia diário"
                },
                axisX: {
                    valueFormatString: "DD MMM,YY"
                },
                axisY: {
                    title: "Consumo (em kWh)",
                    includeZero: false,
                    suffix: " kWh"
                },
                legend:{
                    cursor: "pointer",
                    fontSize: 16,
                    itemclick: toggleDataSeries
                },
                toolTip:{
                    shared: true
                },

                <%
                        ArrayList<Consumo> SALA = (ArrayList<Consumo>) request.getAttribute("SALA");
                        ArrayList<Consumo> QUARTO = (ArrayList<Consumo>) request.getAttribute("QUARTO");
                        ArrayList<Consumo> COZINHA = (ArrayList<Consumo>) request.getAttribute("COZINHA");
                    %>

                data: [{
                    name: "Cozinha",
                    type: "spline",
                    yValueFormatString: "#0.## kWh",
                    showInLegend: true,
                    dataPoints: [
                        <c:forEach var="consumo" items="${SALA}">
                        { x: ${consumo.inicial}, y: ${consumo.tempoON} }
                        </c:forEach>
                         { x: 5, y: 24 },
                        //{ x: new Date(${COZINHA}), y: 28 },
                        // { x: new Date('2018-11-10'), y: 12 },
                        // { x: new Date('2018-11-11'), y: 8 },
                        // { x: new Date('2018-11-12'), y: 29 },
                        // { x: new Date('2018-11-13'), y: 25 }
                    ]
                },
                    {
                        name: "Quarto",
                        type: "spline",
                        yValueFormatString: "#0.## kWh",
                        showInLegend: true,
                        dataPoints: [
                            /*    { x: new Date('2018-11-07'), y: 40 },
                                { x: new Date('2018-11-08'), y: 30 },
                                { x: new Date('2018-11-09'), y: 28 },
                                { x: new Date('2018-11-10'), y: 12 },
                                { x: new Date('2018-11-11'), y: 34 },
                                { x: new Date('2018-11-12'), y: 54 },
                                { x: new Date('2018-11-13'), y: 32 }
                            */]
                    },
                    {
                        name: "Sala",
                        type: "spline",
                        yValueFormatString: "#0.## kWh",
                        showInLegend: true,
                        dataPoints: [
                            /*  { x: new Date('2018-11-07'), y: 12 },
                              { x: new Date('2018-11-08'), y: 32 },
                              { x: new Date('2018-11-09'), y: 12 },
                              { x: new Date('2018-11-10'), y: 32 },
                              { x: new Date('2018-11-11'), y: 20 },
                              { x: new Date('2018-11-12'), y: 15 },
                              { x: new Date('2018-11-13'), y: 21 }*/
                        ]
                    }]
            });
            chart.render();

            function toggleDataSeries(e){
                if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                    e.dataSeries.visible = false;
                }
                else{
                    e.dataSeries.visible = true;
                }
                chart.render();
            }

        }
    </script>
</head>
<body>
<div id="chartContainer" style="height: 400px; width: 50%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<form action="controller.do" method="post">

<table border="1">
    <tr>
    Consumo do quarto
        <tr>
            <c:forEach var="consumo" items="${QUARTO}">
    <td>${consumo.inicial}</td>
            </c:forEach>
        </tr>
        <tr>
            <c:forEach var="consumo" items="${QUARTO}">
           <td>     ${consumo.tempoON}</td>
            </c:forEach>

        </tr>


</table>
    <table border="1">
        <tr>
            Consumo do cozinha
        <tr>
            <c:forEach var="consumo" items="${COZINHA}">
                <td>${consumo.inicial}</td>
            </c:forEach>
        </tr>
        <tr>
            <c:forEach var="consumo" items="${COZINHA}">
                <td>     ${consumo.tempoON}</td>
            </c:forEach>

        </tr>


    </table>
    <table border="1">
        <tr>
            Consumo do sala
        <tr>
            <c:forEach var="consumo" items="${SALA}">
                <td>${consumo.inicial}</td>
            </c:forEach>
        </tr>
        <tr>
            <c:forEach var="consumo" items="${SALA}">
                <td>     ${consumo.tempoON}</td>
            </c:forEach>

        </tr>


    </table>
       ID
        TempoON
    <button class="btn btn-primary" type="submit" name="command"
            value="Consumos">LA</button>


</form>
</body>
</html>