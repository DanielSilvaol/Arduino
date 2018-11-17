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
				String url = "jdbc:mysql://localhost:3306/";
				String db = "arduino";
				return DriverManager.getConnection(url + db,"root","root");
			} catch (ClassNotFoundException e) {
				throw new RuntimeException(e);
			}
	}

}
