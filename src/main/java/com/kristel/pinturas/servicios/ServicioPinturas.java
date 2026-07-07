package com.kristel.pinturas.servicios;

import java.util.ArrayList;
import java.util.List;

import com.kristel.pinturas.modelos.Pintura;
import com.kristel.pinturas.modelos.Usuario;
import com.kristel.pinturas.repositorios.RepositorioPinturas;
import com.kristel.pinturas.repositorios.RepositorioUsuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

@Service
public class ServicioPinturas {

    @Autowired
    private RepositorioPinturas repoPinturas;

    @Autowired
    private RepositorioUsuarios repoUsuarios;

    public List<Pintura> todasLasPinturas() {
        return repoPinturas.findAllByOrderByTituloAsc();
    }

    // Usada tanto por /crear como por /actualizar. Valida que el título sea único.
    public Pintura guardarPintura(Pintura pintura, BindingResult result) {
        Pintura existente = repoPinturas.findByTitulo(pintura.getTitulo());

        // Si existe una pintura con ese título y no es la misma que estoy editando -> rechazar
        if (existente != null && !existente.getId().equals(pintura.getId())) {
            result.rejectValue("titulo", "Unique", "El título ya existe, debe ser único");
        }

        if (result.hasErrors()) {
            return null;
        }

        return repoPinturas.save(pintura);
    }

    public Pintura buscarPintura(Long id) {
        return repoPinturas.findById(id).orElse(null);
    }

    public void borrarPintura(Long id) {
        repoPinturas.deleteById(id);
    }

    public Usuario buscarUsuario(Long id) {
        return repoUsuarios.findById(id).orElse(null);
    }

    public List<Pintura> buscarPinturaConPalabra(String palabra) {
        return repoPinturas.findByTituloContainingOrAutorContaining(palabra, palabra);
    }

 // Devuelve true si la compra fue exitosa, false si no hay stock
    public boolean comprarPintura(Long usuarioId, Long pinturaId) {
        Usuario usuario = buscarUsuario(usuarioId);
        Pintura pintura = buscarPintura(pinturaId);

        if (usuario == null || pintura == null) {
            return false;
        }

        if (pintura.getCantidad() == null || pintura.getCantidad() <= 0) {
            // Ya no hay copias disponibles
            return false;
        }

        pintura.setCantidad(pintura.getCantidad() - 1);
        repoPinturas.save(pintura);

        if (usuario.getPinturasCompradas() == null) {
            usuario.setPinturasCompradas(new ArrayList<>());
        }

        if (!usuario.getPinturasCompradas().contains(pintura)) {
            usuario.getPinturasCompradas().add(pintura);
            repoUsuarios.save(usuario);
        }

        return true;
    }

    public List<Pintura> misCompras(Long usuarioId) {
        Usuario usuario = buscarUsuario(usuarioId);
        if (usuario == null) {
            return List.of();
        }
        return usuario.getPinturasCompradas() != null ? usuario.getPinturasCompradas() : new ArrayList<>();
    }

}
