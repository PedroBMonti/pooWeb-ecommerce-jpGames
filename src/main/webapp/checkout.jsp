<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Checkout - JpGames</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 40px; }
    .box { border: 1px solid #ccc; padding: 20px; width: 400px; border-radius: 6px; }
    .btn { background-color: #007bff; color: white; padding: 8px 12px; text-decoration: none; border-radius: 5px; }
  </style>
</head>
<body>

<h1>Compra Finalizada</h1>

<div class="box">
  <p>Pedido processado com sucesso.</p>
  <p>Total da compra: R$ <%= request.getAttribute("total") %></p>
</div>

<br>
<a href="<%= request.getContextPath() %>/home" class="btn">Voltar para a loja</a>

</body>
</html>