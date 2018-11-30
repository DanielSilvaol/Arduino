package command;

import Modal.Usuario;
import Service.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class VerificaLogin implements Command {
    private static final String USUARIO_SESSION = "Sessao";

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        LoginService service = new LoginService();
        String login = request.getParameter("loginAcesso");
        String senha = request.getParameter("senhaAcesso");
        boolean status = false;
        if (login != null && senha != null) {
            status = service.verificaUsuario(login, senha);
        }

        if (status) {
            Usuario usuario = (Usuario) session.getAttribute(USUARIO_SESSION);
            if (usuario == null) {
                usuario = new Usuario();
                session.setAttribute(USUARIO_SESSION, usuario);
            }
            RequestDispatcher view = request.getRequestDispatcher("controle.jsp");
            view.forward(request, response);
        }else {
         /*Necessario enviar msg de senha incorreta*/
            RequestDispatcher view = request.getRequestDispatcher("loginOficial.jsp");
            view.forward(request, response);
        }
    }
}
