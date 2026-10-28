<?php
require_once __DIR__ . '/config.php';

session_start();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: index.html');
    exit;
}

$nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING) ?? '';
$email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL) ?? '';
$curso = filter_input(INPUT_POST, 'curso', FILTER_SANITIZE_STRING) ?? '';
$mensaje = filter_input(INPUT_POST, 'mensaje', FILTER_SANITIZE_STRING) ?? '';

$errores = [];

if (trim($nombre) === '') {
    $errores[] = 'El nombre es obligatorio.';
} elseif (mb_strlen($nombre, 'UTF-8') < 2) {
    $errores[] = 'El nombre debe tener al menos 2 caracteres.';
}

if (!validarCorreo((string) $email)) {
    $errores[] = 'El correo electrónico no es válido.';
}

if (trim($curso) === '') {
    $errores[] = 'Debe seleccionar un curso.';
}

if (trim($mensaje) === '') {
    $errores[] = 'El mensaje es obligatorio.';
} elseif (mb_strlen($mensaje, 'UTF-8') < 10) {
    $errores[] = 'El mensaje debe tener al menos 10 caracteres.';
}

if (!empty($errores)) {
    echo '<!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><title>Errores</title></head><body><h2>Errores de validación</h2><ul>';
    foreach ($errores as $error) {
        echo '<li>' . limpiarTexto($error) . '</li>';
    }
    echo '</ul><p><a href="index.html">Volver al formulario</a></p></body></html>';
    exit;
}

$_SESSION['usuario'] = [
    'nombre' => $nombre,
    'email' => $email,
    'curso' => $curso,
    'mensaje' => $mensaje
];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Respuesta PHP</title>
    <style>
        body { font-family: Arial, sans-serif; background: #eff6ff; padding: 32px; }
        .card {
            max-width: 700px; margin: 0 auto; background: white; border-radius: 12px;
            box-shadow: 0 8px 28px rgba(0,0,0,0.08); padding: 24px;
        }
        h1 { color: #1d4ed8; }
        .info { padding: 12px; background: #f8fafc; border-radius: 8px; margin-bottom: 12px; }
        a { color: #1d4ed8; font-weight: 600; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Procesamiento realizado con PHP</h1>
        <div class="info">
            <p><strong>Nombre:</strong> <?= limpiarTexto($nombre) ?></p>
            <p><strong>Correo:</strong> <?= limpiarTexto($email) ?></p>
            <p><strong>Curso:</strong> <?= limpiarTexto($curso) ?></p>
            <p><strong>Mensaje:</strong> <?= limpiarTexto($mensaje) ?></p>
        </div>

        <p>La solicitud fue atendida por PHP y responde con un ciclo HTTP: request → validación → procesamiento → salida.</p>
        <p><a href="index.html">Nuevo envío</a> | <a href="comparativa.php">Ver comparación</a></p>
    </div>
</body>
</html>
