package DAO;

import Modal.Consumo;


import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.util.Arrays;

public class ConsumoDAO {

    public void EnviaHoraInicial(String comodo){
        String sql = "insert into Consumo (nome) values (?)";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1, comodo);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
    public void ValordoConsumo(String comodo){
        Timestamp timestamp =  new Timestamp(System.currentTimeMillis());
        String sql = "Select DataInicial from Consumo where nome=(?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
                stm.setString(1,comodo);
            try (ResultSet rs = stm.executeQuery();) {

                if (rs.next()) {

                    timestamp= rs.getTimestamp("DataInicial");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e1) {
            System.out.print(Arrays.toString(e1.getStackTrace()));
        }
        Consumo consumo = new Consumo();
        LocalDateTime localDateTime = timestamp.toInstant().atZone( ZoneId.systemDefault() ).toLocalDateTime();
        double result = consumo.getTempo(localDateTime);
        double valorConsumo = result*60;


        String sql2 = "update Consumo set valor = (?) where nome = (?) order by id desc limit 1";
        Consumo(comodo, valorConsumo, sql2);
        LocalDateTime horaFinal = LocalDateTime.now();
        Timestamp timestamp1  = Timestamp.from( horaFinal.atZone( ZoneId.systemDefault() ).toInstant() );
        String sql3 = "update Consumo set DataInicial = (?) where nome = (?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql3);) {
            stm.setTimestamp(1, timestamp1);
            stm.setString(2,comodo);
            stm.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

            double tempoON = (double) Duration.between((Temporal) localDateTime, LocalDateTime.now()).get(ChronoUnit.SECONDS);

        String SQL4 = "update Consumo set TempoON = (?) where nome = (?) order by id desc limit 1";
        Consumo(comodo, tempoON, SQL4);
    }

    private void Consumo(String comodo, double valorConsumo, String sql2) {
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql2);) {
            stm.setDouble(1,valorConsumo);
            stm.setString(2,comodo);
            stm.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
