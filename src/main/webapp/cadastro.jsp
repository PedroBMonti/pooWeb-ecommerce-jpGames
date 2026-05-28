<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<%@ page import="model.Jogo" %>

<%
    Jogo jogoEdicao = (Jogo) request.getAttribute("jogo");
%>

<html>
<head>
    <title><%= jogoEdicao != null ? "Editar Jogo" : "Cadastrar Novo Jogo" %> - JpGames</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="header">
    <a href="<%= request.getContextPath() %>/home" class="logo">JpGames</a>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/home">Loja</a>
        <a href="<%= request.getContextPath() %>/carrinho">Carrinho</a>
        <a href="<%= request.getContextPath() %>/categorias">Categorias</a>
    </div>
</div>

<div class="container">

    <div class="hero">
        <h1><%= jogoEdicao != null ? "Editar Jogo" : "Cadastrar Novo Jogo" %></h1>
        <p>Gerencie as informações do catálogo da JpGames.</p>
    </div>

    <div class="form-card form-large">
        <form action="<%= request.getContextPath() %>/jogos/salvar" method="post">

            <input type="hidden" name="id" value="<%= jogoEdicao != null ? jogoEdicao.getId() : 0 %>">

            <label>Título</label>
            <input type="text" name="titulo" placeholder="Título do jogo"
                   value="<%= jogoEdicao != null ? jogoEdicao.getTitulo() : "" %>" required>

            <label>Descrição</label>
            <textarea name="descricao" placeholder="Descrição do jogo" rows="5" required><%= jogoEdicao != null ? jogoEdicao.getDescricao() : "" %></textarea>

            <label>Preço</label>
            <input type="number" step="0.01" name="preco" placeholder="Preço"
                   value="<%= jogoEdicao != null ? jogoEdicao.getPreco() : "" %>" required>

            <label>URL da Imagem</label>
            <input type="text" name="urlImagem" placeholder="Ex: img/nome.png"
                   value="<%= jogoEdicao != null ? jogoEdicao.getUrlImagem() : "" %>" required>

            <label>Categoria</label>
            <select name="categoriaId" required>
                <option value="">Selecione uma categoria</option>
                <%
                    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
                    if (categorias != null) {
                        for (Categoria c : categorias) {
                            boolean selecionado = jogoEdicao != null && jogoEdicao.getCategoriaId() == c.getId();
                %>
                <option value="<%= c.getId() %>" <%= selecionado ? "selected" : "" %>>
                    <%= c.getNome() %>
                </option>
                <%
                        }
                    }
                %>
            </select>

            <div class="cart-actions">
                <button type="submit" class="btn-cadastro btn-comprar">
                    <%= jogoEdicao != null ? "Atualizar Jogo" : "Salvar Jogo" %>
                </button>

                <a href="<%= request.getContextPath() %>/home" class="btn-cadastro btn-carrinho">
                    Voltar para a loja
                </a>
            </div>
        </form>
    </div>

</div>

</body>
</html>