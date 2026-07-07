package com.kristel.pinturas.controladores;
import java.util.List;

import com.kristel.pinturas.modelos.Pintura;
import com.kristel.pinturas.modelos.Usuario;
import com.kristel.pinturas.servicios.ServicioPinturas;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPinturas {

    @Autowired
    private ServicioPinturas servPinturas;

    // Listado de pinturas (A-Z)
    @GetMapping("/pinturas")
    public String pinturas(HttpSession session, Model model) {
        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        List<Pintura> pinturas = servPinturas.todasLasPinturas();
        model.addAttribute("pinturas", pinturas);

        return "pinturas.jsp";
    }

    @GetMapping("/nuevo")
    public String nuevo(@ModelAttribute("nuevaPintura") Pintura nuevaPintura, HttpSession session) {
        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }
        return "nuevo.jsp";
    }

    @PostMapping("/crear")
    public String crear(@Valid @ModelAttribute("nuevaPintura") Pintura nuevaPintura,
                        BindingResult result,
                        HttpSession session) {

        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        nuevaPintura.setCreador(usuarioEnSesion);

        servPinturas.guardarPintura(nuevaPintura, result);

        if (result.hasErrors()) {
            return "nuevo.jsp";
        } else {
            return "redirect:/pinturas";
        }
    }

    @GetMapping("/editar/{id}")
    public String editar(@PathVariable("id") Long id,
                         @ModelAttribute("pintura") Pintura pintura,
                         Model model,
                         HttpSession session) {

        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        Pintura pinturaAEditar = servPinturas.buscarPintura(id);
        if (pinturaAEditar == null) {
            return "redirect:/pinturas";
        }

        Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        if (!usuarioEnSesion.getId().equals(pinturaAEditar.getCreador().getId())) {
            return "redirect:/pinturas";
        }

        model.addAttribute("pintura", pinturaAEditar);

        return "editar.jsp";
    }

    @PutMapping("/actualizar/{id}")
    public String actualizar(@PathVariable("id") Long id,
                             @Valid @ModelAttribute("pintura") Pintura pintura,
                             BindingResult result,
                             HttpSession session) {

        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        Pintura pinturaExistente = servPinturas.buscarPintura(id);
        if (pinturaExistente == null) {
            return "redirect:/pinturas";
        }

        Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        if (!usuarioEnSesion.getId().equals(pinturaExistente.getCreador().getId())) {
            return "redirect:/pinturas";
        }

        pintura.setId(id);
        pintura.setCreador(pinturaExistente.getCreador());

        servPinturas.guardarPintura(pintura, result);

        if (result.hasErrors()) {
            return "editar.jsp";
        } else {
            return "redirect:/pinturas";
        }
    }

    @DeleteMapping("/borrar/{id}")
    public String borrar(@PathVariable("id") Long id, HttpSession session) {
        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        Pintura pintura = servPinturas.buscarPintura(id);
        if (pintura == null) {
            return "redirect:/pinturas";
        }

        Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        if (!usuarioEnSesion.getId().equals(pintura.getCreador().getId())) {
            return "redirect:/pinturas";
        }

        servPinturas.borrarPintura(id);
        return "redirect:/pinturas";
    }

    @GetMapping("/pintura/{id}")
    public String mostrar(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        Pintura pintura = servPinturas.buscarPintura(id);
        if (pintura == null) {
            return "redirect:/pinturas";
        }
        model.addAttribute("pintura", pintura);

        return "pintura.jsp";
    }

    @GetMapping("/comprar/{id}")
    public String comprar(@PathVariable("id") Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        boolean exito = servPinturas.comprarPintura(usuarioEnSesion.getId(), id);

        if (!exito) {
            redirectAttributes.addFlashAttribute("error", "Ya no existen más copias disponibles de esta pintura");
            return "redirect:/pintura/" + id;
        }

        redirectAttributes.addFlashAttribute("exito", "¡Compra realizada con éxito!");
        return "redirect:/mis-compras";
    }

    @GetMapping("/mis-compras")
    public String misCompras(HttpSession session, Model model) {
        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }

        Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        List<Pintura> compras = servPinturas.misCompras(usuarioEnSesion.getId());
        model.addAttribute("compras", compras);

        return "mis-compras.jsp";
    }

    @GetMapping("/buscar")
    public String buscar(@RequestParam(value = "palabra") String palabra, HttpSession session, Model model) {
        if (session.getAttribute("usuarioEnSesion") == null) {
            return "redirect:/login";
        }
        List<Pintura> pinturas = servPinturas.buscarPinturaConPalabra(palabra);
        model.addAttribute("pinturas", pinturas);
        return "pinturas.jsp";
    }

}
