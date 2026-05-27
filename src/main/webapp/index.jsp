<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Jogo" %>
<%@ page import="model.Usuario" %>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
    boolean admin = usuarioLogado != null && "admin".equals(usuarioLogado.getPerfil());
%>

<html>
<head>
    <title>JpGames - Loja de Jogos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #333; }
        .btn-cadastro { background-color: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; margin-right: 10px; display: inline-block; margin-bottom: 10px; }
        .jogos { display: flex; gap: 20px; flex-wrap: wrap; margin-top: 30px; }
        .card { border: 1px solid #ccc; padding: 15px; width: 230px; border-radius: 6px; }
        .card img { width: 100%; height: 130px; object-fit: cover; margin-bottom: 10px; }
        .preco { font-weight: bold; }
        .acoes { margin-top: 15px; }
        .acoes a { text-decoration: none; color: #007bff; margin-right: 10px; }
        .acoes a.excluir { color: red; }
        .btn-carrinho { background-color: #6c757d; }
        .btn-comprar { background-color: #17a2b8; padding: 8px 12px; font-size: 14px; }
    </style>
</head>
<body>

<h1>Bem-vindo à JpGames!</h1>
<p>A tua loja de confiança para os melhores títulos.</p>

<br>

<% if (usuarioLogado != null) { %>
<p>Logado como: <%= usuarioLogado.getNome() %></p>
<a href="<%= request.getContextPath() %>/logout" class="btn-cadastro" style="background-color: #dc3545;">Sair</a>
<% } else { %>
<a href="<%= request.getContextPath() %>/login" class="btn-cadastro">Login</a>
<% } %>

<a href="<%= request.getContextPath() %>/carrinho" class="btn-cadastro btn-carrinho">Ver Carrinho</a>

<% if (admin) { %>
<a href="<%= request.getContextPath() %>/jogos" class="btn-cadastro">Cadastrar Novo Jogo</a>

<a href="<%= request.getContextPath() %>/categorias" class="btn-cadastro" style="background-color: #28a745;">
    Gerenciar Categorias
</a>
<% } %>

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

        <a href="<%= request.getContextPath() %>/carrinho/adicionar?id=<%= j.getId() %>" class="btn-cadastro btn-comprar">
            Adicionar ao Carrinho
        </a>

        <% if (admin) { %>
        <div class="acoes">
            <a href="<%= request.getContextPath() %>/jogos/editar?id=<%= j.getId() %>">Editar</a>
            <a href="<%= request.getContextPath() %>/jogos/deletar?id=<%= j.getId() %>" class="excluir" onclick="return confirm('Tem certeza que deseja excluir este jogo?');">Excluir</a>
        </div>
        <% } %>
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