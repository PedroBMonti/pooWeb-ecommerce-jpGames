<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Jogo" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Carrinho - JpGames</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="header">
    <a href="<%= request.getContextPath() %>/home" class="logo">JpGames</a>

    <div class="nav">
        <a href="<%= request.getContextPath() %>/home">Loja</a>
        <a href="<%= request.getContextPath() %>/login">Login</a>
    </div>
</div>

<div class="container">

    <div class="hero">
        <h1>Seu Carrinho</h1>
        <p>Confira os jogos escolhidos antes de finalizar a compra.</p>
    </div>

    <div class="cart-box">
        <%
            List<Jogo> carrinho = (List<Jogo>) request.getAttribute("carrinho");
            Double total = (Double) request.getAttribute("total");

            if (carrinho != null && !carrinho.isEmpty()) {
        %>

        <table class="cart-table">
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
                    <a class="remover" href="<%= request.getContextPath() %>/carrinho/remover?id=<%= j.getId() %>">
                        Remover
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

        <p class="cart-total">Total: R$ <%= total %></p>

        <div class="cart-actions">
            <a href="<%= request.getContextPath() %>/carrinho/finalizar" class="btn-cadastro btn-comprar">
                Finalizar Compra
            </a>

            <a href="<%= request.getContextPath() %>/home" class="btn-cadastro btn-carrinho">
                Continuar Comprando
            </a>
        </div>

        <%
        } else {
        %>
        <p class="empty-message">Seu carrinho está vazio.</p>

        <div class="cart-actions">
            <a href="<%= request.getContextPath() %>/home" class="btn-cadastro btn-carrinho">
                Voltar para a loja
            </a>
        </div>
        <%
            }
        %>
    </div>

</div>

</body>
</html>