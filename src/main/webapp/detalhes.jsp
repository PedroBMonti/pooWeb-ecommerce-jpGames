<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Jogo" %>

<%
    Jogo jogo = (Jogo) request.getAttribute("jogo");
    List<Jogo> similares = (List<Jogo>) request.getAttribute("similares");
%>

<html>
<head>
    <title><%= jogo != null ? jogo.getTitulo() : "Detalhes do Jogo" %> - JpGames</title>
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

    <% if (jogo != null) { %>

    <div class="details-header-box">
        <div class="details-image">
            <% if (jogo.getUrlImagem() != null && !jogo.getUrlImagem().isEmpty()) { %>
            <img src="<%= request.getContextPath() %>/<%= jogo.getUrlImagem() %>" alt="<%= jogo.getTitulo() %>">
            <% } %>
        </div>

        <div class="details-title-area">
            <h1><%= jogo.getTitulo() %></h1>

            <p class="preco">R$ <%= jogo.getPreco() %></p>

            <p>
                <strong>Desenvolvedora:</strong>
                <%= jogo.getDesenvolvedora() != null ? jogo.getDesenvolvedora() : "Não informada" %>
            </p>

            <a href="<%= request.getContextPath() %>/carrinho/adicionar?id=<%= jogo.getId() %>" class="btn-cadastro btn-comprar">
                Adicionar ao Carrinho
            </a>
        </div>
    </div>

    <div class="game-summary-box">
        <h2>Resumo do Jogo</h2>
        <p><%= jogo.getDescricao() %></p>
    </div>

    <div class="requirements-box">
        <h2 class="section-title">Requisitos do Sistema</h2>

        <div class="requirements-grid">
            <div>
                <h3>Mínimos</h3>
                <p><%= jogo.getRequisitosMinimos() != null ? jogo.getRequisitosMinimos() : "Não informado" %></p>
            </div>

            <div>
                <h3>Recomendados</h3>
                <p><%= jogo.getRequisitosRecomendados() != null ? jogo.getRequisitosRecomendados() : "Não informado" %></p>
            </div>
        </div>
    </div>

    <h2 class="section-title">Jogos do Mesmo Gênero</h2>

    <div class="jogos">
        <%
            if (similares != null && !similares.isEmpty()) {
                for (Jogo s : similares) {
        %>
        <div class="card">
            <a href="<%= request.getContextPath() %>/jogos/detalhes?id=<%= s.getId() %>" class="card-link">
                <% if (s.getUrlImagem() != null && !s.getUrlImagem().isEmpty()) { %>
                <img src="<%= request.getContextPath() %>/<%= s.getUrlImagem() %>" alt="<%= s.getTitulo() %>">
                <% } %>

                <div class="card-content">
                    <h3><%= s.getTitulo() %></h3>
                    <p><%= s.getDescricao() %></p>
                    <p class="preco">R$ <%= s.getPreco() %></p>
                </div>
            </a>

            <div class="card-content">
                <a href="<%= request.getContextPath() %>/carrinho/adicionar?id=<%= s.getId() %>" class="btn-cadastro btn-comprar">
                    Adicionar ao Carrinho
                </a>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p class="empty-message">Nenhum jogo similar encontrado.</p>
        <%
            }
        %>
    </div>

    <% } else { %>
    <p class="empty-message">Jogo não encontrado.</p>
    <% } %>

    <div class="cart-actions">
        <a href="<%= request.getContextPath() %>/home" class="btn-cadastro btn-carrinho">
            Voltar para a loja
        </a>
    </div>

</div>

</body>
</html>