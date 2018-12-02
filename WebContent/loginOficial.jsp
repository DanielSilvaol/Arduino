<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: odsda
  Date: 29/11/2018
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/teste.css">
    <title>Login</title>
</head>
<%
    String msg = (String) request.getAttribute("msg"), validar;
    Gson gsonObj = new Gson();
    validar = gsonObj.toJson(msg);
%>
<script>
    var validar = <%out.print(validar);%>
        function load() {

            if (validar != null) {
                alert(<%out.print(validar);%>)
            }
        }
</script>

<body onload="load()">

<header>
    <nav id="menu">
        <div class="container">
            <div class="row">
                <div class="col-md-12 pull-right">
                    <ul>
                        <li>
                            <a href="index.html" class="btn btn-default navbar-brand d-flex align-items-center"><strong>Home</strong></a>
                        </li>
                        <li>
                            <a href="#" class="btn btn-default navbar-brand d-flex align-items-center"
                               style="color: #FFF; border-bottom: 1px solid #FFF;"><strong>Login</strong></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>

<section>
    <%--Login--%>
    <div class="container" id="tela-login">
        <div class="row">
            <div class="col-md-12">
                <form action="controller.do" method="post">
                    <div class="text-center mb-4 login-text">
                        <h1>Login</h1>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12" id="input">
                                <div class="form-label-group">
                                    <input type="user" id="inputEmail" class="form-control" placeholder="Usuário"
                                           name="loginAcesso" required autofocus>
                                    <label for="inputEmail"></label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="inputPassword" class="form-control" placeholder="Senha"
                                           name="senhaAcesso" required>
                                    <label for="inputPassword"></label>
                                </div>
                                <label><a href="#" id="Esqueceu" onclick="Esqueci()">Esqueceu a Senha?</a></label>
                            </div>
                        </div>
                    </div>

                    <div class="container" id="btn-login">
                        <div class="row">
                            <div class="col-md-6" id="Cadastro">
                                <a class="btn btn-outline-warning btn-block" onclick="Criar()">Crie sua
                                    Conta
                                </a>
                            </div>
                            <div class="col-md-6">
                                <button id="Entrar" class="btn btn-outline-success btn-block" type="submit"
                                        name="command" value="VerificaLogin">Entrar
                                </button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <%--Esqueci minha senha--%>
    <div class="container" id="tela-esqueceu">
        <div class="row">
            <div class="col-md-12">
                <form action="controller.do" method="post">
                    <div class="text-center mb-4 login-text">
                        <h1>Reset de Senha</h1>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12" id="reset-input">
                                <div class="form-label-group">
                                    <input id="ResetUser" class="form-control" placeholder="Usuário"
                                           name="nomeReset" required autofocus>
                                    <label for="ResetUser"></label>
                                </div>

                                <div class="form-label-group">
                                    <input id="ResetLogin" class="form-control" placeholder="Login"
                                           name="loginReset" required autofocus>
                                    <label for="ResetLogin"></label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" class="form-control" placeholder="Nova Senha"
                                           name="senhaReset"
                                           required autofocus>
                                    <label for="inputPassword"></label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" class="form-control" placeholder="Confirme Nova Senha"
                                           name="confirmeReset" required>
                                    <label for="inputPassword"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" id="btn-esqueci">
                        <div class="row">
                            <div class="col-md-6" id="Voltar">
                                <button class="btn btn-outline-warning btn-block" onclick="Voltar()">Voltar
                                </button>
                            </div>
                            <div class="col-md-6">
                                <button id="Resetar" class="btn btn-outline-success btn-block" type="submit"
                                        name="command" value="ResetSenha">Resetar
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%--Criar Usuario--%>
    <div class="container" id="tela-criar">
        <div class="row">
            <div class="col-md-12">
                <form action="controller.do" method="post">
                    <div class="text-center mb-4 login-text">
                        <h1>Criação de Usuário</h1>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12" id="criacao-input">
                                <div class="form-label-group">
                                    <input id="CriacaoUser" class="form-control" placeholder="Usuário"
                                           name="nomeCria" required autofocus>
                                    <label for="CriacaoUser"></label>
                                </div>

                                <div class="form-label-group">
                                    <input id="CriaLogin" class="form-control" placeholder="Login"
                                           name="loginCria" required autofocus>
                                    <label for="CriaLogin"></label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" class="form-control" placeholder="Senha" name="senhaCria"
                                           required autofocus>
                                    <label for="inputPassword"></label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" class="form-control" placeholder="Confirmar Senha"
                                           name="senhaConfirmar" required>
                                    <label for="inputPassword"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" id="btn-cria">
                        <div class="row">
                            <div class="col-md-6" id="Voltar">
                                <button class="btn btn-outline-warning btn-block" onclick="Voltar()">Voltar
                                </button>
                            </div>
                            <div class="col-md-6">
                                <button id="Criar" class="btn btn-outline-success btn-block" type="submit"
                                        name="command" value="CriaUsuario">Criar
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
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

<script>

    function Esqueci() {
        document.getElementById("tela-login").style.display = "none";
        document.getElementById("tela-esqueceu").style.display = "block";
    }

    function Voltar() {
        document.getElementById("tela-esqueceu").style.display = "none";
        document.getElementById("tela-login").style.display = "block";
        document.getElementById("tela-criar").style.display = "none";
    }

    function Criar() {
        document.getElementById("tela-login").style.display = "none";
        document.getElementById("tela-esqueceu").style.display = "none";
        document.getElementById("tela-criar").style.display = "block";
    }
</script>
</body>
</html>
