package dao;

import model.Categoria;
import model.Jogo;
import java.util.List;

public class TesteBanco {
    public static void main(String[] args) {
        System.out.println("Iniciando teste de conexão...");

        try {
            // 1. Testando o CategoriaDAO
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            List<Categoria> categorias = categoriaDAO.listarTodas();
            System.out.println("Sucesso! Categorias encontradas no banco: " + categorias.size());
            for (Categoria c : categorias) {
                System.out.println("- " + c.getNome());
            }

            // 2. Testando o JogoDAO
            JogoDAO jogoDAO = new JogoDAO();
            Jogo novoJogo = new Jogo(
                    0, // O ID é gerado automaticamente pelo banco
                    "Helldivers 2",
                    "Jogo de tiro cooperativo focado em espalhar a democracia gerenciada.",
                    199.90,
                    1, // 1 = Ação (ID da categoria)
                    "https://imagem-ficticia.com/helldivers2.jpg"
            );

            jogoDAO.cadastrar(novoJogo);
            System.out.println("\nSucesso! Helldivers 2 foi salvo no PostgreSQL com sucesso!");

        } catch (Exception e) {
            System.err.println("\nOps! Ocorreu um erro durante o teste:");
            e.printStackTrace();
        }
    }
}