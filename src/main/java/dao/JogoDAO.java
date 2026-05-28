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
        jogo.setDesenvolvedora(rs.getString("desenvolvedora"));
        jogo.setRequisitosMinimos(rs.getString("requisitos_minimos"));
        jogo.setRequisitosRecomendados(rs.getString("requisitos_recomendados"));
        return jogo;
    }

    public void cadastrar(Jogo jogo) {
        String sql = "INSERT INTO jogo (titulo, descricao, preco, categoria_id, url_imagem, desenvolvedora, requisitos_minimos, requisitos_recomendados) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, jogo.getTitulo());
            stmt.setString(2, jogo.getDescricao());
            stmt.setDouble(3, jogo.getPreco());
            stmt.setInt(4, jogo.getCategoriaId());
            stmt.setString(5, jogo.getUrlImagem());
            stmt.setString(6, jogo.getDesenvolvedora());
            stmt.setString(7, jogo.getRequisitosMinimos());
            stmt.setString(8, jogo.getRequisitosRecomendados());

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

    public Jogo buscarPorId(int id) {
        String sql = "SELECT * FROM jogo WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return map(rs);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar jogo: " + e.getMessage(), e);
        }

        return null;
    }

    public List<Jogo> buscarPorCategoria(int categoriaId, int idJogoAtual) {
        List<Jogo> jogos = new ArrayList<>();
        String sql = "SELECT * FROM jogo WHERE categoria_id = ? AND id <> ? ORDER BY id LIMIT 4";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, categoriaId);
            stmt.setInt(2, idJogoAtual);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                jogos.add(map(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar jogos similares: " + e.getMessage(), e);
        }

        return jogos;
    }

    public void atualizar(Jogo jogo) {
        String sql = "UPDATE jogo SET titulo = ?, descricao = ?, preco = ?, categoria_id = ?, url_imagem = ?, desenvolvedora = ?, requisitos_minimos = ?, requisitos_recomendados = ? WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, jogo.getTitulo());
            stmt.setString(2, jogo.getDescricao());
            stmt.setDouble(3, jogo.getPreco());
            stmt.setInt(4, jogo.getCategoriaId());
            stmt.setString(5, jogo.getUrlImagem());
            stmt.setString(6, jogo.getDesenvolvedora());
            stmt.setString(7, jogo.getRequisitosMinimos());
            stmt.setString(8, jogo.getRequisitosRecomendados());
            stmt.setInt(9, jogo.getId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar jogo: " + e.getMessage(), e);
        }
    }

    public void deletar(int id) {
        String sql = "DELETE FROM jogo WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao deletar jogo: " + e.getMessage(), e);
        }
    }
}