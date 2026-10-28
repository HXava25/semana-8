<?php

declare(strict_types=1);

const APP_NAME = 'Lab09 - Backend PHP';
const APP_VERSION = '1.0.0';

function limpiarTexto(string $valor): string
{
    return htmlspecialchars(trim($valor), ENT_QUOTES, 'UTF-8');
}

function validarCorreo(string $correo): bool
{
    return filter_var($correo, FILTER_VALIDATE_EMAIL) !== false;
}
?>
