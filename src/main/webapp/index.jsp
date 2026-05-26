<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Jogo" %>

<html>
<head>
    <title>JpGames - Loja de Jogos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #333; }
        .btn-cadastro { background-color: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; }
        .jogos { display: flex; gap: 20px; flex-wrap: wrap; margin-top: 30px; }
        .card { border: 1px solid #ccc; padding: 15px; width: 230px; border-radius: 6px; }
        .card img { width: 100%; height: 130px; object-fit: cover; margin-bottom: 10px; }
        .preco { font-weight: bold; }
        .acoes a { text-decoration: none; color: #007bff; margin-right: 10px; }
        .acoes a.excluir { color: red; }
    </style>
</head>
<body>

<h1>Bem-vindo à JpGames!</h1>
<p>A tua loja de confiança para os melhores títulos.</p>

<br>
<a href="<%= request.getContextPath() %>/jogos" class="btn-cadastro">Cadastrar Novo Jogo</a>

<a href="<%= request.getContextPath() %>/categorias" class="btn-cadastro" style="background-color: #28a745;">
    Gerenciar Categorias
</a>

<h2>Jogos Disponíveis</h2>

<div class="jogos">
    <%
        List<Jogo> jogos = (List<Jogo>) request.getAttribute("jogos");

        if (jogos != null && !jogos.isEmpty()) {
            for (Jogo j : jogos) {
    %>
    <div class="card">
        <%
            if (j.getUrlImagem() != null && !j.getUrlImagem().isEmpty()) {
        %>
        <img src="<%= request.getContextPath() %>/<%= j.getUrlImagem() %>" alt="<%= j.getTitulo() %>">
        <%
            }
        %>

        <h3><%= j.getTitulo() %></h3>
        <p><%= j.getDescricao() %></p>
        <p class="preco">R$ <%= j.getPreco() %></p>

        <div class="acoes">
            <br>
            <a href="<%= request.getContextPath() %>/jogos/editar?id=<%= j.getId() %>">Editar</a>
            <a href="<%= request.getContextPath() %>/jogos/deletar?id=<%= j.getId() %>" class="excluir" onclick="return confirm('Tem certeza que deseja excluir este jogo?');">Excluir</a>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p>Nenhum jogo cadastrado.</p>
    <%
        }
    %>
</div>

</body>
</html>