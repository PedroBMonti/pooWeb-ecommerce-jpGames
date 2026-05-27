package controller;

import dao.UsuarioDAO;
import jakarta.servlet.http.HttpSession;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    @GetMapping("/login")
    public String abrirLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("senha") String senha,
                        HttpSession session,
                        Model model) {

        Usuario usuario = usuarioDAO.autenticar(email, senha);

        if (usuario != null) {
            session.setAttribute("usuarioLogado", usuario);
            return "redirect:/home";
        }

        model.addAttribute("erro", "Email ou senha inválidos");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }
}