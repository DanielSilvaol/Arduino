package Modal;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.util.Date;

public class Consumo {
    private int id;
    private double valor;
    private Date dataFinal;


    public  Double getTempo(LocalDateTime tempoInicial) {

        return (double) Duration.between(tempoInicial, LocalDateTime.now()).get(ChronoUnit.SECONDS);
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public Date getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(Date dataFinal) {
        this.dataFinal = dataFinal;
    }
}
