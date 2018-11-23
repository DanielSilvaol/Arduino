package Servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modal.Usuario;

public class Servletlogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			String usuario = request.getParameter("u");
			String senha = request.getParameter("p");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/arduino?useTimezone=true&serverTimezone=UTC&user=root&password=root");
			st = conn.prepareStatement("SELECT * FROM usuario WHERE login=?");
			st.setString(1, usuario);
			rs = st.executeQuery();
			// define usuario
			Usuario usuarios = null;
			if (rs.first()) {
				usuarios = new Usuario();
				usuarios.setId(rs.getInt("id"));
				usuarios.setNome(rs.getString("nome"));
				usuarios.setUsername(rs.getString("username"));
				usuarios.setSenha(rs.getString("senha"));
			}
			if (usuarios == null || !usuarios.getSenha().equals(senha)) {
				request.getSession().setAttribute("msg", "Login ou senha incorretos!");
				
				response.sendRedirect("login.jsp");
				
			} else {
				request.getSession().setAttribute("usuario", usuarios);
				response.sendRedirect("admin/index.jsp");
			}
		} catch (

		Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}