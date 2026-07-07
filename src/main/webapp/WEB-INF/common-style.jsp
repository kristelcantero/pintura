<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Google Fonts: Playfair Display & Plus Jakarta Sans -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Plus+Jakarta+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
    :root {
        --primary-color: #111111;
        --accent-color: #bfa37a; /* Elegant bronze/gold */
        --bg-color: #faf9f6; /* Warm off-white */
        --text-color: #2c2c2c;
        --text-muted: #767676;
        --border-color: #e5e5e5;
        --card-bg: #ffffff;
        --font-sans: 'Plus Jakarta Sans', sans-serif;
        --font-serif: 'Playfair Display', serif;
    }

    body {
        background-color: var(--bg-color);
        color: var(--text-color);
        font-family: var(--font-sans);
        font-size: 0.95rem;
        letter-spacing: -0.01em;
        line-height: 1.6;
        -webkit-font-smoothing: antialiased;
        padding-bottom: 3rem;
    }

    h1, h2, h3, h4, h5, h6, .display-serif {
        font-family: var(--font-serif);
        font-weight: 700;
        color: var(--primary-color);
        letter-spacing: -0.02em;
    }

    a {
        color: var(--primary-color);
        text-decoration: none;
        transition: all 0.2s ease-in-out;
    }

    a:hover {
        color: var(--accent-color);
    }

    /* Header & Navigation */
    header {
        border-bottom: 1px solid var(--border-color);
        padding-top: 1.5rem;
        padding-bottom: 1.5rem;
        margin-bottom: 2.5rem;
    }

    .navbar-brand-custom {
        font-family: var(--font-serif);
        font-size: 1.75rem;
        font-weight: 700;
        color: var(--primary-color) !important;
        letter-spacing: -0.03em;
    }
    
    .nav-link-custom {
        font-weight: 600;
        font-size: 0.8rem;
        color: var(--text-muted) !important;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        position: relative;
        padding: 0.5rem 0;
        transition: color 0.25s ease;
    }

    .nav-link-custom:hover, .nav-link-custom.active-link {
        color: var(--primary-color) !important;
    }

    .nav-link-custom::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: var(--accent-color);
        transition: width 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .nav-link-custom:hover::after, .nav-link-custom.active-link::after {
        width: 100%;
    }

    /* Buttons */
    .btn {
        border-radius: 4px;
        font-weight: 600;
        font-size: 0.8rem;
        letter-spacing: 0.06em;
        padding: 0.75rem 1.75rem;
        transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        text-transform: uppercase;
    }

    .btn-primary {
        background-color: var(--primary-color);
        border-color: var(--primary-color);
        color: #ffffff;
    }

    .btn-primary:hover, .btn-primary:focus, .btn-primary:active {
        background-color: var(--accent-color) !important;
        border-color: var(--accent-color) !important;
        color: #ffffff !important;
        box-shadow: 0 4px 12px rgba(191, 163, 122, 0.25);
    }

    .btn-outline-primary {
        color: var(--primary-color);
        border-color: var(--primary-color);
        background: transparent;
    }

    .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active {
        background-color: var(--primary-color) !important;
        border-color: var(--primary-color) !important;
        color: #ffffff !important;
    }

    .btn-danger {
        background-color: transparent;
        color: #dc3545;
        border: 1px solid #dc3545;
    }

    .btn-danger:hover, .btn-danger:focus, .btn-danger:active {
        background-color: #dc3545 !important;
        color: #ffffff !important;
        border-color: #dc3545 !important;
        box-shadow: 0 4px 12px rgba(220, 53, 69, 0.15);
    }

    .btn-sm {
        padding: 0.4rem 1rem;
        font-size: 0.75rem;
    }

    /* Forms & Inputs */
    .form-wrapper {
        background: var(--card-bg);
        padding: 2.5rem;
        border-radius: 8px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.01), 0 15px 35px rgba(0, 0, 0, 0.03);
        border: 1px solid #eaeae8;
    }

    .form-control, .form-select, textarea {
        border-radius: 4px;
        border: 1px solid var(--border-color);
        padding: 0.75rem 1rem;
        background-color: #ffffff;
        transition: all 0.2s ease;
        font-size: 0.9rem;
        color: var(--text-color);
    }

    .form-control:focus, .form-select:focus, textarea:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(17, 17, 17, 0.05);
        outline: none;
    }

    label {
        font-size: 0.75rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.06em;
        color: var(--primary-color);
        margin-bottom: 0.5rem;
        display: inline-block;
    }

    .text-danger {
        font-size: 0.8rem;
        font-weight: 500;
        margin-top: 0.25rem;
    }

    /* Cards & Layout */
    .art-card {
        border: none;
        border-radius: 0px;
        background-color: var(--card-bg);
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.01), 0 10px 30px rgba(0, 0, 0, 0.02);
        transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        border: 1px solid #eaeae8;
    }

    .art-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.01), 0 20px 40px rgba(0, 0, 0, 0.06);
    }

    .art-img-container {
        position: relative;
        overflow: hidden;
        background-color: #f7f6f2;
    }

    .art-img {
        width: 100%;
        height: 260px;
        object-fit: cover;
        transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .art-card:hover .art-img {
        transform: scale(1.04);
    }

    .art-card-body {
        padding: 1.5rem;
    }

    .art-title {
        font-family: var(--font-serif);
        font-size: 1.25rem;
        font-weight: 700;
        margin-bottom: 0.4rem;
        color: var(--primary-color);
    }

    .art-meta {
        font-size: 0.85rem;
        color: var(--text-muted);
        margin-bottom: 0.25rem;
    }

    .art-price {
        font-family: var(--font-sans);
        font-size: 0.95rem;
        font-weight: 700;
        color: var(--primary-color);
        margin-top: 0.5rem;
    }

    .page-title {
        position: relative;
        padding-bottom: 0.75rem;
        margin-bottom: 2rem;
    }

    .page-title::after {
        content: '';
        position: absolute;
        width: 30px;
        height: 2px;
        bottom: 0;
        left: 0;
        background-color: var(--accent-color);
    }

    /* Badge & Info Styling */
    .badge-custom {
        background-color: #f0ece1;
        color: #8c765c;
        border-radius: 4px;
        font-size: 0.75rem;
        font-weight: 600;
        padding: 0.35rem 0.75rem;
        text-transform: uppercase;
        letter-spacing: 0.04em;
    }

    /* Custom Input Group */
    .input-group-custom {
        display: flex;
        border-bottom: 1px solid var(--primary-color);
        padding-bottom: 0.25rem;
    }

    .input-group-custom input {
        border: none;
        background: transparent;
        padding: 0.5rem 0;
        flex-grow: 1;
        font-size: 1rem;
    }

    .input-group-custom input:focus {
        box-shadow: none;
        outline: none;
    }

    .input-group-custom button {
        background: transparent;
        border: none;
        color: var(--primary-color);
        padding: 0 0.5rem;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.8rem;
        letter-spacing: 0.05em;
    }
</style>
