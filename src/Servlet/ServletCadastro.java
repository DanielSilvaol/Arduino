package Servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletCadastro extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            String nome = request.getParameter("nome");
            String login = request.getParameter("username");
            String senha = request.getParameter("senha");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/arduino?user=root&password=root");
            st = conn.prepareStatement("Insert into login(nome,login,senha) values(?,?,?)");
            st.setString(1, nome);
            st.setString(2, login);
            st.setString(3, senha);
            st.execute();
            request.getSession().setAttribute("msg", "Cadastro feito com sucesso!!");
            response.sendRedirect("login.jsp");
        } catch (
                Exception e) {
            throw new ServletException(e);
        }
    }
}