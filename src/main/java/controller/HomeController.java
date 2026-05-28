package controller;

import dao.BibliotecaDAO;
import dao.CategoriaDAO;
import dao.JogoDAO;
import jakarta.servlet.http.HttpSession;
import model.Categoria;
import model.Jogo;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    private JogoDAO jogoDAO = new JogoDAO();
    private CategoriaDAO categoriaDAO = new CategoriaDAO();
    private BibliotecaDAO bibliotecaDAO = new BibliotecaDAO();

    @GetMapping({"/", "/home"})
    public String index(@RequestParam(value = "categoriaId", required = false) Integer categoriaId,
                        Model model,
                        HttpSession session) {

        List<Jogo> jogos;

        if (categoriaId != null && categoriaId > 0) {
            jogos = jogoDAO.listarPorCategoria(categoriaId);
        } else {
            jogos = jogoDAO.listarTodos();
        }

        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        List<Integer> jogosComprados = new ArrayList<>();

        if (usuario != null) {
            jogosComprados = bibliotecaDAO.listarIdsJogosDoUsuario(usuario.getId());
        }

        List<Categoria> categorias = categoriaDAO.listarTodas();

        model.addAttribute("jogos", jogos);
        model.addAttribute("jogosComprados", jogosComprados);
        model.addAttribute("categorias", categorias);
        model.addAttribute("categoriaSelecionada", categoriaId);

        return "index";
    }
}