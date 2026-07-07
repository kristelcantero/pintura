package com.kristel.pinturas.controladores;

import com.kristel.pinturas.modelos.LoginUsuario;
import com.kristel.pinturas.modelos.Usuario;
import com.kristel.pinturas.servicios.ServicioUsuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {

    @Autowired
    private ServicioUsuarios sUsuarios;

    @GetMapping("/")
    public String inicio(HttpSession session) {
        if (session.getAttribute("usuarioEnSesion") != null) {
            return "redirect:/pinturas";
        }
        return "redirect:/login";
    }

    @GetMapping("/registro")
    public String registroForm(@ModelAttribute("nuevoUsuario") Usuario nuevoUsuario, HttpSession session) {
        if (session.getAttribute("usuarioEnSesion") != null) {
            return "redirect:/pinturas";
        }
        return "index.jsp";
    }

    @PostMapping("/registro")
    public String registro(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
                           BindingResult result,
                           HttpSession session) {

        sUsuarios.registrar(nuevoUsuario, result);

        if (result.hasErrors()) {
            return "index.jsp";
        } else {
            // Registro exitoso -> crear sesión
            session.setAttribute("usuarioEnSesion", nuevoUsuario);
            return "redirect:/pinturas";
        }
    }

    @GetMapping("/login")
    public String login(@ModelAttribute("loginUsuario") LoginUsuario loginUsuario, HttpSession session) {
        if (session.getAttribute("usuarioEnSesion") != null) {
            return "redirect:/pinturas";
        }
        return "login.jsp";
    }

    @PostMapping("/iniciarSesion")
    public String iniciarSesion(@Valid @ModelAttribute("loginUsuario") LoginUsuario loginUsuario,
                                BindingResult result,
                                HttpSession session) {

        Usuario usuario = sUsuarios.login(loginUsuario, result);

        if (result.hasErrors()) {
            return "login.jsp";
        } else {
            // Login exitoso -> crear sesión
            session.setAttribute("usuarioEnSesion", usuario);
            return "redirect:/pinturas";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

}