<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<%@ page import="model.Jogo" %>

<%
    Jogo jogoEdicao = (Jogo) request.getAttribute("jogo");
%>

<html>
<head>
    <title><%= jogoEdicao != null ? "Editar Jogo" : "Cadastrar Novo Jogo" %></title>
</head>
<body>

<h2><%= jogoEdicao != null ? "Editar Jogo" : "Cadastro de Novo Jogo" %></h2>

<form action="<%= request.getContextPath() %>/jogos/salvar" method="post">

    <input type="hidden" name="id" value="<%= jogoEdicao != null ? jogoEdicao.getId() : 0 %>">

    <label>Título:</label><br>
    <input type="text" name="titulo" placeholder="Título do Jogo"
           value="<%= jogoEdicao != null ? jogoEdicao.getTitulo() : "" %>" required><br><br>

    <label>Descrição:</label><br>
    <textarea name="descricao" placeholder="Descrição do Jogo" rows="4" cols="30"><%= jogoEdicao != null ? jogoEdicao.getDescricao() : "" %></textarea><br><br>

    <label>Preço:</label><br>
    <input type="number" step="0.01" name="preco" placeholder="Preço"
           value="<%= jogoEdicao != null ? jogoEdicao.getPreco() : "" %>" required><br><br>

    <label>URL da Imagem:</label><br>
    <input type="text" name="urlImagem" placeholder="Ex: img/nome.png"
           value="<%= jogoEdicao != null ? jogoEdicao.getUrlImagem() : "" %>" required><br><br>

    <label>Categoria:</label><br>
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
    </select><br><br>

    <button type="submit"><%= jogoEdicao != null ? "Atualizar Jogo" : "Salvar Jogo" %></button>
</form>

<br>
<a href="<%= request.getContextPath() %>/home">Voltar para a Página Inicial</a>

</body>
</html>