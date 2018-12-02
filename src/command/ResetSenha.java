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
        boolean verifica = false;

        if (senha.equals(confirmeSenha)) {
            verifica = service.resetSenha(nome, login, senha);
        }
        if (verifica) {
            String msg = "Senha alterada com sucesso!.";
            request.setAttribute("msg", msg);
            RequestDispatcher view = request.getRequestDispatcher("loginOficial.jsp");
            view.forward(request, response);
        }else{
            String msg = "Falha na alteração.\n Usuario ou login incorreto.";
            request.setAttribute("msg", msg);
            RequestDispatcher view = request.getRequestDispatcher("loginOficial.jsp");
            view.forward(request, response);
        }

    }
}
