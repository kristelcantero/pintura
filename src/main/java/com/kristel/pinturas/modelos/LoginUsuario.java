package com.kristel.pinturas.modelos;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public class LoginUsuario {

    @NotBlank(message = "Por favor ingresa un correo")
    @Email(message = "Por favor ingresa un correo válido")
    private String emailLogin;

    @NotBlank(message = "Por favor ingresa una contraseña")
    private String passwordLogin;

    public LoginUsuario() {
    }

    public String getEmailLogin() {
        return emailLogin;
    }

    public void setEmailLogin(String emailLogin) {
        this.emailLogin = emailLogin;
    }

    public String getPasswordLogin() {
        return passwordLogin;
    }

    public void setPasswordLogin(String passwordLogin) {
        this.passwordLogin = passwordLogin;
    }

}
