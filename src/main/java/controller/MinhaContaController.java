package controller;

import dao.BibliotecaDAO;
import jakarta.servlet.http.HttpSession;
import model.Jogo;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MinhaContaController {

    private BibliotecaDAO bibliotecaDAO = new BibliotecaDAO();

    @GetMapping("/minha-conta")
    public String minhaConta(HttpSession session, Model model) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
            return "redirect:/login";
        }

        List<Jogo> jogos = bibliotecaDAO.listarJogosDoUsuario(usuario.getId());

        model.addAttribute("usuario", usuario);
        model.addAttribute("jogos", jogos);

        return "minha-conta";
    }
}