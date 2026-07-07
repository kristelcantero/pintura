package com.kristel.pinturas.repositorios;

import java.util.List;

import com.kristel.pinturas.modelos.Pintura;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioPinturas extends CrudRepository<Pintura, Long> {

    List<Pintura> findAllByOrderByTituloAsc();

    List<Pintura> findByTituloContainingOrAutorContaining(String titulo, String autor);

    Pintura findByTitulo(String titulo);

}
