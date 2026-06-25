package controller;

import model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.UsuarioService;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    private UsuarioService usuarioService = new UsuarioService();

    @GetMapping("/cadastro")
    public String abrirCadastro() {
        return "cadastro-usuario";
    }

    @PostMapping("/salvar")
    public String salvar(Usuario usuario) {
        usuarioService.cadastrarCliente(usuario);

        return "redirect:/login";
    }
}