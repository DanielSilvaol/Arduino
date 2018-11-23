<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="CSS/login2.css">
</head>
<body>

 <c:if test="${!empty msg}">
    <script>
         alert("${msg}");
    </script>
</c:if>
	<div class="login">
		<h1>Login</h1>
		<form method="post" action="Servletlogin">
			<input type="text" name="u" placeholder="Usuario" required="required" />
			<input type="password" name="p" placeholder="Senha"
				required="required" />
		 <button type="submit" class="btn btn-primary btn-block btn-large" value="Entrar">login</button>
		 
		</form>
		<%
		
			/*String usuario = request.getParameter("usuario");
			String senha = request.getParameter("senha");
			session.setAttribute("usuario", usuario);
			response.sendRedirect("index.jsp");*/
		%>
		<p class="text--center">
			Não é um membro? <a href="Tcadastro.jsp" style="color: white;">Inscreva-se
				agora</a>
		</p>
	</div>
</body>
</html>