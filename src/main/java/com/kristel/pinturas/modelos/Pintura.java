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
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "pinturas")
public class Pintura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // AI
    private Long id;

    @NotBlank(message = "Por favor proporciona el título")
    @Size(min = 5, message = "El título debe de tener al menos 5 caracteres")
    private String titulo;

    @NotBlank(message = "Por favor proporciona el autor")
    @Size(min = 2, message = "El autor debe de tener al menos 2 caracteres")
    private String autor;

    @NotNull(message = "Por favor proporciona el año")
    @Positive(message = "El año debe de ser un número positivo")
    private Integer anio;

    @NotBlank(message = "Por favor proporciona la descripción")
    @Size(min = 10, message = "La descripción debe de tener al menos 10 caracteres")
    @Column(columnDefinition = "TEXT")
    private String descripcion;

    @NotBlank(message = "Por favor proporciona una URL válida con la imagen")
    private String urlImagen;

    @NotNull(message = "Por favor proporciona la cantidad de copias")
    @PositiveOrZero(message = "La cantidad no puede ser negativa")
    private Integer cantidad;

    @NotNull(message = "Por favor proporciona el precio")
    @Positive(message = "El precio debe de ser un número positivo")
    private Double precio;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id") // Llave foránea
    private Usuario creador; // Usuario que agregó la pintura

    // Usuarios que han comprado esta pintura
    @ManyToMany(mappedBy = "pinturasCompradas", fetch = FetchType.LAZY)
    private List<Usuario> compradores;

    // Constructor Vacio
    public Pintura() {
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public Integer getAnio() {
        return anio;
    }

    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
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

    public Usuario getCreador() {
        return creador;
    }

    public void setCreador(Usuario creador) {
        this.creador = creador;
    }

    public List<Usuario> getCompradores() {
        return compradores;
    }

    public void setCompradores(List<Usuario> compradores) {
        this.compradores = compradores;
    }

    @PrePersist // Antes de crear el registro
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate // Antes de actualizar el registro
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

}
