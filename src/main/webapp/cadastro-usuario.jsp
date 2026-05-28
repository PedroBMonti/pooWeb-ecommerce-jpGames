<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Criar Conta - JpGames</title>
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
        <h1>Criar Conta</h1>
        <p>Crie tua conta para comprar jogos e acessar tua biblioteca.</p>
    </div>

    <div class="form-card form-large">
        <form action="<%= request.getContextPath() %>/usuarios/salvar" method="post">

            <label>Nome</label>
            <input type="text" name="nome" placeholder="Seu nome completo" required>

            <label>Apelido</label>
            <input type="text" name="apelido" placeholder="Seu nick na JpGames" required>

            <label>Email</label>
            <input type="email" name="email" placeholder="seuemail@email.com" required>

            <label>Senha</label>
            <input type="password" name="senha" placeholder="Crie uma senha" required>

            <label>Foto de Perfil</label>
            <select name="fotoUrl" required>
                <option value="">Escolha um avatar</option>
                <option value="img/avatar1.png">Avatar 1</option>
                <option value="img/avatar2.png">Avatar 2</option>
                <option value="img/avatar3.png">Avatar 3</option>
            </select>

            <div class="cart-actions">
                <button type="submit" class="btn-cadastro btn-comprar">
                    Criar Conta
                </button>

                <a href="<%= request.getContextPath() %>/login" class="btn-cadastro btn-carrinho">
                    Já tenho conta
                </a>
            </div>
        </form>
    </div>

</div>

</body>
</html>