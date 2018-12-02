package Service;

import DAO.ConsumoDAO;
import Modal.Consumo;

import java.sql.Date;
import java.util.ArrayList;

/**
 * Created by Daniel on 03/11/18.
 */
public class ConsumoService {
    private ConsumoDAO consumoDAO = new ConsumoDAO();


    public void ligaLed(String Comodo) {
        consumoDAO.EnviaHoraInicial(Comodo);
    }

    public void desligaLed(String comodo) {
        consumoDAO.EnviaHoraFinal(comodo);
    }


}
