package controller;

import dao.BibliotecaDAO;
import dao.CategoriaDAO;
import dao.JogoDAO;
import jakarta.servlet.http.HttpSession;
import model.Jogo;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/jogos")
public class JogoController {

    private JogoDAO jogoDAO = new JogoDAO();
    private CategoriaDAO categoriaDAO = new CategoriaDAO();
    private BibliotecaDAO bibliotecaDAO = new BibliotecaDAO();

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

        if (jogo == null) {
            return "redirect:/home";
        }

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

    @GetMapping("/detalhes")
    public String detalhes(@RequestParam("id") int id, Model model, HttpSession session) {
        Jogo jogo = jogoDAO.buscarPorId(id);

        if (jogo == null) {
            return "redirect:/home";
        }

        boolean comprado = false;
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario != null) {
            comprado = bibliotecaDAO.usuarioPossuiJogo(usuario.getId(), jogo.getId());
        }

        List<Jogo> similares = jogoDAO.buscarPorCategoria(jogo.getCategoriaId(), jogo.getId());

        model.addAttribute("jogo", jogo);
        model.addAttribute("similares", similares);
        model.addAttribute("comprado", comprado);

        return "detalhes";
    }

    @PostMapping("/salvar")
    public String salvarJogo(Jogo jogo, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        if (jogo.getId() > 0) {
            jogoDAO.atualizar(jogo);
        } else {
            jogoDAO.cadastrar(jogo);
        }

        return "redirect:/home";
    }
}