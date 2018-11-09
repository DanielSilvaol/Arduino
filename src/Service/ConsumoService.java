package Service;

import DAO.ConsumoDAO;
import Modal.Consumo;

import java.sql.Date;
import java.util.ArrayList;

/**
 * Created by davidson on 03/11/18.
 */
public class ConsumoService {
    ConsumoDAO consumoDAO = new ConsumoDAO();


    public void ligaLed(String Comodo){
        consumoDAO.EnviaHoraInicial(Comodo);
    }
    public void desligaLed(String comodo){
        consumoDAO.ValordoConsumo(comodo);
    }

    public ArrayList<Consumo> trazerDatas(String Comodo){
        return consumoDAO.dataConsumo(Comodo);

    }

}
