package DAO;

import java.sql.*;

public class LoginDAO {


    public boolean CriaUsuario(String nome, String login, String senha) {
        String CriacaoSQL = "insert into login (nome, login, senha) VALUES ((?),(?),(?));";
        try (Connection connection = ConnectionFactory.obtemConexao();
             PreparedStatement statement = connection.prepareStatement(CriacaoSQL)) {
            statement.setString(1, nome);
            statement.setString(2, login);
            statement.setString(3, senha);
            statement.executeQuery();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean VerificaUsuario(String login, String senha) {
        String VerificaSQL = "SELECT LOGIN,SENHA FROM login WHERE LOGIN = (?) and SENHA = (?);";
        String loginValidar = null, senhaValidar = null;
        try (Connection connection = ConnectionFactory.obtemConexao();
             PreparedStatement statement = connection.prepareStatement(VerificaSQL)) {
            statement.setString(1, login);
            statement.setString(2, senha);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    loginValidar = resultSet.getString("LOGIN");
                    senhaValidar = resultSet.getString("SENHA");
                    if (loginValidar.equals(login) && senhaValidar.equals(senha)) {
                        return true;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean ResetSenha(String nome, String login, String senha) {
        String nomeValidar = null, loginValidar = null;
        String validarUsuario = "SELECT NOME,LOGIN FROM LOGIN WHERE  NOME = (?) AND LOGIN=(?);";
        try (Connection connection = ConnectionFactory.obtemConexao(); PreparedStatement statement = connection.prepareStatement(validarUsuario)) {
            statement.setString(1, nome);
            statement.setString(2, login);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    nomeValidar = resultSet.getString("NOME");
                    loginValidar = resultSet.getString("LOGIN");
                    if (nomeValidar.equals(nome) && loginValidar.equals(login)) {
                        validarReset(nomeValidar, loginValidar, senha);
                        return true;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void validarReset(String nome, String login, String senha) {
        String resetSenha = "UPDATE LOGIN SET SENHA = (?) WHERE NOME = (?) AND LOGIN=(?)";
        try (Connection connection = ConnectionFactory.obtemConexao(); PreparedStatement statement = connection.prepareStatement(resetSenha)) {
            statement.setString(1, senha);
            statement.setString(2, nome);
            statement.setString(3, login);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
