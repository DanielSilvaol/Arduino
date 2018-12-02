package DAO;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsumoDAO {

    public void EnviaHoraInicial(String comodo) {
        String sql = "Insert into Consumo (nome,data_inicial,STATUS,valor) values ((?),now(),1,0)";
        try (Connection conn1 = ConnectionFactory.obtemConexao(); PreparedStatement stm1 = conn1.prepareStatement(sql);) {
            stm1.setString(1,comodo);
            stm1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String sqlStatus = "UPDATE Consumo SET STATUS = 1 WHERE nome LIKE (?) ORDER BY id DESC LIMIT 1";
        //Update(comodo, sqlStatus);

    }


    public void EnviaHoraFinal(String comodo) {
        String sql = "update Consumo set data_final = now() where nome=(?) order by id desc limit 1";
        Update(comodo, sql);

        Timestamp dataInicial = null;
        Timestamp dataFinal = null;
        int ValorConsm = 0;

        //Puxa a data final para ajudar no SQL abaixo deste
        String sql1 = "select data_inicial, data_final from Consumo where nome=(?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sql1)) {
            stm.setString(1, comodo);
            stm.execute();
            try (ResultSet rs = stm.executeQuery()) {
                if (rs != null) {
                    while (rs.next()) {
                        dataFinal = rs.getTimestamp("data_final");
                        dataInicial = rs.getTimestamp("data_inicial");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //Faz a conta da diferença de minutos da data inicial e a data final
        String sqlValor = "SELECT  TIMESTAMPDIFF(MINUTE,(?),(?)) AS quantidade_MINUTOS FROM Consumo where nome=(?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sqlValor)) {
            stm.setTimestamp(2, dataFinal);
            stm.setTimestamp(1, dataInicial);
            stm.setString(3, comodo);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs != null) {
                    while (rs.next())
                        ValorConsm = rs.getInt("quantidade_MINUTOS");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Faz update do valor que ficou ligado ,para saber quanto que ele esta gastando
        int result = ValorConsm * 60;
        String update = "update Consumo set valor = (?) where nome = (?) order by id desc limit 1";
        try {
            try (Connection conn = ConnectionFactory.obtemConexao()) {
                try (PreparedStatement stm = conn.prepareStatement(update)) {
                    stm.setInt(1, result);
                    stm.setString(2, comodo);
                    stm.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String sqlStatus = "UPDATE Consumo SET STATUS = 0 WHERE nome LIKE (?) ORDER BY id DESC LIMIT 1";
        Update(comodo, sqlStatus);
    }

    //Atualiza status da lampada e o nome do quarto para a data final
    private void Update(String comodo, String sql) {
        try (Connection conn = ConnectionFactory.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, comodo);
            stm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}