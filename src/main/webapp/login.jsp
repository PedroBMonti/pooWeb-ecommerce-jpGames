<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
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
        <h1>Entrar na JpGames</h1>
        <p>Acesse tua conta para comprar jogos, gerenciar tua biblioteca ou administrar a loja.</p>
    </div>

    <div class="form-card">
        <h2>Login</h2>

        <form action="<%= request.getContextPath() %>/login" method="post">
            <label>Email</label>
            <input type="email" name="email" placeholder="seuemail@email.com" required>

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

        <p>
            Não tem conta?
            <a href="<%= request.getContextPath() %>/usuarios/cadastro" style="color: #66c0f4; text-decoration: none;">
                Criar conta
            </a>
        </p>
    </div>

</div>

</body>
</html>