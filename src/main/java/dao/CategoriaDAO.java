package dao;

import model.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    private Categoria map(ResultSet rs) throws SQLException {
        return new Categoria(
                rs.getInt("id"),
                rs.getString("nome")
        );
    }

    public void cadastrar(Categoria categoria) {
        String sql = "INSERT INTO categoria (nome) VALUES (?)";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoria.getNome());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao cadastrar categoria: " + e.getMessage(), e);
        }
    }

    public List<Categoria> listarTodas() {
        List<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT * FROM categoria ORDER BY nome";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                categorias.add(map(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar categorias: " + e.getMessage(), e);
        }

        return categorias;
    }

    public Categoria buscarPorId(int id) {
        String sql = "SELECT * FROM categoria WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return map(rs);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar categoria por ID: " + e.getMessage(), e);
        }

        return null;
    }

    public void atualizar(Categoria categoria) {
        String sql = "UPDATE categoria SET nome = ? WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoria.getNome());
            stmt.setInt(2, categoria.getId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar categoria: " + e.getMessage(), e);
        }
    }

    public void deletar(int id) {
        String sql = "DELETE FROM categoria WHERE id = ?";

        try (Connection conn = ConexaoDB.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            // Nota: Se a categoria estiver vinculada a algum jogo, o banco vai estourar um erro de chave estrangeira (Foreign Key Constraint).
            throw new RuntimeException("Erro ao deletar categoria: " + e.getMessage(), e);
        }
    }
}