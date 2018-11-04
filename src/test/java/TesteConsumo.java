import DAO.ConsumoDAO;

import java.sql.Date;

/**
 * Created by davidson on 03/11/18.
 */
public class TesteConsumo {
    public static void main(String[] args) {
        ConsumoDAO dao = new ConsumoDAO();
       // dao.EnviaHoraInicial("QUARTO");
        dao.ValordoConsumo("QUARTO");

    }
}
