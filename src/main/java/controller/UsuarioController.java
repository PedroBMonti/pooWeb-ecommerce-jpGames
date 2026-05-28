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
    public String salvar(@RequestParam("nome") String nome,
                         @RequestParam("apelido") String apelido,
                         @RequestParam("email") String email,
                         @RequestParam("senha") String senha,
                         @RequestParam("fotoUrl") String fotoUrl) {

        Usuario usuario = new Usuario();
        usuario.setNome(nome);
        usuario.setApelido(apelido);
        usuario.setEmail(email);
        usuario.setSenha(senha);
        usuario.setFotoUrl(fotoUrl);
        usuario.setPerfil("cliente");

        usuarioDAO.cadastrarCliente(usuario);

        return "redirect:/login";
    }
}