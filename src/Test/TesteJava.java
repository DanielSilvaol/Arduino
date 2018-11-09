package Test;

import Service.ConsumoService;

public class TesteJava {
    public static void main(String[] args) {
        ConsumoService service = new ConsumoService();
        service.ligaLed("QUARTO");
        service.desligaLed("QUARTO");
    }
}
