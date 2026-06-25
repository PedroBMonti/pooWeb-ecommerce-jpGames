package service;

import dao.UsuarioDAO;
import model.Usuario;

public class UsuarioService {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    public void cadastrarCliente(Usuario usuario) {
        usuario.setPerfil("cliente");

        usuarioDAO.cadastrarCliente(usuario);
    }
}