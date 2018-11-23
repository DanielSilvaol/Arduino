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
import java.util.ArrayList;
import java.util.Arrays;

public class ConsumoDAO {

    public void EnviaHoraInicial(String comodo) {
        String sql = "insert into Consumo (nome) values (?)";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1, comodo);
            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void ValordoConsumo(String comodo) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String sql = "Select DataInicial from Consumo where nome=(?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1, comodo);
            try (ResultSet rs = stm.executeQuery();) {

                if (rs.next()) {

                    timestamp = rs.getTimestamp("DataInicial");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e1) {
            System.out.print(Arrays.toString(e1.getStackTrace()));
        }
        Consumo consumo = new Consumo();
        LocalDateTime localDateTime = timestamp.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        int result = consumo.getTempo(localDateTime);


        String sql2 = "update Consumo set valor = (?) where nome = (?) order by id desc limit 1";
        Consumo(comodo, result, sql2);
        LocalDateTime horaFinal = LocalDateTime.now();
        Timestamp timestamp1 = Timestamp.from(horaFinal.atZone(ZoneId.systemDefault()).toInstant());
        String sql3 = "update Consumo set DataInicial = (?) where nome = (?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql3);) {
            stm.setTimestamp(1, timestamp1);
            stm.setString(2, comodo);
            stm.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        int tempoON = (int) Duration.between((Temporal) localDateTime, LocalDateTime.now()).get(ChronoUnit.SECONDS);

        String SQL4 = "update Consumo set TempoON = (?) where nome = (?) order by id desc limit 1";
        Consumo(comodo, tempoON, SQL4);
    }

    private void Consumo(String comodo, int valorConsumo, String sql2) {
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql2);) {
            stm.setInt(1, valorConsumo);
            stm.setString(2, comodo);
            stm.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Consumo> dataConsumo(String comodo) {
        Consumo consumo;
        ArrayList<Consumo> lista = new ArrayList<>();
        String sql = "select id,DataInicial,TempoON from Consumo where nome = (?)";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1,comodo);
            try (ResultSet rs = stm.executeQuery();) {

                while (rs.next()) {

                    consumo = new Consumo();
                    consumo.setId(rs.getInt("id"));
                    consumo.setInicial(rs.getDate("DataInicial"));
                    consumo.setTempoON(rs.getInt("TempoON"));
                    lista.add(consumo);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;

    }
}