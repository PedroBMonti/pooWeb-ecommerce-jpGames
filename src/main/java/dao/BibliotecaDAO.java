package dao;

import model.Jogo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BibliotecaDAO {

    public void adicionarJogo(int usuarioId, int jogoId) {
        String sql = "INSERT INTO biblioteca (usuario_id, jogo_id) VALUES (?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.setInt(2, jogoId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao adicionar jogo na biblioteca: " + e.getMessage(), e);
        }
    }

    public boolean usuarioPossuiJogo(int usuarioId, int jogoId) {
        String sql = "SELECT COUNT(*) FROM biblioteca WHERE usuario_id = ? AND jogo_id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.setInt(2, jogoId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao verificar biblioteca: " + e.getMessage(), e);
        }

        return false;
    }

    public List<Integer> listarIdsJogosDoUsuario(int usuarioId) {
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT jogo_id FROM biblioteca WHERE usuario_id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ids.add(rs.getInt("jogo_id"));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar jogos comprados: " + e.getMessage(), e);
        }

        return ids;
    }

    public List<Jogo> listarJogosDoUsuario(int usuarioId) {
        List<Jogo> jogos = new ArrayList<>();

        String sql = "SELECT j.* " +
                "FROM biblioteca b " +
                "INNER JOIN jogo j ON b.jogo_id = j.id " +
                "WHERE b.usuario_id = ? " +
                "ORDER BY b.data_compra DESC";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Jogo jogo = new Jogo();
                jogo.setId(rs.getInt("id"));
                jogo.setTitulo(rs.getString("titulo"));
                jogo.setDescricao(rs.getString("descricao"));
                jogo.setPreco(rs.getDouble("preco"));
                jogo.setCategoriaId(rs.getInt("categoria_id"));
                jogo.setUrlImagem(rs.getString("url_imagem"));
                jogo.setDesenvolvedora(rs.getString("desenvolvedora"));
                jogo.setRequisitosMinimos(rs.getString("requisitos_minimos"));
                jogo.setRequisitosRecomendados(rs.getString("requisitos_recomendados"));

                jogos.add(jogo);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar biblioteca do usuário: " + e.getMessage(), e);
        }

        return jogos;
    }
}