package command;

import Arduino.SerialInterface;
import DAO.ArduinoDAO;
import Modal.Usuario;
import Service.ConsumoService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ControleCozinhaOFF implements Command {

    private static final String USUARIO_SESSION = "Sessao";

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute(USUARIO_SESSION);
        if (usuario == null) {
            usuario = new Usuario();
            session.setAttribute(USUARIO_SESSION, usuario);
        }

        SerialInterface si = ArduinoDAO.getSerialInterface(request);
        ConsumoService service = new ConsumoService();

        service.desligaLed("COZINHA");
        String comando = "0";
        si.write(comando.getBytes());
        usuario.setLigaDesligaCozinha(0);

        session.setAttribute(USUARIO_SESSION, usuario);
        RequestDispatcher view = request.getRequestDispatcher("test.jsp");
        view.forward(request, response);

    }
}