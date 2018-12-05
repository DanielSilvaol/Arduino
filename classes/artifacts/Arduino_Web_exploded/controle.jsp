<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.google.gson.Gson" %>
<%
    String SalaSQL = "SELECT STATUS FROM Consumo WHERE NOME = 'SALA'  ORDER BY ID DESC LIMIT 1";
    String CozinhaSQL = "SELECT STATUS FROM Consumo WHERE NOME ='COZINHA' ORDER BY ID DESC LIMIT 1";
    String QuartoSQL = "SELECT STATUS FROM Consumo WHERE NOME = 'QUARTO'  ORDER BY ID DESC LIMIT 1";
    String Sala = null, Quarto = null, Cozinha = null;
    Connection connSala = null;
    Connection connQuarto = null;
    Connection connCozinha = null;
    PreparedStatement st = null, statement = null, preparedStatement = null;
    ResultSet rs = null;
    Gson gsonObj = new Gson();
    try {
        String valSala;
        Class.forName("com.mysql.jdbc.Driver");
        connSala = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");
        st = connSala.prepareStatement(SalaSQL);
        rs = st.executeQuery();
        while (rs.next()) {
            valSala = rs.getString("STATUS");
            Sala = gsonObj.toJson(valSala);
        }
        connSala.close();
    } catch (Exception e) {
        e.printStackTrace();

    }

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connCozinha = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");
        statement = connCozinha.prepareStatement(CozinhaSQL);
        rs = statement.executeQuery();
        String valCozinha;
        while (rs.next()) {
            valCozinha = rs.getString("STATUS");
            Cozinha = gsonObj.toJson(valCozinha);
        }
        connCozinha.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connQuarto = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");

        preparedStatement = connQuarto.prepareStatement(QuartoSQL);
        rs = preparedStatement.executeQuery();
        String valQuarto;
        while (rs.next()) {
            valQuarto = rs.getString("STATUS");
            Quarto = gsonObj.toJson(valQuarto);
        }
        connQuarto.close();
    } catch (Exception e) {
        e.printStackTrace();

    }
    String msg = (String) request.getAttribute("msg"),validar;
    validar = gsonObj.toJson(msg);


%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="CSS/teste2.css">
    <!-- <link rel="stylesheet" href="CSS/relatorio.css"> -->
    <title>Controle</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">

</head>

