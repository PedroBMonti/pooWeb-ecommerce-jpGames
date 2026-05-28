<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login - JpGames</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="header">
    <a href="<%= request.getContextPath() %>/home" class="logo">JpGames</a>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/home">Loja</a>
        <a href="<%= request.getContextPath() %>/carrinho">Carrinho</a>
    </div>
</div>

<div class="container">

    <div class="hero">
        <h1>Acesso Administrativo</h1>
        <p>Entre com tua conta de administrador para gerenciar jogos e categorias.</p>
    </div>

    <div class="form-card">
        <h2>Login</h2>

        <form action="<%= request.getContextPath() %>/login" method="post">
            <label>Email</label>
            <input type="email" name="email" placeholder="admin@jpgames.com" required>

            <label>Senha</label>
            <input type="password" name="senha" placeholder="Digite sua senha" required>

            <button type="submit" class="btn-cadastro btn-login">Entrar</button>
        </form>

        <%
            String erro = (String) request.getAttribute("erro");
            if (erro != null) {
        %>
        <p class="erro"><%= erro %></p>
        <%
            }
        %>
    </div>

</div>

</body>
</html>