<%-- 
    Document   : index
    Created on : 04-nov-2020, 10:29:05
    Author     : facu_
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Persona"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("listaper")==null){
        ArrayList<Persona> lista=new ArrayList<Persona>();
        lista.add(new Persona(1,"Bruno Diaz","7732444","bruno@gmail.com"));
        lista.add(new Persona(2,"Ricardo Tapia","7836345","ricardo@gmail.com"));
        lista.add(new Persona(3,"Pulino Mercado","7632653","mercado@gmail.com"));
        session.setAttribute("listaper", lista);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSTL Core</h1>
        <h2>1. Uso de la equiteta set</h2>
        <p>Se usa para crear variables con algun valor</p>
        <c:set var="carrera" value="Sistemas"/>
        <c:set var="ciudad" value="El Alto"/>

        <h2>2. Uso de la etiqueta out</h2>
        <p>El valor de la variable cerrera es: ${carrera} </p>
        <p>El valor de la variable ciudad es: 
            <c:out value="${ciudad}"/>
        </p>
        <p>El valor de la gestion es: <c:out value="${gestion}" default="sin dato"/></p>

        <h2>3. Uso de la etiqueta Remove</h2>
        <p>Se usa para eliminar variables</p>
        <c:remove var="ciudad"/>
        <p>El valor de la variable ciudad es: 
            <c:out value="${ciudad}" default="sin ciudad"/>
        <h2>4. Usi del catch</h2>
        <p>Se usa para capturar excepciones</p>
        <c:catch var="excep">
            <%= 3 / 0%>
        </c:catch>
        <c:if test="${ex!=null}">
            <p>Ocurio un error ${ex}</p>
        </c:if>
        <h2>5. Uso del if</h2>
        <c:set var="a" value="30"/>
        <c:if test="${a>50}">
            <p>la variable es mayor que 50</p>
        </c:if>
        <c:if test="${a<50}">
            <p>la variable a es menor que 50</p>
        </c:if>
        <p>Probando con un parametro</p>
        <c:if test="${param.color=='red'}">
            <p>El color enviado es ROJO</p>
        </c:if>
        
            <h2>6. Uso del foreach</h2>
            <p>Se muestra una tabla usando el foreach</p>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Telefono</th>
                        <th>Coreo</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${sessionScope.listaper}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.nombre}</td>
                        <td>${item.telefono}</td>
                        <td>${item.correo}</td>
                    </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            <h2>7. Uso de choose</h2>
                <p>Para visualizar el texto necesita agregar el parametro 
                    <strong>estado</strong>en la barra
                de direcciones con los valores,S,I </p>
                <p>Ejemplo: ?estado="A"</p>
                <c:choose>
                    <c:when test="${param.estado=='A'}">
                        <h4 style="color:blue">ACTIVO</h4>
                    </c:when>
                    <c:when test="${param.estado=='S'}">
                        <h4 style="color:orange">SUSPENDIDO</h4>
                    </c:when>
                    <c:when test="${param.estado=='I'}">
                        <h4 style="color:red">INACTIVO</h4>
                    </c:when>
                    <c:otherwise>
                        <p>***SIN ESTADO***</p>
                    </c:otherwise>
                </c:choose>

    </body>
</html>
