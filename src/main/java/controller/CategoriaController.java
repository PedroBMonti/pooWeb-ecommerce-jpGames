package controller;

import dao.CategoriaDAO;
import model.Categoria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/categorias")
public class CategoriaController {

    private CategoriaDAO categoriaDAO = new CategoriaDAO();

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("categorias", categoriaDAO.listarTodas());
        return "categorias";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam("id") int id, Model model) {
        Categoria categoria = categoriaDAO.buscarPorId(id);

        model.addAttribute("categoria", categoria);
        model.addAttribute("categorias", categoriaDAO.listarTodas());

        return "categorias";
    }

    @GetMapping("/deletar")
    public String deletar(@RequestParam("id") int id) {
        categoriaDAO.deletar(id);
        return "redirect:/categorias";
    }

    @PostMapping("/salvar")
    public String salvar(@RequestParam(value = "id", defaultValue = "0") int id,
                         @RequestParam("nome") String nome) {

        Categoria categoria = new Categoria(id, nome);

        if (id > 0) {
            categoriaDAO.atualizar(categoria);
        } else {
            categoriaDAO.cadastrar(categoria);
        }

        return "redirect:/categorias";
    }
}