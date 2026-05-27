<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login - JpGames</title>
</head>
<body>

<h2>Login JpGames</h2>

<form action="<%= request.getContextPath() %>/login" method="post">
    <input type="email" name="email" placeholder="Email" required><br><br>
    <input type="password" name="senha" placeholder="Senha" required><br><br>
    <button type="submit">Entrar</button>
</form>

<%
    String erro = (String) request.getAttribute("erro");
    if (erro != null) {
%>
<p style="color: red;"><%= erro %></p>
<%
    }
%>

<br>
<a href="<%= request.getContextPath() %>/home">Voltar para início</a>

</body>
</html>