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

public class ControleQuartoON implements Command {

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
        try {

            String comando = "3";
            si.write(comando.getBytes());
            service.ligaLed("QUARTO");
            usuario.setLigaDesligaQuarto(1);
        } catch (Exception e) {
            String msg = "Erro, verificar se o arduino est&aacute; conectado.";
            request.setAttribute("msg", msg);
        }

        session.setAttribute(USUARIO_SESSION, usuario);
        RequestDispatcher view = request.getRequestDispatcher("controle.jsp");

        view.forward(request, response);

    }
}