<body onload="load()" id="body">
    <div class="container">
        <div class="row">
            <header>
                <nav id="menu">
                    <div class="container">
                        <div class="row">
                            <ul id="menu-menu">
                                <li>
                                    <a href="controle.jsp" class="btn btn-default navbar-brand d-flex align-items-center"
                                       style="color: #FFF; border-bottom: 1px solid #FFF;"><strong>Controle</strong></a>
                                </li>
                                <li><a href="#" class="btn btn-default navbar-brand d-flex align-items-center" id="consumoteste"><strong>Consumo</strong></a>
                                    <ul id="consumoteste1">
                                        
                                        <li onclick="location.href='RelatorioSem.jsp';">Semanal</li>
                                        <li onclick="location.href='relatorio.jsp';" class="active">M&ecirc;s</li>
                                    </ul>
                                </li>
                                <li id="btn-user">
                                    <div class="user"></div>
                                    <ul id="user">
                                        <li style="margin-left: -35px;margin-top: 20px;">Exit</li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
        </div>
    </div>

    <section>
        <div class="container">
            <div class="row">
                <form action="controller.do" method="post">
                    <main role="main">
                        <div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card mb-4 shadow-sm">
                                            <img class="card-img-top" src="IMG/bed-1839184_1280.jpg" alt="Card image cap">
                                            <div class="card-body">
                                                <p class="card-text">Controle de luzes para o quarto</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="container">
                                                        <div class="col-md-12">
                                                            <button id="QuartoOn" class="btn btn-outline-success" type="submit"
                                                                name="command" value="ControleQuartoON" autocomplete="off"
                                                                checked>Ligar
                                                            </button>
                                                            <button id="QuartoOff" class="btn btn-outline-danger btn-pull"
                                                                type="submit" name="command" value="ControleQuartoOFF"
                                                                autocomplete="off">
                                                                Desligar
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="card mb-4 shadow-sm">
                                            <img class="card-img-top" src="IMG/living-room-2732939_1280.jpg" alt="Card image cap">
                                            <div class="card-body">
                                                <p class="card-text">Controle de luzes para a sala</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="container">
                                                        <div class="col-md-12">
                                                            <button id="SalaOn" class="btn btn-outline-success" type="submit"
                                                                name="command" value="ControleSalaON" autocomplete="off"
                                                                checked>Ligar
                                                            </button>
                                                            <button id="SalaOff" class="btn btn-outline-danger btn-pull"
                                                                type="submit" name="command" value="ControleSalaOFF"
                                                                autocomplete="off">
                                                                Desligar
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="card mb-4 shadow-sm">
                                            <img class="card-img-top" src="IMG/kitchen-2165756_1280.jpg" alt="Card image cap">
                                            <div class="card-body">
                                                <p class="card-text">Controle de luzes para a cozinha</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="container">
                                                        <div class="col-md-12">
                                                            <button id="CozinhaOn" class="btn btn-outline-success" type="submit"
                                                                name="command" value="ControleCozinhaON" autocomplete="off"
                                                                checked>Ligar
                                                            </button>
                                                            <button id="CozinhaOff" class="btn btn-outline-danger btn-pull"
                                                                type="submit" name="command" value="ControleCozinhaOFF"
                                                                autocomplete="off">Desligar
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </form>
            </div>
        </div>
    </section>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $("#consumoteste, #consumoteste1").on("mouseover", function () {
                document.getElementById("consumoteste1").style.display = "block";
                console.log();
            });
            
            $("#consumoteste, #consumoteste1").on("mouseout", function(){
                document.getElementById("consumoteste1").style.display = "none";
            });

            $("#btn-user, #user").on("mouseover", function(){
                document.getElementById("user").style.display = "block";
            });

            $("#btn-user, #user").on("mouseout", function(){
                document.getElementById("user").style.display = "none";
            });
        });
        var Coz = <%out.print(Cozinha);%>;
        var Sal = <%out.print(Sala);%>;
        var Qua = <%out.print(Quarto);%>;
        var validar = <%out.print(validar);%>
        function load() {
            if (Qua === '1') {

                $('#QuartoOn').prop('disabled', true);
                $('#QuartoOff').prop('disabled', false);
                document.getElementById("QuartoOn").className = 'btn btn-success';
            } else if (Qua === '0') {
                $('#QuartoOff').prop('disabled', true);
                $('#QuartoOn').prop('disabled', false);
                document.getElementById("QuartoOff").className = 'btn btn-danger btn-pull';
            }
            if (Sal === '1') {

                $('#SalaOn').prop('disabled', true);
                $('#SalaOff').prop('disabled', false);
                document.getElementById("SalaOn").className = 'btn btn-success';
            } else if (Sal === '0') {
                $('#SalaOff').prop('disabled', true);
                $('#SalaOn').prop('disabled', false);
                document.getElementById("SalaOff").className = 'btn btn-danger btn-pull';
            }
            if (Coz === '1') {

                $('#CozinhaOn').prop('disabled', true);
                $('#CozinhaOff').prop('disabled', false);
                document.getElementById("CozinhaOn").className = 'btn btn-success';
            } else if (Coz === '0') {
                $('#CozinhaOff').prop('disabled', true);
                $('#CozinhaOn').prop('disabled', false);
                document.getElementById("CozinhaOff").className = 'btn btn-danger btn-pull';
            }
            if(validar!=null){
                alert(<%out.print(validar);%>)
            }
        }
    </script>
</body>
</html>