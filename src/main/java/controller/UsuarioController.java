package controller;

import dao.UsuarioDAO;
import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    @GetMapping("/cadastro")
    public String abrirCadastro() {
        return "cadastro-usuario";
    }

    @PostMapping("/salvar")
    public String salvar(Usuario usuario) {
        usuario.setPerfil("cliente");

        usuarioDAO.cadastrarCliente(usuario);

        return "redirect:/login";
    }
}