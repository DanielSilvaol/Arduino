package command;

import Service.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CriaUsuario implements Command {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginService service = new LoginService();
        String nome = request.getParameter("nomeCria");
        String login = request.getParameter("loginCria");
        String senha = request.getParameter("senhaCria");
        String senhaConfirmar = request.getParameter("senhaConfirmar");
        boolean verifica = false;

        if (senha.equals(senhaConfirmar)) {
            verifica = service.criaUsuario(nome, login, senha);
        }
        if (verifica) {
            String msg = "Conta criado com sucesso.";
            request.setAttribute("msg", msg);
            RequestDispatcher view = request.getRequestDispatcher("controle.jsp");
            view.forward(request, response);
        } else {
            String msg = "Erro.";
            request.setAttribute("msg", msg);
            RequestDispatcher view = request.getRequestDispatcher("loginOficial.jsp");
            view.forward(request, response);
        }
    }
}
