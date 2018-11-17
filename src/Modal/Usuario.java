package Modal;

public class Usuario {

    private int id;
    private String nome;
    private int ligaDesligaCozinha;
    private int ligaDesligaQuarto;
    private int ligaDesligaSala;
    private boolean statusCozinha;
    private boolean statusQuarto;
    private boolean statusSala;


    public int getLigaDesligaCozinha() {
        return ligaDesligaCozinha;
    }

    public void setLigaDesligaCozinha(int ligaDesligaCozinha) {
        this.ligaDesligaCozinha = ligaDesligaCozinha;
    }

    public int getLigaDesligaQuarto() {
        return ligaDesligaQuarto;
    }

    public void setLigaDesligaQuarto(int ligaDesligaQuarto) {
        this.ligaDesligaQuarto = ligaDesligaQuarto;
    }

    public int getLigaDesligaSala() {
        return ligaDesligaSala;
    }

    public void setLigaDesligaSala(int ligaDesligaSala) {
        this.ligaDesligaSala = ligaDesligaSala;
    }

    public boolean isStatusCozinha() {
        return statusCozinha;
    }

    public void setStatusCozinha(boolean statusCozinha) {
        this.statusCozinha = statusCozinha;
    }

    public boolean isStatusQuarto() {
        return statusQuarto;
    }

    public void setStatusQuarto(boolean statusQuarto) {
        this.statusQuarto = statusQuarto;
    }

    public boolean isStatusSala() {
        return statusSala;
    }

    public void setStatusSala(boolean statusSala) {
        this.statusSala = statusSala;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
