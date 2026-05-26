<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>

<html>
<head>
    <title>Cadastrar Jogo</title>
</head>
<body>
<h2>Cadastro de Novo Jogo</h2>

<form action="<%= request.getContextPath() %>/jogos/salvar" method="post">
    <input type="text" name="titulo" placeholder="Título do Jogo" required><br><br>

    <textarea name="descricao" placeholder="Descrição"></textarea><br><br>

    <input type="number" step="0.01" name="preco" placeholder="Preço" required><br><br>

    <select name="categoriaId" required>
        <option value="">Selecione uma categoria</option>
        <%
            List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
            if (categorias != null) {
                for (Categoria c : categorias) {
        %>
        <option value="<%= c.getId() %>"><%= c.getNome() %></option>
        <%
                }
            }
        %>
    </select><br><br>

    <input type="text" name="urlImagem" placeholder="URL da Imagem"><br><br>

    <button type="submit">Salvar Jogo</button>
</form>

<br>
<a href="<%= request.getContextPath() %>/home">Voltar para início</a>
</body>
</html>