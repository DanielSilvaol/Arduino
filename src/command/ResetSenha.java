package command;

import Service.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ResetSenha implements Command {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginService service = new LoginService();
        String nome = request.getParameter("nomeReset");
        String login = request.getParameter("loginReset");
        String senha = request.getParameter("senhaReset");
        String confirmeSenha = request.getParameter("confirmeReset");

        if (senha.equals(confirmeSenha)) {
            service.resetSenha(nome, login, senha);
        }

        RequestDispatcher view = request.getRequestDispatcher("test.jsp");
        view.forward(request, response);

    }
}
