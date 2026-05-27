package controller;

import dao.JogoDAO;
import model.Jogo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    private JogoDAO jogoDAO = new JogoDAO();

    @GetMapping({"/", "/home"})
    public String index(Model model) {
        List<Jogo> jogos = jogoDAO.listarTodos();

        model.addAttribute("jogos", jogos);
        return "index";
    }
}