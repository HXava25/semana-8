<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) return "";
        return value
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;");
    }
%>
<%
    request.setCharacterEncoding("UTF-8");
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email");
    String curso = request.getParameter("curso");
    String mensaje = request.getParameter("mensaje");

    List<String> errores = new ArrayList<>();
    if (nombre == null || nombre.trim().isEmpty()) {
        errores.add("El nombre es obligatorio.");
    }
    if (email == null || !email.matches("^[\\w.-]+@[\\w.-]+\\.[A-Za-z]{2,6}$")) {
        errores.add("El correo electrónico no es válido.");
    }
    if (curso == null || curso.trim().isEmpty()) {
        errores.add("Debe seleccionar un curso.");
    }
    if (mensaje == null || mensaje.trim().length() < 10) {
        errores.add("El mensaje debe tener al menos 10 caracteres.");
    }

    if (!errores.isEmpty()) {
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Errores de validación</title>
</head>
<body>
    <h2>Errores de validación</h2>
    <ul>
        <% for (String error : errores) { %>
            <li><%= escapeHtml(error) %></li>
        <% } %>
    </ul>
    <p><a href="index.jsp">Volver al formulario</a></p>
</body>
</html>
<%
        return;
    }

    HttpSession userSession = request.getSession();
    userSession.setAttribute("nombre", nombre);
    userSession.setAttribute("email", email);
    userSession.setAttribute("curso", curso);
    userSession.setAttribute("mensaje", mensaje);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Respuesta JSP</title>
    <style>
        body { font-family: Arial, sans-serif; background: #ecfdf5; padding: 32px; }
        .card { max-width: 700px; margin: 0 auto; background: white; border-radius: 12px; padding: 24px; box-shadow: 0 8px 22px rgba(0,0,0,0.08); }
        h1 { color: #166534; }
        .info { background: #f8fafc; padding: 12px; border-radius: 8px; }
        a { color: #166534; font-weight: 700; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Procesamiento realizado con JSP</h1>
        <div class="info">
            <p><strong>Nombre:</strong> <%= escapeHtml(nombre) %></p>
            <p><strong>Correo:</strong> <%= escapeHtml(email) %></p>
            <p><strong>Curso:</strong> <%= escapeHtml(curso) %></p>
            <p><strong>Mensaje:</strong> <%= escapeHtml(mensaje) %></p>
        </div>
        <p>La solicitud fue atendida por JSP y se guardó en la sesión del usuario.</p>
        <p><a href="index.jsp">Nuevo envío</a> | <a href="comparativa.jsp">Ver comparación</a></p>
    </div>
</body>
</html>
