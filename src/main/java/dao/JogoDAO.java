package dao;

import model.Jogo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JogoDAO {

    public void cadastrar(Jogo jogo) {
        String sql = "INSERT INTO jogo (titulo, descricao, preco, categoria_id, url_imagem) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, jogo.getTitulo());
            stmt.setString(2, jogo.getDescricao());
            stmt.setDouble(3, jogo.getPreco());
            stmt.setInt(4, jogo.getCategoriaId());
            stmt.setString(5, jogo.getUrlImagem());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao cadastrar jogo: " + e.getMessage(), e);
        }
    }
}