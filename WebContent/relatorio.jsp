<%--
  Created by IntelliJ IDEA.
  User: joaor
  Date: 02/12/2018
  Time: 00:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
    List<Integer> Qpontos = new ArrayList();
    List<Integer> Spontos = new ArrayList();
    List<Integer> Cpontos = new ArrayList();
    List<String> dia = new ArrayList();
    List<String> Qdia = new ArrayList();
    List<String> Sdia = new ArrayList();
    List<String> Cdia = new ArrayList();
    List<String> mes = new ArrayList();
    List<String> ano = new ArrayList();
    int dataPoints;
    Connection conn = null;
    Connection conn2 = null;
    PreparedStatement st = null;
    ResultSet rs = null;
    int QvalorTotal = 0;
    int SvalorTotal = 0;
    int CvalorTotal = 0;



    /*      dia  */
    try {
        Class.forName("com.mysql.jdbc.Driver");
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=root");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");
//        conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        //int QyVal;
        String QxVal;
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("SELECT DATE_FORMAT( data_inicial, \"%d/%m/%Y\") as dia FROM Consumo group by monthname(data_inicial)order by data_inicial");
        rs = st.executeQuery();
        while (rs.next()) {
            //QyVal = rs.getInt("valor");
            QxVal = rs.getString("dia");
            // xVal2 = rs.getString("mes");
            // xVal3 = rs.getString("ano");
            /*map = new HashMap<Object, Object>();*/
            /*map.put("label", xVal);*/
            /*map.put("y", Integer.parseInt(yVal));*/
            //pontos.add(QyVal);
            dia.add(QxVal);
            // mes.add(xVSELECT valor_consumo as valor, DATE_FORMAT(data_inicial, "%m %d %Y") as dia FROM tb_consumo WHERE month(data_inicial) = 11 order by data_inicialal2);
            // ano.add(xVal3);


        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        // dataPoints = null;
    }


    /*      QUARTO  */
    try {
        Class.forName("com.mysql.jdbc.Driver");
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=root");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        int QyVal;
        String QxVal;
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("SELECT sum(valor) as valor, extract(MONTH FROM data_inicial) as mes FROM Consumo WHERE nome = \"Quarto\" GROUP by extract(MONTH FROM data_inicial) order by data_inicial");
        rs = st.executeQuery();
        while (rs.next()) {
            QyVal = rs.getInt("valor");
           // QxVal = rs.getString("dia");
           // xVal2 = rs.getString("mes");
           // xVal3 = rs.getString("ano");
            /*map = new HashMap<Object, Object>();*/
            /*map.put("label", xVal);*/
            /*map.put("y", Integer.parseInt(yVal));*/
            Qpontos.add(QyVal);
            //Qdia.add(QxVal);
           // mes.add(xVSELECT valor_consumo as valor, DATE_FORMAT(data_inicial, "%m %d %Y") as dia FROM tb_consumo WHERE month(data_inicial) = 11 order by data_inicialal2);
           // ano.add(xVal3);


        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
       // dataPoints = null;
    }

    /*      Sala  */
    try {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=root");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        int SyVal;
        String SxVal;
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("SELECT sum(valor) as valor,data_inicial as mes FROM Consumo WHERE nome = 'SALA' group by monthname(data_inicial) order by data_inicial;");
        rs = st.executeQuery();
        while (rs.next()) {
            SyVal = rs.getInt("valor");
           // SxVal = rs.getString("dia");
            // xVal2 = rs.getString("mes");
            // xVal3 = rs.getString("ano");
            /*map = new HashMap<Object, Object>();*/
            /*map.put("label", xVal);*/
            /*map.put("y", Integer.parseInt(yVal));*/
            Spontos.add(SyVal);
            //Sdia.add(SxVal);
            // mes.add(xVSELECT valor_consumo as valor, DATE_FORMAT(data_inicial, "%m %d %Y") as dia FROM tb_consumo WHERE month(data_inicial) = 11 order by data_inicialal2);
            // ano.add(xVal3);


        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        // dataPoints = null;
    }

    /*      cozinha  */
    try {
        Class.forName("com.mysql.jdbc.Driver");
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        int CyVal;
        String CxVal;
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("SELECT sum(valor) as valor, extract(MONTH FROM data_inicial) as mes FROM Consumo WHERE nome = \"Cozinha\" GROUP by extract(MONTH FROM data_inicial) order by data_inicial");
        rs = st.executeQuery();
        while (rs.next()) {
            CyVal = rs.getInt("valor");
          //  CxVal = rs.getString("dia");
            // xVal2 = rs.getString("mes");
            // xVal3 = rs.getString("ano");
            /*map = new HashMap<Object, Object>();*/
            /*map.put("label", xVal);*/
            /*map.put("y", Integer.parseInt(yVal));*/
            Cpontos.add(CyVal);
            //Cdia.add(CxVal);
            // mes.add(xVSELECT valor_consumo as valor, DATE_FORMAT(data_inicial, "%m %d %Y") as dia FROM tb_consumo WHERE month(data_inicial) = 11 order by data_inicialal2);
            // ano.add(xVal3);


        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        // dataPoints = null;
    }

    /*VALOR TOTAL DO QUARTO*/
    try {
        Class.forName("com.mysql.jdbc.Driver");
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        int yVal;
        String xVal;
        String xVal2;
        String xVal3;
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("SELECT sum(valor) as valorTotal FROM Consumo WHERE month(data_inicial) = month (now()) and nome = \"Quarto\" order by data_inicial");
        rs = st.executeQuery();
        while (rs.next()) {
            yVal = rs.getInt("valorTotal");

            // xVal2 = rs.getString("mes");
            // xVal3 = rs.getString("ano");
            /*map = new HashMap<Object, Object>();*/
            /*map.put("label", xVal);*/
            /*map.put("y", Integer.parseInt(yVal));*/
             QvalorTotal = rs.getInt("valorTotal");
            // mes.add(xVSELECT valor_consumo as valor, DATE_FORMAT(data_inicial, "%m %d %Y") as dia FROM tb_consumo WHERE month(data_inicial) = 11 order by data_inicialal2);
            // ano.add(xVal3);


        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        // dataPoints = null;
    }

    /*VALOR TOTAL DO sala*/
    try {
        Class.forName("com.mysql.jdbc.Driver");
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        int yVal;
        String xVal;
        String xVal2;
        String xVal3;
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("SELECT sum(valor) as valorTotal FROM Consumo WHERE month(data_inicial) = month (now()) and nome = \"Sala\" order by data_inicial");
        rs = st.executeQuery();
        while (rs.next()) {
            yVal = rs.getInt("valorTotal");

            // xVal2 = rs.getString("mes");
            // xVal3 = rs.getString("ano");
            /*map = new HashMap<Object, Object>();*/
            /*map.put("label", xVal);*/
            /*map.put("y", Integer.parseInt(yVal));*/
            SvalorTotal = rs.getInt("valorTotal");
            // mes.add(xVSELECT valor_consumo as valor, DATE_FORMAT(data_inicial, "%m %d %Y") as dia FROM tb_consumo WHERE month(data_inicial) = 11 order by data_inicialal2);
            // ano.add(xVal3);


        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        // dataPoints = null;
    }

    /*VALOR TOTAL DO Cozinha*/
    try {
        Class.forName("com.mysql.jdbc.Driver");
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        int yVal;
        String xVal;
        String xVal2;
        String xVal3;
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("SELECT sum(valor) as valorTotal FROM Consumo WHERE month(data_inicial) = month (now()) and nome = \"Cozinha\" order by data_inicial");
        rs = st.executeQuery();
        while (rs.next()) {
            yVal = rs.getInt("valorTotal");

            // xVal2 = rs.getString("mes");
            // xVal3 = rs.getString("ano");
            /*map = new HashMap<Object, Object>();*/
            /*map.put("label", xVal);*/
            /*map.put("y", Integer.parseInt(yVal));*/
            CvalorTotal = rs.getInt("valorTotal");
            // mes.add(xVSELECT valor_consumo as valor, DATE_FORMAT(data_inicial, "%m %d %Y") as dia FROM tb_consumo WHERE month(data_inicial) = 11 order by data_inicialal2);
            // ano.add(xVal3);


        }
        conn.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        // dataPoints = null;
    }


    /*Relatorio*/
    try {
        Class.forName("com.mysql.jdbc.Driver");
//	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/arduino1?user=root&password=");
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");
        st = conn.prepareStatement("set sql_mode = ''");
        rs = st.executeQuery();
        st = conn.prepareStatement("Select nome, valor, data_inicial from Consumo");
        rs = st.executeQuery();

    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'Não foi possível conectar ao banco de dados. Por favor, verifique se você tem o mySQL Connector instalado na máquina - se não, tente instalar o mesmo.</div>");
        // dataPoints = null;
    }

%>
<html>
<head>

    <script type="text/javascript">

        window.onload = function () {
            new Chart(document.getElementById("line-chart"), {
                type: 'line',
                data: {
                    labels: [<%
            for (int i = 0; i <= dia.size()-1; i++) {
                if(i != dia.size()-1){
                    out.print("'"+dia.get(i)+"'"+", ");
                        }else{
                            out.print("'"+dia.get(i)+"'");
                        }
                    }%>],

                    datasets: [{
                        data: [<%
            for (int i = 0; i <= Cpontos.size()-1; i++) {
                if(i != Cpontos.size()-1){
                out.print(Cpontos.get(i)+", ");
                }else{
                    out.print(Cpontos.get(i));
                }
            };%>],
                        label: "Cozinha",
                        borderColor: "#3e95cd",
                        fill: false
                    }, {
                        data: [<%
            for (int i = 0; i <= Spontos.size()-1; i++) {
                if(i != Spontos.size()-1){
                out.print(Spontos.get(i)+", ");
                }else{
                    out.print(Spontos.get(i));
                }
            };%>],
                        label: "Sala",
                        borderColor: "#8e5ea2",
                        fill: false
                    }, {
                        data: [<%
            for (int i = 0; i <= Qpontos.size()-1; i++) {
                if(i != Qpontos.size()-1){
                out.print(Qpontos.get(i)+", ");
                }else{
                    out.print(Qpontos.get(i));
                }
            };%>],
                        label: "Quarto",
                        borderColor: "#3cba9f",
                        fill: false
                    }
                    ]
                },
                options: {

                        scales: {
                            xAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Data'
                                }
                            }],
                            yAxes: [{
                                scaleLabel: {
                                    display:true,
                                    labelString: 'Consumo'
                                }
                            }]

                    },
                    title: {
                        display: true,
                        text: 'Consumo Mensal de energia'
                    }
                }
            });
        }


    </script>
    <link rel="stylesheet" href="CSS/relatorio.css" >

</head>
<body>

<article>
    <header>



           <div class="user"></div>
        <div class="interval">
            <ul>
                <li onclick="location.href='index.html';" >Exit</li>
                <li onclick="location.href='RelatorioSem.jsp';" >Semanal</li>
                <li onclick="location.href='relatorio.jsp';" class="active">mês</li>
                <li onclick="location.href='controle.jsp';" >Controle</li>
            </ul>
        </div>
    </header>
    <section>
        <canvas id="line-chart" width="400" height="150"></canvas>
        <%--  <div id="chartContainer" style="height: 50%; width: 40%; padding-left: 5%;"></div>
      <div class="chart">
            <canvas id="c1" width="450" height="100"></canvas>
        </div>--%>
    </section>
    <section>
        <header>Consumo</header>
        <div class="inlineChart">
            <canvas id="c2" width="100" height="100"></canvas>
            <div class="info">
                <div class="value">R$ <%out.print(CvalorTotal);%></div>
                <div class="title">Cozinha</div>
            </div>
        </div>
        <div class="inlineChart">
            <canvas id="c3" width="100" height="100"></canvas>
            <div class="info">
                <div class="value">R$ <%out.print(SvalorTotal);%></div>
                <div class="title">Sala</div>
            </div>
        </div>
        <div class="inlineChart">
            <canvas id="c4" width="100" height="100"></canvas>
            <div class="info">
                <div class="value">R$ <%out.print(QvalorTotal);%></div>
                <div class="title">Quarto</div>
            </div>
        </div>
    </section>
    <section>
        <table>
            <thead>
            <tr>
                <th align="center">Comodo</th>
                <th align="center">Consumo kw/h</th>
                <th align="center">Data</th>
            </tr>
            </thead>
            <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td align="center"><%=rs.getString("nome")%></td>
                <td align="center"><%=rs.getString("valor")%></td>
                <td align="center"><%=rs.getString("data_inicial")%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        </section>
    </article>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
<script src="JS/jquery/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
    $(document).ready(function () {
        $("#consumoteste, #consumoteste1").on("mouseover", function () {
            document.getElementById("consumoteste1").style.display = "block";
            console.log();
        });

        $("#consumoteste, #consumoteste1").on("mouseout", function(){
            document.getElementById("consumoteste1").style.display = "none";
        });
    });
</script>

</body>
</html>
