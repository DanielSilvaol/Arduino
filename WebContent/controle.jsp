<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" href="../../../../favicon.ico">
    <link rel="stylesheet" href="CSS/controle.css">

    <title>Controle</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>

<body>
    
    <form action="controller.do" method="post">
        <img src="IMG/teste.jpg" id="background">
        <header>
            <nav id="menu">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 pull-right">
                            <ul class="teste" id="teste">
                                <li><a href="#" class="btn btn-default navbar-brand d-flex align-items-center"><strong>Home</strong></a></li>
                                <li><a href="controle.jsp" class="btn btn-default navbar-brand d-flex align-items-center" style="color: #FFF; border-bottom: 1px solid #FFF;"><strong>Controle</strong></a></li>
                                <li><a href="#" class="btn btn-default navbar-brand d-flex align-items-center" id="consumoteste"><strong>Consumo</strong></a>
                                    <ul id="consumoteste1">
                                        <li><a href="index2.jsp" class="btn btn-default navbar-brand d-flex align-items-center"><strong>Di&aacute;rio</strong></a></li>
                                        <li><a href="ConsSemana.jsp" class="btn btn-default navbar-brand d-flex align-items-center"><strong>Semanal</strong></a></li>
                                        <li><a href="ConsMes.jsp" class="btn btn-default navbar-brand d-flex align-items-center"><strong>Mensal</strong></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <main role="main">


            <div class="album py-5 bg-light">

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
                                                <button class="btn btn-outline-success" type="submit" name="command" value="ControleQuartoON" autocomplete="off" checked>Ligar</button>
                                                <button class="btn btn-outline-danger btn-pull" type="submit" name="command" value="ControleQuartoOFF" autocomplete="off">Desligar</button>
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
                                                <button class="btn btn-outline-success" type="submit" name="command" value="ControleSalaON" autocomplete="off" checked>Ligar</button>
                                                <button class="btn btn-outline-danger btn-pull" type="submit" name="command" value="ControleSalaOFF" autocomplete="off">Desligar</button>
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
                                                <button class="btn btn-outline-success" type="submit" name="command" value="ControleCozinhaON" autocomplete="off" checked>Ligar</button>
                                                <button class="btn btn-outline-danger btn-pull" type="submit" name="command" value="ControleCozinhaOFF" autocomplete="off">Desligar</button>
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
    </form>
</body>
</html>
