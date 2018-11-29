package command;


import Modal.Consumo;
import Modal.Usuario;

import Service.ConsumoService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class Consumos implements Command {
    private static final String USUARIO_SESSION = "Sessao";

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();





        Usuario usuario = (Usuario) session.getAttribute(USUARIO_SESSION);
        Consumo consumo = new Consumo();
        if (usuario == null) {
            usuario = new Usuario();
            session.setAttribute(USUARIO_SESSION, usuario);
        }

        ConsumoService consumoService = new ConsumoService();
//        ArrayList<Consumo> SALA = consumoService.trazerDatas("SALA");
        ArrayList<Consumo> QUARTO = consumoService.trazerDatas("QUARTO");
        ArrayList<Consumo> COZINHA = consumoService.trazerDatas("COZINHA");

        String SALA = "OFF";
        session.setAttribute("SALA", SALA);
        session.setAttribute("QUARTO", QUARTO);
        session.setAttribute("COZINHA", COZINHA);
        session.setAttribute(USUARIO_SESSION, usuario);
        session.setAttribute("consumo", consumo);

        RequestDispatcher view = request.getRequestDispatcher("test.jsp");
        view.forward(request, response);

    }
}