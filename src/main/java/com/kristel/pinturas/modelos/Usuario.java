package com.kristel.pinturas.modelos;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "usuarios")
public class Usuario {

    @Id // PK
    @GeneratedValue(strategy = GenerationType.IDENTITY) // AI
    private Long id;

    @NotBlank(message = "Por favor proporciona tu nombre")
    @Size(min = 3, message = "El nombre debe de tener al menos 3 caracteres")
    private String nombre;

    @NotBlank(message = "Por favor proporciona tu apellido")
    @Size(min = 3, message = "El apellido debe de tener al menos 3 caracteres")
    private String apellido;

    @NotBlank(message = "Por favor ingresa un correo")
    @Email(message = "Por favor ingresa un correo válido")
    private String email;

    @NotBlank(message = "Por favor ingresa una contraseña")
    @Size(min = 8, message = "La contraseña necesita tener al menos 8 caracteres")
    private String password;

    @Transient // No se guarda en BD
    private String confirmacion;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    // Constructor Vacio
    public Usuario() {
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmacion() {
        return confirmacion;
    }

    public void setConfirmacion(String confirmacion) {
        this.confirmacion = confirmacion;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    // Pinturas que este usuario agregó al catálogo
    @OneToMany(mappedBy = "creador", fetch = FetchType.LAZY)
    private List<Pintura> pinturasCreadas;

    // Pinturas que este usuario ha comprado
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "compras", joinColumns = @JoinColumn(name = "usuario_id"), inverseJoinColumns = @JoinColumn(name = "pintura_id"))
    private List<Pintura> pinturasCompradas;

    public List<Pintura> getPinturasCreadas() {
        return pinturasCreadas;
    }

    public void setPinturasCreadas(List<Pintura> pinturasCreadas) {
        this.pinturasCreadas = pinturasCreadas;
    }

    public List<Pintura> getPinturasCompradas() {
        return pinturasCompradas;
    }

    public void setPinturasCompradas(List<Pintura> pinturasCompradas) {
        this.pinturasCompradas = pinturasCompradas;
    }

}
