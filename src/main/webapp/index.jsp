<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Jogo" %>
<%@ page import="model.Usuario" %>
<%@ page import="model.Categoria" %>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
    boolean admin = usuarioLogado != null && "admin".equals(usuarioLogado.getPerfil());
    List<Integer> jogosComprados = (List<Integer>) request.getAttribute("jogosComprados");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>JpGames - Loja de Jogos</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="header">
    <a href="<%= request.getContextPath() %>/home" class="logo">JpGames</a>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/carrinho">Carrinho</a>

        <% if (usuarioLogado != null) { %>
        <span>Logado como: <span class="admin-label"><%= usuarioLogado.getNome() %></span></span>
        <a href="<%= request.getContextPath() %>/minha-conta">Minha Conta</a>
        <a href="<%= request.getContextPath() %>/logout">Sair</a>
        <% } else { %>
        <a href="<%= request.getContextPath() %>/login">Login</a>
        <% } %>
    </div>
</div>

<div class="container">

    <div class="hero">
        <h1>Bem-vindo à JpGames!</h1>
        <p>A tua loja de confiança para os melhores títulos.</p>
    </div>

    <div class="actions">
        <a href="<%= request.getContextPath() %>/carrinho" class="btn-cadastro btn-carrinho">Ver Carrinho</a>

        <% if (admin) { %>
        <a href="<%= request.getContextPath() %>/jogos" class="btn-cadastro btn-admin">Cadastrar Novo Jogo</a>

        <a href="<%= request.getContextPath() %>/categorias" class="btn-cadastro btn-categoria">
            Gerenciar Categorias
        </a>
        <% } %>
    </div>

    <div class="filter-box">
        <form action="<%= request.getContextPath() %>/home" method="get">
            <label>Filtrar por gênero</label>

            <select name="categoriaId">
                <option value="">Todos os gêneros</option>

                <%
                    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
                    Integer categoriaSelecionada = (Integer) request.getAttribute("categoriaSelecionada");

                    if (categorias != null) {
                        for (Categoria c : categorias) {
                            boolean selecionada = categoriaSelecionada != null && categoriaSelecionada == c.getId();
                %>
                <option value="<%= c.getId() %>" <%= selecionada ? "selected" : "" %>>
                    <%= c.getNome() %>
                </option>
                <%
                        }
                    }
                %>
            </select>

            <button type="submit" class="btn-cadastro btn-comprar">Filtrar</button>

            <a href="<%= request.getContextPath() %>/home" class="btn-cadastro btn-admin">
                Limpar
            </a>
        </form>
    </div>

    <h2 class="section-title">Jogos Disponíveis</h2>

    <div class="jogos">
        <%
            List<Jogo> jogos = (List<Jogo>) request.getAttribute("jogos");

            if (jogos != null && !jogos.isEmpty()) {
                for (Jogo j : jogos) {
                    boolean comprado = jogosComprados != null && jogosComprados.contains(j.getId());
        %>
        <div class="card">

            <a href="<%= request.getContextPath() %>/jogos/detalhes?id=<%= j.getId() %>" class="card-link">
                <%
                    if (j.getUrlImagem() != null && !j.getUrlImagem().isEmpty()) {
                %>
                <img src="<%= request.getContextPath() %>/<%= j.getUrlImagem() %>" alt="<%= j.getTitulo() %>">
                <%
                    }
                %>

                <div class="card-content">
                    <h3><%= j.getTitulo() %></h3>
                    <p class="preco">R$ <%= j.getPreco() %></p>
                </div>
            </a>

            <div class="card-content">
                <% if (comprado) { %>
                <span class="badge-biblioteca">Na sua biblioteca</span>
                <% } else { %>
                <a href="<%= request.getContextPath() %>/carrinho/adicionar?id=<%= j.getId() %>" class="btn-cadastro btn-comprar">
                    Adicionar ao Carrinho
                </a>
                <% } %>

                <% if (admin) { %>
                <div class="acoes">
                    <a href="<%= request.getContextPath() %>/jogos/editar?id=<%= j.getId() %>">Editar</a>
                    <a href="<%= request.getContextPath() %>/jogos/deletar?id=<%= j.getId() %>" class="excluir" onclick="return confirm('Tem certeza que deseja excluir este jogo?');">Excluir</a>
                </div>
                <% } %>
            </div>

        </div>
        <%
            }
        } else {
        %>
        <p class="empty-message">Nenhum jogo cadastrado para este gênero.</p>
        <%
            }
        %>
    </div>

</div>

</body>
</html>