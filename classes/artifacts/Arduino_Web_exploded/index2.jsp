<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>

<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
    String dataPoints = null;
    Connection conn = null;
    PreparedStatement st = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/arduino?user=root&password=root");
//    conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        String xVal, yVal;
//    st = conn.prepareStatement("SELECT valor_consumo, data_inicial as dia FROM tb_consumo where day(data_inicial) = day(now()) order by data_inicial");
        st = conn.prepareStatement("SELECT valor, DataInicial as dia FROM Consumo where day(DataInicial) = day(now()) order by DataInicial");
        rs = st.executeQuery();
        while (rs.next()) {
            xVal = rs.getString("dia");
            yVal = rs.getString("valor");
            map = new HashMap<Object, Object>();
            map.put("label", xVal);
            map.put("y", Integer.parseInt(yVal));
            list.add(map);
            dataPoints = gsonObj.toJson(list);
        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        dataPoints = null;
    }
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                theme: "dark2",


                title: {
                    text: "Consumo Diario de energia"
                },
                axisX: {
                    title: "Dia"
                },
                axisY: {
                    title: "Consumo por kw/h"
                },
                data: [{
                    type: "line",
                    yValueFormatString: "#,##0 consumo kw/h",
                    dataPoints: <%out.print(dataPoints);%>
                }]
            });
            chart.render();

        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <link rel="stylesheet" href="CSS/controle.css">
    <title>Controle</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../eclipse-workspace/grafico/WebContent/CSS/controle.css">
</head>

<body>
<img src="IMG/teste.jpg" id="background">

<header>
    <nav id="menu">
        <div class="container">
            <div class="row">
                <div class="col-md-12 pull-right">
                    <ul class="teste" id="teste">
                        <li><a href="index.html"
                               class="btn btn-default navbar-brand d-flex align-items-center"><strong>Home</strong></a>
                        </li>
                        <li><a href="controle.jsp" class="btn btn-default navbar-brand d-flex align-items-center"
                               ><strong>Controle</strong></a></li>
                        <li><a href="#" class="btn btn-default navbar-brand d-flex align-items-center"
                               id="consumoteste" style="color: #FFF; border-bottom: 1px solid #FFF;"><strong>Consumo</strong></a>
                            <ul id="consumoteste1">
                                <li><a href="index2.jsp" class="btn btn-default navbar-brand d-flex align-items-center" style="color: #FFF; border-bottom: 1px solid #FFF;"><strong>Diário</strong></a>
                                </li>
                                <li><a href="ConsSemana.jsp"
                                       class="btn btn-default navbar-brand d-flex align-items-center"><strong>Semanal</strong></a>
                                </li>
                                <li><a href="ConsMes.jsp"
                                       class="btn btn-default navbar-brand d-flex align-items-center"><strong>Mensal</strong></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>
<main role="main">
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
</main>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<footer class="text-muted">

</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
<script src="JS/jquery/jquery.min.js"></script>
<script src="JS/efeitos.js"></script>
</body>
</html>   