<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../Desktop/Projeto/CSS/login.css">

    <title>Home</title>
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
        <div class="inner">
            <h3 class="masthead-brand">Home</h3>
            <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link" href="home.html">Home</a>
                <a class="nav-link" href="login.jsp">Login</a>
                <a class="nav-link active" href="#">Cadastro</a>
            </nav>
        </div>
    </header>
    <form action="ServletCadastro" method="post">
        <main role="main" class="inner cover" id="inner-cover">
            <form class="form-signin">
                <div class="text-center mb-4">
                    <img class="mb-4" src="../../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                    <h1 class="h3 mb-3 font-weight-normal">Cadastro</h1>
                </div>

                <div class="form-label-group">
                    <input type="" id="inputEmail" class="form-control" placeholder="Nome" required autofocus name="nome">
                    <label for="inputEmail"></label>
                </div>

                <div class="form-label-group">
                    <input type="" id="inputEmail" class="form-control" placeholder="Nome de Usuario" required
                           autofocus name="username">
                    <label for="inputEmail"></label>
                </div>

                <div class="form-label-group">
                    <input type="password" id="inputPassword" class="form-control" placeholder="Senha" required name="senha">
                    <label for="inputPassword"></label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
            </form>
        </main>
    </form>
    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p><a href="#">CCP2AN-MCA</a></p>
        </div>
    </footer>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>