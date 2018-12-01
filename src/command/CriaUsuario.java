package command;

import DAO.LoginDAO;
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
            /*MSG para dizer que foi criado com sucesso*/
        }
        if (verifica) {
            //msg se caso foi criado o usuario
        } else {
            //msg se caso não foi criado
        }
        /*Devese criar um else e uma msg caso de errado a criação*/
        RequestDispatcher view = request.getRequestDispatcher("test.jsp");
        view.forward(request, response);
    }
}
