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
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        String xVal, yVal;
        st = conn.prepareStatement("SELECT valor, DataInicial as mes FROM consumo WHERE month(DataInicial) = month(now()) order by DataInicial");
        rs = st.executeQuery();
        while (rs.next()) {
            xVal = rs.getString("mes");
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
                theme: "light2",
                title: {
                    text: "Consumo Mensal de energia"
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

    <link rel="stylesheet" href="CSS/controle.css">
    <title>Consumo Mês</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<img src="IMG/teste.jpg" id="background">

<header>
    <nav id="menu">
        <div class="container">
            <div class="row">
                <div class="col-md-12 pull-right">
                    <ul class="teste" id="teste">
                        <li><a href="#"
                               class="btn btn-default navbar-brand d-flex align-items-center"><strong>Home</strong></a>
                        </li>
                        <li><a href="controle.jsp" class="btn btn-default navbar-brand d-flex align-items-center"
                               style="color: #FFF; border-bottom: 1px solid #FFF;"><strong>Controle</strong></a></li>
                        <li><a href="#" class="btn btn-default navbar-brand d-flex align-items-center"
                               id="consumoteste"><strong>Consumo</strong></a>
                            <ul id="consumoteste1">
                                <li><a href="index2.jsp" class="btn btn-default navbar-brand d-flex align-items-center"><strong>Diário</strong></a>
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
<script src="JS/jquery/jquery.min.js"></script>
<script src="JS/efeitos.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>   