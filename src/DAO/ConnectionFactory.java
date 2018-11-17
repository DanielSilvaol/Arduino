package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	// Obtém conexão com o banco de dados
	static Connection obtemConexao() throws SQLException {
			try {
				String drive = "com.mysql.jdbc.Driver";
				Class.forName(drive);
				String db = "arduino";
				String stringConexao = "jdbc:mysql://127.0.0.1/"+db+"?autoReconnect=true&useSSL=false";

				return DriverManager.getConnection(stringConexao, "root", "root");
			} catch (ClassNotFoundException e) {
				throw new RuntimeException(e);
			}
	}

}
