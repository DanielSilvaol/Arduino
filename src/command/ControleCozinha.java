package command;


import Service.ConsumoService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControleCozinha implements Command {

    private int ligaDesliga = 0;

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        ConsumoService service = new ConsumoService();
        if(ligaDesliga == 0){
            ligaDesliga =1;
            service.ligaLed("COZINHA");
        }else if (ligaDesliga ==1){
            ligaDesliga=0;
            service.desligaLed("COZINHA");

        }



        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
        view.forward(request, response);

    }
}