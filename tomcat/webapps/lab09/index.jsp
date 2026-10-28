<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab09 - JSP</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f8fafc; color: #1f2937; padding: 32px; }
        .card { max-width: 700px; margin: 0 auto; background: white; border-radius: 12px; padding: 24px; box-shadow: 0 8px 22px rgba(0,0,0,0.08); }
        h1 { text-align: center; }
        form { display: grid; gap: 14px; }
        label { font-weight: 600; }
        input, select, textarea, button { width: 100%; padding: 10px 12px; border-radius: 8px; border: 1px solid #cbd5e1; box-sizing: border-box; }
        button { background: #16a34a; color: white; border: none; font-weight: 700; cursor: pointer; }
        a { color: #166534; font-weight: 700; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Formulario JSP - Lab09</h1>
        <form action="procesar.jsp" method="post">
            <div>
                <label for="nombre">Nombre completo</label>
                <input type="text" id="nombre" name="nombre" maxlength="80" required>
            </div>

            <div>
                <label for="email">Correo electrónico</label>
                <input type="email" id="email" name="email" maxlength="120" required>
            </div>

            <div>
                <label for="curso">Curso</label>
                <select id="curso" name="curso" required>
                    <option value="">Seleccione...</option>
                    <option value="Desarrollo de Aplicaciones Web">Desarrollo de Aplicaciones Web</option>
                    <option value="Arquitectura Cliente-Servidor">Arquitectura Cliente-Servidor</option>
                    <option value="Backend con PHP y JSP">Backend con PHP y JSP</option>
                </select>
            </div>

            <div>
                <label for="mensaje">Mensaje</label>
                <textarea id="mensaje" name="mensaje" rows="4" maxlength="250" required></textarea>
            </div>

            <button type="submit">Enviar</button>
        </form>

        <p><a href="comparativa.jsp">Ver comparación técnica</a></p>
    </div>
</body>
</html>
