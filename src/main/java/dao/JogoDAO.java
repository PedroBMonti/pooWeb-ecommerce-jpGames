package dao;

import model.Jogo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JogoDAO {

    private Jogo map(ResultSet rs) throws SQLException {
        Jogo jogo = new Jogo();
        jogo.setId(rs.getInt("id"));
        jogo.setTitulo(rs.getString("titulo"));
        jogo.setDescricao(rs.getString("descricao"));
        jogo.setPreco(rs.getDouble("preco"));
        jogo.setCategoriaId(rs.getInt("categoria_id"));
        jogo.setUrlImagem(rs.getString("url_imagem"));
        return jogo;
    }

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

    public List<Jogo> listarTodos() {
        List<Jogo> jogos = new ArrayList<>();
        String sql = "SELECT * FROM jogo ORDER BY id";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                jogos.add(map(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar jogos: " + e.getMessage(), e);
        }

        return jogos;
    }
}