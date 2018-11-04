package Service;

import DAO.ConsumoDAO;

/**
 * Created by davidson on 03/11/18.
 */
public class ConsumoService {
    ConsumoDAO consumoDAO = new ConsumoDAO();


    public void horaInicial(String Comodo){
        consumoDAO.EnviaHoraInicial(Comodo);
    }
    public void desligaLEd(String comodo){
        consumoDAO.ValordoConsumo(comodo);
    }

}
