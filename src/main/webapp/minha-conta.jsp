<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Usuario" %>
<%@ page import="model.Jogo" %>

<%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    List<Jogo> jogos = (List<Jogo>) request.getAttribute("jogos");
%>

<html>
<head>
    <title>Minha Conta - JpGames</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="header">
    <a href="<%= request.getContextPath() %>/home" class="logo">JpGames</a>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/home">Loja</a>
        <a href="<%= request.getContextPath() %>/carrinho">Carrinho</a>
        <a href="<%= request.getContextPath() %>/logout">Sair</a>
    </div>
</div>

<div class="container">

    <% if (usuario != null) { %>

    <div class="profile-box">
        <div class="profile-photo">
            <% if (usuario.getFotoUrl() != null && !usuario.getFotoUrl().isEmpty()) { %>
            <img src="<%= request.getContextPath() %>/<%= usuario.getFotoUrl() %>" alt="<%= usuario.getApelido() %>">
            <% } else { %>
            <div class="profile-placeholder">JG</div>
            <% } %>
        </div>

        <div class="profile-info">
            <h1><%= usuario.getApelido() != null ? usuario.getApelido() : usuario.getNome() %></h1>
            <p><strong>Nome:</strong> <%= usuario.getNome() %></p>
            <p><strong>Email:</strong> <%= usuario.getEmail() %></p>

            <form action="<%= request.getContextPath() %>/minha-conta/foto" method="post" class="avatar-form">
                <label>Alterar foto de perfil</label>

                <select name="fotoUrl" required>
                    <option value="">Escolha um avatar</option>
                    <option value="img/avatar1.png">Avatar 1</option>
                    <option value="img/avatar2.png">Avatar 2</option>
                    <option value="img/avatar3.png">Avatar 3</option>
                </select>

                <button type="submit" class="btn-cadastro btn-comprar">
                    Salvar Foto
                </button>
            </form>
        </div>
    </div>

    <h2 class="section-title">Minha Biblioteca</h2>

    <div class="jogos">
        <%
            if (jogos != null && !jogos.isEmpty()) {
                for (Jogo j : jogos) {
        %>
        <div class="card">
            <a href="<%= request.getContextPath() %>/jogos/detalhes?id=<%= j.getId() %>" class="card-link">
                <% if (j.getUrlImagem() != null && !j.getUrlImagem().isEmpty()) { %>
                <img src="<%= request.getContextPath() %>/<%= j.getUrlImagem() %>" alt="<%= j.getTitulo() %>">
                <% } %>

                <div class="card-content">
                    <h3><%= j.getTitulo() %></h3>
                    <p><%= j.getDescricao() %></p>
                    <p class="preco">Adquirido</p>
                </div>
            </a>
        </div>
        <%
            }
        } else {
        %>
        <p class="empty-message">Você ainda não possui jogos na biblioteca.</p>
        <%
            }
        %>
    </div>

    <% } else { %>
    <p class="empty-message">Usuário não encontrado.</p>
    <% } %>

</div>

</body>
</html>