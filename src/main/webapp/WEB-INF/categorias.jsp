<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>

<%
    Categoria catEdicao = (Categoria) request.getAttribute("categoria");
%>

<html>
<head>
    <title>Gerenciar Categorias</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { width: 50%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
        .acoes a { margin-right: 10px; text-decoration: none; color: #007bff; }
        .acoes a.excluir { color: red; }
        .form-container { margin-bottom: 30px; padding: 15px; border: 1px solid #ddd; width: 50%; border-radius: 5px; }
    </style>
</head>
<body>

<h1>Gerenciamento de Categorias</h1>

<div class="form-container">
    <h2><%= catEdicao != null ? "Editar Categoria" : "Nova Categoria" %></h2>

    <form action="<%= request.getContextPath() %>/categorias/salvar" method="post">
        <input type="hidden" name="id" value="<%= catEdicao != null ? catEdicao.getId() : 0 %>">

        <label>Nome da Categoria:</label><br>
        <input type="text" name="nome" placeholder="Ex: RPG, Ação..."
               value="<%= catEdicao != null ? catEdicao.getNome() : "" %>" required>

        <button type="submit"><%= catEdicao != null ? "Atualizar" : "Salvar" %></button>

        <% if (catEdicao != null) { %>
        <a href="<%= request.getContextPath() %>/categorias" style="margin-left: 10px;">Cancelar Edição</a>
        <% } %>
    </form>
</div>

<hr>

<h2>Categorias Cadastradas</h2>
<table>
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
            <a href="<%= request.getContextPath() %>/categorias/deletar?id=<%= c.getId() %>" class="excluir"
               onclick="return confirm('Tem certeza? Se houver jogos vinculados a esta categoria, o banco bloqueará a exclusão!');">Excluir</a>
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

<br><br>
<a href="<%= request.getContextPath() %>/home">Voltar para a Página Inicial</a>

</body>
</html>