package service;

import dao.BibliotecaDAO;
import dao.JogoDAO;
import model.Jogo;
import model.Usuario;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CarrinhoService {

    private JogoDAO jogoDAO = new JogoDAO();
    private BibliotecaDAO bibliotecaDAO = new BibliotecaDAO();

    public void adicionarJogoNoCarrinho(int idJogo, List<Jogo> carrinho) {
        Jogo jogo = jogoDAO.buscarPorId(idJogo);

        if (jogo != null) {
            carrinho.add(jogo);
        }
    }

    public void removerJogoDoCarrinho(int idJogo, List<Jogo> carrinho) {
        Iterator<Jogo> it = carrinho.iterator();

        while (it.hasNext()) {
            Jogo j = it.next();

            if (j.getId() == idJogo) {
                it.remove();
                break;
            }
        }
    }

    public double calcularTotal(List<Jogo> carrinho) {
        double total = 0;

        for (Jogo j : carrinho) {
            total += j.getPreco();
        }

        return total;
    }

    public ResultadoFinalizacao finalizarCompra(Usuario usuario, List<Jogo> carrinho) {
        if (usuario == null) {
            return new ResultadoFinalizacao(false, true, "Usuário não está logado.", 0);
        }

        if (carrinho == null || carrinho.isEmpty()) {
            return new ResultadoFinalizacao(false, false, "Carrinho vazio.", 0);
        }

        List<Jogo> jogosParaComprar = new ArrayList<>();

        for (Jogo j : carrinho) {
            if (!bibliotecaDAO.usuarioPossuiJogo(usuario.getId(), j.getId())) {
                jogosParaComprar.add(j);
            }
        }

        if (jogosParaComprar.isEmpty()) {
            double totalCarrinho = calcularTotal(carrinho);

            return new ResultadoFinalizacao(
                    false,
                    false,
                    "Os jogos do carrinho já estão na sua biblioteca.",
                    totalCarrinho
            );
        }

        double totalCompra = 0;

        for (Jogo j : jogosParaComprar) {
            totalCompra += j.getPreco();
            bibliotecaDAO.adicionarJogo(usuario.getId(), j.getId());
        }

        return new ResultadoFinalizacao(true, false, null, totalCompra);
    }

    public static class ResultadoFinalizacao {
        private boolean finalizada;
        private boolean precisaLogin;
        private String mensagem;
        private double total;

        public ResultadoFinalizacao(boolean finalizada, boolean precisaLogin, String mensagem, double total) {
            this.finalizada = finalizada;
            this.precisaLogin = precisaLogin;
            this.mensagem = mensagem;
            this.total = total;
        }

        public boolean isFinalizada() {
            return finalizada;
        }

        public boolean isPrecisaLogin() {
            return precisaLogin;
        }

        public String getMensagem() {
            return mensagem;
        }

        public double getTotal() {
            return total;
        }
    }
}