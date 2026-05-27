<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Checkout - JpGames</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="header">
  <a href="<%= request.getContextPath() %>/home" class="logo">JpGames</a>

  <div class="nav">
    <a href="<%= request.getContextPath() %>/home">Loja</a>
    <a href="<%= request.getContextPath() %>/carrinho">Carrinho</a>
  </div>
</div>

<div class="container">

  <div class="hero">
    <h1>Compra Finalizada</h1>
    <p>Obrigado por comprar na JpGames. O teu pedido foi processado com sucesso.</p>
  </div>

  <div class="checkout-box">
    <h2 class="section-title">Resumo da Compra</h2>

    <p>Pedido confirmado e carrinho finalizado.</p>

    <p class="checkout-total">
      Total da compra: R$ <%= request.getAttribute("total") %>
    </p>

    <div class="cart-actions">
      <a href="<%= request.getContextPath() %>/home" class="btn-cadastro btn-carrinho">
        Voltar para a loja
      </a>

      <a href="<%= request.getContextPath() %>/carrinho" class="btn-cadastro btn-admin">
        Ver Carrinho
      </a>
    </div>
  </div>

</div>

</body>
</html>