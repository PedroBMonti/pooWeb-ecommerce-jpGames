<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastrar Jogo</title>
</head>
<body>
<h2>Cadastro de Novo Jogo</h2>

<form action="salvarJogo" method="POST">
    <input type="text" name="titulo" placeholder="Título do Jogo" required><br><br>
    <textarea name="descricao" placeholder="Descrição"></textarea><br><br>
    <input type="number" step="0.01" name="preco" placeholder="Preço" required><br><br>

    <select name="categoriaId">
        <option value="1">Ação</option>
        <option value="2">RPG</option>
        <option value="3">Esportes</option>
        <option value="4">FPS</option>
    </select><br><br>

    <input type="text" name="urlImagem" placeholder="URL da Imagem"><br><br>

    <button type="submit">Salvar Jogo</button>
</form>
</body>
</html>