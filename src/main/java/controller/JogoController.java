package controller;

import dao.CategoriaDAO;
import dao.JogoDAO;
import model.Jogo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/jogos")
public class JogoController {

    private JogoDAO jogoDAO = new JogoDAO();
    private CategoriaDAO categoriaDAO = new CategoriaDAO();

    @GetMapping
    public String abrirCadastro(Model model) {
        model.addAttribute("categorias", categoriaDAO.listarTodas());
        model.addAttribute("jogos", jogoDAO.listarTodos());
        return "cadastro";
    }

    @PostMapping("/salvar")
    public String salvarJogo(@RequestParam("titulo") String titulo,
                             @RequestParam("descricao") String descricao,
                             @RequestParam("preco") double preco,
                             @RequestParam("categoriaId") int categoriaId,
                             @RequestParam("urlImagem") String urlImagem) {

        Jogo novoJogo = new Jogo(0, titulo, descricao, preco, categoriaId, urlImagem);
        jogoDAO.cadastrar(novoJogo);

        return "redirect:/jogos";
    }
}