package controller;

import dao.JogoDAO;
import model.Jogo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JogoController {

    private JogoDAO jogoDAO = new JogoDAO();

    @PostMapping("/salvarJogo")
    public String salvarJogo(
            @RequestParam String titulo,
            @RequestParam String descricao,
            @RequestParam double preco,
            @RequestParam int categoriaId,
            @RequestParam String urlImagem) {

        Jogo novoJogo = new Jogo(0, titulo, descricao, preco, categoriaId, urlImagem);
        jogoDAO.cadastrar(novoJogo);

        return "redirect:/index.jsp?sucesso=true";
    }
}