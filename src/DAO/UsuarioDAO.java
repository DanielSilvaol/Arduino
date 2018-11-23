package DAO;

import Modal.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {

    public int cadastroCliente(Usuario usuario) {

        String sqlInsert = "insert into login (nome,login,senha) values (?,?,?);";
        // usando o try with resources do Java 7, que fecha o que abriu

        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
            stm.setString(1, usuario.getNome());
            stm.setString(2, usuario.getUsername());
            stm.setString(2, usuario.getSenha());

            stm.execute();
            String sqlQuery = "SELECT LAST_INSERT_ID()";
            try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
                 ResultSet rs = stm2.executeQuery();) {
                if (rs.next()) {
                    usuario.setId(rs.getInt(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario.getId();
    }

    public Usuario carregarUsuario(int id) {
        Usuario usuario = new Usuario();
        usuario.setId(id);
        String sqlSelect = "SELECT  Nome_Cliente, Email_Cliente FROM Cliente WHERE Cliente.ID_Cliente = ?";
        // usando o try with resources do Java 7, que fecha o que abriu
        try (Connection conn = ConnectionFactory.obtemConexao();
             PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
            stm.setInt(1, usuario.getId());
            try (ResultSet rs = stm.executeQuery();) {
                if (rs.next()) {
                    usuario.setId(rs.getInt("id_cliente"));
                    usuario.setNome(rs.getString("nome_cliente"));
                    usuario.setSenha(rs.getString("email_cliente"));
                } else {
                    usuario.setId(-1);
                    usuario.setNome(null);
                    usuario.setSenha(null);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e1) {
            System.out.print(e1.getStackTrace());
        }
        return usuario;
    }
}
