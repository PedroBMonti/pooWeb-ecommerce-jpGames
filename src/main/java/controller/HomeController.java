package controller;

import dao.BibliotecaDAO;
import dao.JogoDAO;
import jakarta.servlet.http.HttpSession;
import model.Jogo;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    private JogoDAO jogoDAO = new JogoDAO();
    private BibliotecaDAO bibliotecaDAO = new BibliotecaDAO();

    @GetMapping({"/", "/home"})
    public String index(Model model, HttpSession session) {
        List<Jogo> jogos = jogoDAO.listarTodos();

        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        List<Integer> jogosComprados = new ArrayList<>();

        if (usuario != null) {
            jogosComprados = bibliotecaDAO.listarIdsJogosDoUsuario(usuario.getId());
        }

        model.addAttribute("jogos", jogos);
        model.addAttribute("jogosComprados", jogosComprados);

        return "index";
    }
}