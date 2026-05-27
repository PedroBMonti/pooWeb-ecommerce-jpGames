package controller;

import dao.CategoriaDAO;
import dao.JogoDAO;
import jakarta.servlet.http.HttpSession;
import model.Jogo;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/jogos")
public class JogoController {

    private JogoDAO jogoDAO = new JogoDAO();
    private CategoriaDAO categoriaDAO = new CategoriaDAO();

    private boolean isAdmin(HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        return usuario != null && "admin".equals(usuario.getPerfil());
    }

    @GetMapping
    public String abrirCadastro(Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        model.addAttribute("categorias", categoriaDAO.listarTodas());
        return "cadastro";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam("id") int id, Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        Jogo jogo = jogoDAO.buscarPorId(id);

        model.addAttribute("jogo", jogo);
        model.addAttribute("categorias", categoriaDAO.listarTodas());

        return "cadastro";
    }

    @GetMapping("/deletar")
    public String deletar(@RequestParam("id") int id, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        jogoDAO.deletar(id);
        return "redirect:/home";
    }

    @PostMapping("/salvar")
    public String salvarJogo(@RequestParam(value = "id", defaultValue = "0") int id,
                             @RequestParam("titulo") String titulo,
                             @RequestParam("descricao") String descricao,
                             @RequestParam("preco") double preco,
                             @RequestParam("categoriaId") int categoriaId,
                             @RequestParam("urlImagem") String urlImagem,
                             HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        Jogo jogo = new Jogo(id, titulo, descricao, preco, categoriaId, urlImagem);

        if (id > 0) {
            jogoDAO.atualizar(jogo);
        } else {
            jogoDAO.cadastrar(jogo);
        }

        return "redirect:/home";
    }
}