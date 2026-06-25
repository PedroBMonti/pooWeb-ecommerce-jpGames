package controller;

import jakarta.servlet.http.HttpSession;
import model.Jogo;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.CarrinhoService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/carrinho")
public class CarrinhoController {

    private CarrinhoService carrinhoService = new CarrinhoService();

    @GetMapping
    public String verCarrinho(HttpSession session, Model model) {
        List<Jogo> carrinho = getCarrinho(session);

        double total = carrinhoService.calcularTotal(carrinho);

        model.addAttribute("carrinho", carrinho);
        model.addAttribute("total", total);

        return "carrinho";
    }

    @GetMapping("/adicionar")
    public String adicionar(@RequestParam("id") int id, HttpSession session) {
        List<Jogo> carrinho = getCarrinho(session);

        carrinhoService.adicionarJogoNoCarrinho(id, carrinho);

        session.setAttribute("carrinho", carrinho);

        return "redirect:/home";
    }

    @GetMapping("/remover")
    public String remover(@RequestParam("id") int id, HttpSession session) {
        List<Jogo> carrinho = getCarrinho(session);

        carrinhoService.removerJogoDoCarrinho(id, carrinho);

        session.setAttribute("carrinho", carrinho);

        return "redirect:/carrinho";
    }

    @GetMapping("/finalizar")
    public String finalizar(HttpSession session, Model model) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        List<Jogo> carrinho = getCarrinho(session);

        CarrinhoService.ResultadoFinalizacao resultado =
                carrinhoService.finalizarCompra(usuario, carrinho);

        if (resultado.isPrecisaLogin()) {
            return "redirect:/login";
        }

        if (!resultado.isFinalizada()) {
            model.addAttribute("carrinho", carrinho);
            model.addAttribute("total", resultado.getTotal());
            model.addAttribute("erro", resultado.getMensagem());

            return "carrinho";
        }

        model.addAttribute("total", resultado.getTotal());
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