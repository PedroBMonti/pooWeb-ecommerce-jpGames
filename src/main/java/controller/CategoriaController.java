package controller;

import dao.CategoriaDAO;
import jakarta.servlet.http.HttpSession;
import model.Categoria;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/categorias")
public class CategoriaController {

    private CategoriaDAO categoriaDAO = new CategoriaDAO();

    private boolean isAdmin(HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        return usuario != null && "admin".equals(usuario.getPerfil());
    }

    @GetMapping
    public String listar(Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        model.addAttribute("categorias", categoriaDAO.listarTodas());
        return "categorias";
    }

    @GetMapping("/editar")
    public String editar(@RequestParam("id") int id, Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        Categoria categoria = categoriaDAO.buscarPorId(id);

        if (categoria == null) {
            return "redirect:/categorias";
        }

        model.addAttribute("categoria", categoria);
        model.addAttribute("categorias", categoriaDAO.listarTodas());

        return "categorias";
    }

    @GetMapping("/deletar")
    public String deletar(@RequestParam("id") int id, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        categoriaDAO.deletar(id);
        return "redirect:/categorias";
    }

    @PostMapping("/salvar")
    public String salvar(@RequestParam(value = "id", defaultValue = "0") int id,
                         @RequestParam("nome") String nome,
                         HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        Categoria categoria = new Categoria(id, nome);

        if (id > 0) {
            categoriaDAO.atualizar(categoria);
        } else {
            categoriaDAO.cadastrar(categoria);
        }

        return "redirect:/categorias";
    }
}