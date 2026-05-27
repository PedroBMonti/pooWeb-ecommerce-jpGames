<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Jogo" %>

<html>
<head>
    <title>Carrinho - JpGames</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { width: 70%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
        .btn { background-color: #007bff; color: white; padding: 8px 12px; text-decoration: none; border-radius: 5px; margin-right: 10px; }
        .remover { color: red; text-decoration: none; }
        .total { font-size: 20px; font-weight: bold; margin-top: 20px; }
    </style>
</head>
<body>

<h1>Seu Carrinho</h1>

<%
    List<Jogo> carrinho = (List<Jogo>) request.getAttribute("carrinho");
    Double total = (Double) request.getAttribute("total");

    if (carrinho != null && !carrinho.isEmpty()) {
%>

<table>
    <tr>
        <th>Jogo</th>
        <th>Preço</th>
        <th>Ação</th>
    </tr>

    <%
        for (Jogo j : carrinho) {
    %>
    <tr>
        <td><%= j.getTitulo() %></td>
        <td>R$ <%= j.getPreco() %></td>
        <td>
            <a class="remover" href="<%= request.getContextPath() %>/carrinho/remover?id=<%= j.getId() %>">Remover</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<p class="total">Total: R$ <%= total %></p>

<a href="<%= request.getContextPath() %>/carrinho/finalizar" class="btn">Finalizar Compra</a>

<%
} else {
%>
<p>Seu carrinho está vazio.</p>
<%
    }
%>

<br><br>
<a href="<%= request.getContextPath() %>/home" class="btn">Continuar Comprando</a>

</body>
</html>