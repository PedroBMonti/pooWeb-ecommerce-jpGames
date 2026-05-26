package controller;

import dao.CategoriaDAO;
import dao.JogoDAO;
import model.Jogo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/jogos")
public class JogoController {

    private JogoDAO jogoDAO = new JogoDAO();
    private CategoriaDAO categoriaDAO = new CategoriaDAO(); // Confirma se tens este DAO criado

    @GetMapping
    public String abrirCadastro(Model model) {
        model.addAttribute("categorias", categoriaDAO.listarTodas());
        return "cadastro";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam("id") int id, Model model) {
        Jogo jogo = jogoDAO.buscarPorId(id);

        model.addAttribute("jogo", jogo);
        model.addAttribute("categorias", categoriaDAO.listarTodas());

        return "cadastro";
    }

    @GetMapping("/deletar")
    public String deletar(@RequestParam("id") int id) {
        jogoDAO.deletar(id);
        return "redirect:/home";
    }

    @PostMapping("/salvar")
    public String salvarJogo(@RequestParam(value = "id", defaultValue = "0") int id,
                             @RequestParam("titulo") String titulo,
                             @RequestParam("descricao") String descricao,
                             @RequestParam("preco") double preco,
                             @RequestParam("categoriaId") int categoriaId,
                             @RequestParam("urlImagem") String urlImagem) {

        Jogo jogo = new Jogo(id, titulo, descricao, preco, categoriaId, urlImagem);

        if (id > 0) {
            jogoDAO.atualizar(jogo);
        } else {
            jogoDAO.cadastrar(jogo);
        }

        return "redirect:/home";
    }
}