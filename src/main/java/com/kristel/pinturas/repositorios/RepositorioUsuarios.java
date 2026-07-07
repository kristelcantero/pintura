package com.kristel.pinturas.repositorios;

import com.kristel.pinturas.modelos.Usuario;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioUsuarios extends CrudRepository<Usuario, Long> {
    Usuario findByEmail(String email);
}