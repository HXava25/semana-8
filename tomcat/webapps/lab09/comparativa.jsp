<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comparación PHP vs JSP</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f8fafc; padding: 32px; }
        .container { max-width: 1100px; margin: 0 auto; background: white; padding: 24px; border-radius: 12px; box-shadow: 0 8px 22px rgba(0,0,0,0.08); }
        h1 { text-align: center; color: #0f172a; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #cbd5e1; padding: 12px; text-align: left; vertical-align: top; }
        th { background: #e2e8f0; }
        a { color: #166534; font-weight: 700; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Comparación técnica: PHP vs JSP</h1>
        <table>
            <thead>
                <tr>
                    <th>Aspecto</th>
                    <th>PHP</th>
                    <th>JSP</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Arquitectura</td>
                    <td>Procesador de scripts del lado del servidor, ideal para aplicaciones web rápidas y sencillas.</td>
                    <td>Basado en Java, ejecuta páginas con el contenedor servlet, adecuado para proyectos empresariales.</td>
                </tr>
                <tr>
                    <td>Ciclo de vida</td>
                    <td>Request → parse → execute → output; modelo stateless por HTTP.</td>
                    <td>Translation → compilation → instantiation → service → destroy; por contenedor servlet.</td>
                </tr>
                <tr>
                    <td>Gestión de estado</td>
                    <td>Se manejan sesiones con $_SESSION y cookies.</td>
                    <td>Se usan HttpSession, request, response y EL/JSTL.</td>
                </tr>
                <tr>
                    <td>Despliegue</td>
                    <td>Se despliega con Apache/Nginx + PHP y archivos dentro de htdocs o public_html.</td>
                    <td>Se despliega sobre Apache Tomcat con directorios webapps.</td>
                </tr>
                <tr>
                    <td>Escalabilidad</td>
                    <td>Buena opción para sitios web y APIs ligeras.</td>
                    <td>Mejor para aplicaciones empresariales con mayor complejidad y reutilización.</td>
                </tr>
                <tr>
                    <td>Seguridad</td>
                    <td>Se recomienda validar entradas con filter_input(), trim(), htmlspecialchars() y evitar register_globals.</td>
                    <td>Se recomienda evitar scriptlets complejos, validar parámetros, usar sesiones y mantener lógica separada.</td>
                </tr>
            </tbody>
        </table>
        <p><a href="index.jsp">Volver al formulario JSP</a></p>
    </div>
</body>
</html>
