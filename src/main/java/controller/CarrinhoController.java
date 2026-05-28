package controller;

import dao.BibliotecaDAO;
import dao.JogoDAO;
import jakarta.servlet.http.HttpSession;
import model.Jogo;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/carrinho")
public class CarrinhoController {

    private JogoDAO jogoDAO = new JogoDAO();
    private BibliotecaDAO bibliotecaDAO = new BibliotecaDAO();

    @GetMapping
    public String verCarrinho(HttpSession session, Model model) {
        List<Jogo> carrinho = getCarrinho(session);

        double total = 0;
        for (Jogo j : carrinho) {
            total += j.getPreco();
        }

        model.addAttribute("carrinho", carrinho);
        model.addAttribute("total", total);

        return "carrinho";
    }

    @GetMapping("/adicionar")
    public String adicionar(@RequestParam("id") int id, HttpSession session) {
        Jogo jogo = jogoDAO.buscarPorId(id);

        if (jogo != null) {
            List<Jogo> carrinho = getCarrinho(session);
            carrinho.add(jogo);
            session.setAttribute("carrinho", carrinho);
        }

        return "redirect:/home";
    }

    @GetMapping("/remover")
    public String remover(@RequestParam("id") int id, HttpSession session) {
        List<Jogo> carrinho = getCarrinho(session);

        Iterator<Jogo> it = carrinho.iterator();
        while (it.hasNext()) {
            Jogo j = it.next();

            if (j.getId() == id) {
                it.remove();
                break;
            }
        }

        session.setAttribute("carrinho", carrinho);

        return "redirect:/carrinho";
    }

    @GetMapping("/finalizar")
    public String finalizar(HttpSession session, Model model) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

        if (usuario == null) {
            return "redirect:/login";
        }

        List<Jogo> carrinho = getCarrinho(session);

        double total = 0;
        for (Jogo j : carrinho) {
            total += j.getPreco();
            bibliotecaDAO.adicionarJogo(usuario.getId(), j.getId());
        }

        model.addAttribute("total", total);
        session.removeAttribute("carrinho");

        return "checkout";
    }

    private List<Jogo> getCarrinho(HttpSession session) {
        List<Jogo> carrinho = (List<Jogo>) session.getAttribute("carrinho");

        if (carrinho == null) {
            carrinho = new ArrayList<>();
            session.setAttribute("carrinho", carrinho);
        }

        return carrinho;
    }
}