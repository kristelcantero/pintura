package com.kristel.pinturas.servicios;

import com.kristel.pinturas.modelos.LoginUsuario;
import com.kristel.pinturas.modelos.Usuario;
import com.kristel.pinturas.repositorios.RepositorioUsuarios;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class ServicioUsuarios {

    @Autowired
    private RepositorioUsuarios repoUsuarios;

    public Usuario registrar(Usuario nuevoUsuario, BindingResult result) {
        String password = nuevoUsuario.getPassword();
        String confirmacion = nuevoUsuario.getConfirmacion();

        if (password != null && !password.equals(confirmacion)) {
            result.rejectValue("confirmacion", "Matches", "Las contraseñas no coinciden");
        }

        String email = nuevoUsuario.getEmail();
        if (email != null) {
            Usuario existeUsuario = repoUsuarios.findByEmail(email);
            if (existeUsuario != null) {
                result.rejectValue("email", "Unique", "Este correo ya se encuentra registrado");
            }
        }

        if (result.hasErrors()) {
            return null;
        } else {
            String passwordHasheado = BCrypt.hashpw(password, BCrypt.gensalt());
            nuevoUsuario.setPassword(passwordHasheado);
            return repoUsuarios.save(nuevoUsuario);
        }
    }

    public Usuario login(LoginUsuario datosInicioDeSesion, BindingResult result) {
        String email = datosInicioDeSesion.getEmailLogin();
        Usuario existeUsuario = repoUsuarios.findByEmail(email);

        if (existeUsuario == null) {
            result.rejectValue("emailLogin", "Unique", "Credenciales incorrectas");
        } else {
            String passwordLogin = datosInicioDeSesion.getPasswordLogin();
            if (passwordLogin == null || !BCrypt.checkpw(passwordLogin, existeUsuario.getPassword())) {
                result.rejectValue("passwordLogin", "Matches", "Credenciales incorrectas");
            }
        }

        if (result.hasErrors()) {
            return null;
        } else {
            return existeUsuario;
        }
    }

}
