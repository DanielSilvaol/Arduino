package DAO;

import Modal.Consumo;


import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.util.ArrayList;
import java.util.Arrays;

public class ConsumoDAO {

    public void EnviaHoraInicial(String comodo) {
        int Verifica_dia = 0;
        int DiaAtual = 0;
        String Verifica_diaUpdate = "SELECT DATEDIFF(NOW(),'2018-11-22') AS quantidade_DIAS FROM Consumo where nome = (?) order by id desc limit 1;";

        try (Connection connection = ConnectionFactory.obtemConexao(); PreparedStatement statement = connection.prepareStatement(Verifica_diaUpdate)) {
            statement.setString(1, comodo);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Verifica_dia = rs.getInt("quantidade_DIAS");

                }
            }
            String pegaDados = "select contagem_dia from Consumo order by contagem_dia desc limit 1";
            try (Connection connection1 = ConnectionFactory.obtemConexao(); PreparedStatement statement1 = connection1.prepareStatement(pegaDados)) {
                try (ResultSet rs = statement1.executeQuery()) {
                    if (rs != null) {
                        while (rs.next()) {
                            DiaAtual = rs.getInt("contagem_dia");
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String Update_DIA = "update Consumo set contagem_dia = (?) where nome = (?) order by id desc limit 1";
        if (Verifica_dia >= DiaAtual) {
            try (Connection connection = ConnectionFactory.obtemConexao();
                PreparedStatement statement = connection.prepareStatement(Update_DIA)) {
                int aux = DiaAtual + 1;
                statement.setInt(1, aux);
                statement.setString(2, comodo);
                statement.execute();
            } catch (SQLException e) {
                e.getErrorCode();
            }
        } else {
            try (Connection connection = ConnectionFactory.obtemConexao();
                 PreparedStatement statement = connection.prepareStatement(Update_DIA)) {
                statement.setInt(1, DiaAtual);
                statement.setString(2, comodo);
                statement.execute();
            } catch (SQLException e) {
                e.getErrorCode();
            }
        }

        String sql = "Insert into Consumo (nome,data_inicial,contagem_dia,STATUS) values ((?),now(),(?),1)";
        try (Connection conn1 = ConnectionFactory.obtemConexao();
             PreparedStatement stm1 = conn1.prepareStatement(sql);) {
            stm1.setString(1, comodo);
            stm1.setInt(2, DiaAtual);
            stm1.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }

        String sqlStatus = "UPDATE Consumo SET STATUS = 1 WHERE nome LIKE (?) ORDER BY id DESC LIMIT 1";
        try (Connection connection = ConnectionFactory.obtemConexao();
             PreparedStatement statement = connection.prepareStatement(sqlStatus)) {
             statement.setString(1,comodo);
             statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void EnviaHoraFinal(String comodo) {
        String sql = "update Consumo set data_final = now() where nome=(?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, comodo);
            stm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Timestamp dataInicial = null;
        Timestamp dataFinal = null;
        int ValorConsm = 0;
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
        int result = ValorConsm * 60;
        String update = "update Consumo set valor = (?) where nome = (?) order by id desc limit 1";
        try {
            try (Connection conn = ConnectionFactory.obtemConexao()) {
                try (PreparedStatement stm = conn.prepareStatement(update)) {
                    stm.setInt(1, result);
                    stm.setString(2, comodo);
                    stm.execute();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sqlStatus = "UPDATE Consumo SET STATUS = 0 WHERE nome LIKE (?) ORDER BY id DESC LIMIT 1";
        try (Connection connection = ConnectionFactory.obtemConexao();
             PreparedStatement statement = connection.prepareStatement(sqlStatus)) {
            statement.setString(1,comodo);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void ValordoConsumo(String comodo) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String sql = "Select data_final from Consumo where nome=(?) order by id desc limit 1";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1, comodo);
            try (ResultSet rs = stm.executeQuery();) {

                if (rs.next()) {

                    timestamp = rs.getTimestamp("data_inicial");
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
        String sql3 = "update Consumo set data_final = (?) where nome = (?) order by id desc limit 1";
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
        String sql = "select id,data_final,TempoON from Consumo where nome = (?)";
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sql);) {
            stm.setString(1, comodo);
            try (ResultSet rs = stm.executeQuery();) {

                while (rs.next()) {

                    consumo = new Consumo();
                    consumo.setId(rs.getInt("id"));
                    consumo.setInicial(rs.getDate("data_inicial"));
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