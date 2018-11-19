<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" href="../../../../favicon.ico">

    <title>Controle</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/controle.css">
  </head>

  <body>
<form action="controller.do" method="post">
    <button type="submit" name="command" value="ControleCozinha">Cozinha</button>

    <header>      
      <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container d-flex justify-content-between">
          <a href="index.html" class="navbar-brand d-flex align-items-center">            
            <strong>Voltar</strong>
          </a>          
        </div>
      </div>
    </header>

    <main role="main">

      <div class="album py-5 bg-light">
        <div class="container">

          <div class="row">
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" src="IMG/living-room-2732939_1280.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">Controle de luzes para o quarto.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-sm btn-outline-secondary">
                            <button type="submit" name="command" value="ControleQuarto" id="option1" autocomplete="off" checked> Ligado</button>
                        </label>
                        <label class="btn btn-sm btn-outline-secondary">
                            <button type="submit" name="command" value="ControleQuarto" id="option2" autocomplete="off"> Desligado</button>
                        </label>                        
                    </div>
                    <small class="text-muted">Quarto</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" src="IMG/living-room-2732939_1280.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">Controle de luzes para a sala.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-sm btn-outline-secondary">
                        <input type="submit" name="command" value="ControleSala" id="option1" autocomplete="off" checked> Ligado
                        </label>
                        <label class="btn btn-sm btn-outline-secondary">
                            <input type="submit" name="command" value="ControleSala" id="option2" autocomplete="off"> Desligado
                        </label>                        
                    </div>
                    <small class="text-muted">Sala</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" src="IMG/kitchen-2165756_1280.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">Controle de luzes para a cozinha.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-sm btn-outline-secondary">
                        <input type="submit" name="command" value="ControleCozinha" id="option1" autocomplete="off" checked> Ligado
                        </label>
                        <label class="btn btn-sm btn-outline-secondary">
                            <input type="submit" name="command" value="ControleCozinha"id="option2" autocomplete="off"> Desligado
                        </label>                        
                    </div>
                    <small class="text-muted">Cozinha</small>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" src="IMG/bathroom-1228427_1280.jpg" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">Controle de luzes para o banheiro.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-sm btn-outline-secondary">
                        <input type="radio" name="options" id="option1" autocomplete="off" checked> Ligado
                        </label>
                        <label class="btn btn-sm btn-outline-secondary">
                            <input type="radio" name="options" id="option2" autocomplete="off"> Desligado
                        </label>                        
                    </div>
                    <small class="text-muted">Banheiro</small>
                  </div>
                </div>
              </div>
            </div>       
          </div>
        </div>
      </div>

    </main>

    <footer class="text-muted">
      
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </form>
  </body>
</html>