<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>

<%
    Categoria catEdicao = (Categoria) request.getAttribute("categoria");
%>

<html>
<head>
    <title>Gerenciar Categorias - JpGames</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="header">
    <a href="<%= request.getContextPath() %>/home" class="logo">JpGames</a>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/home">Loja</a>
        <a href="<%= request.getContextPath() %>/jogos">Jogos</a>
        <a href="<%= request.getContextPath() %>/carrinho">Carrinho</a>
    </div>
</div>

<div class="container">

    <div class="hero">
        <h1>Gerenciamento de Categorias</h1>
        <p>Cadastre, edite e organize os gêneros usados no catálogo da loja.</p>
    </div>

    <div class="form-card form-large">
        <h2><%= catEdicao != null ? "Editar Categoria" : "Nova Categoria" %></h2>

        <form action="<%= request.getContextPath() %>/categorias/salvar" method="post">
            <input type="hidden" name="id" value="<%= catEdicao != null ? catEdicao.getId() : 0 %>">

            <label>Nome da Categoria</label>
            <input type="text" name="nome" placeholder="Ex: RPG, Ação..."
                   value="<%= catEdicao != null ? catEdicao.getNome() : "" %>" required>

            <div class="cart-actions">
                <button type="submit" class="btn-cadastro btn-comprar">
                    <%= catEdicao != null ? "Atualizar" : "Salvar" %>
                </button>

                <% if (catEdicao != null) { %>
                <a href="<%= request.getContextPath() %>/categorias" class="btn-cadastro btn-carrinho">
                    Cancelar Edição
                </a>
                <% } %>
            </div>
        </form>
    </div>

    <h2 class="section-title">Categorias Cadastradas</h2>

    <div class="cart-box">
        <table class="cart-table">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>

            <%
                List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");

                if (categorias != null && !categorias.isEmpty()) {
                    for (Categoria c : categorias) {
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getNome() %></td>
                <td class="acoes">
                    <a href="<%= request.getContextPath() %>/categorias/editar?id=<%= c.getId() %>">Editar</a>

                    <a href="<%= request.getContextPath() %>/categorias/deletar?id=<%= c.getId() %>"
                       class="excluir"
                       onclick="return confirm('Tem certeza? Se houver jogos vinculados a esta categoria, o banco bloqueará a exclusão.');">
                        Excluir
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="3">Nenhuma categoria cadastrada.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

    <div class="cart-actions">
        <a href="<%= request.getContextPath() %>/home" class="btn-cadastro btn-carrinho">
            Voltar para a loja
        </a>
    </div>

</div>

</body>
</html>