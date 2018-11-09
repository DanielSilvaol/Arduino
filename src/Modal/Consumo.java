package Modal;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class Consumo {
    private int id;
    private int tempoON;
    private Date inicial;

    public Consumo() {
    }

    public Consumo(int tempoON, Date inicial) {
        super();
        this.tempoON = tempoON;
        this.inicial = inicial;
    }

    public void setTempoON(int tempoON) {
        this.tempoON = tempoON;
    }

    public Date getInicial() {
        return inicial;
    }

    public void setInicial(Date inicial) {
        this.inicial = inicial;
    }

    public  Integer getTempo(LocalDateTime tempoInicial) {

        return (int) Duration.between(tempoInicial, LocalDateTime.now()).get(ChronoUnit.SECONDS);
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTempoON() {
        return tempoON;
    }

    public void setValor(int valor) {
        this.tempoON = valor;
    }

}
