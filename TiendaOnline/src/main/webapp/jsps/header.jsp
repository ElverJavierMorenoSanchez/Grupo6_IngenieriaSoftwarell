<%-- 
    Document   : header
    Created on : 28-may-2022, 23:53:53
    Author     : Javier Snz
--%>

<%@page import="Model.User"%>
<%@page import="Model.AuxUser"%>
<%@page import="Controller.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<header>
    <a href="#" class="logo">Meta Drive<span>.</span></a>
    <ul class="navigation">
        <li><a href="Controlador?accion=home" onclick="toggleMenu()">Inicio</a></li>
        <li><a href="Controlador?accion=products" onclick="toggleMenu()">Productos</a></li>
        <li><a href="#" onclick="toggleMenu()">Sobre Nosotros</a></li>
        <li><a href="#" onclick="toggleMenu()">Contactanos</a></li>

    </ul>
    <div class="shoppingCart">
        <a href="#">
            <span class="icon">
                <ion-icon name="cart-outline"></ion-icon>
            </span>
        </a>
        <div class="cont"><h3>0</h3></div>
        <div class="cartOptions">
            <div id="shopping-cart-container"></div>
            <div class="totalCash"><h2>TOTAL:</h2><h2>$0.0</h2></div>
            
            <div class="btn checkIn bPurchase"><h3>FACTURACION</h3></div>
        </div>
    </div>
    <%
        AuxUser.getAuxUser();
        if (AuxUser.getAuxUser().getUser() == null) {
    %>
    <a href="Controlador?accion=loginPage" class="singIn">INICIAR SESIÓN</a>
    <%} else {%>

    <div class="buttonLogin"></div>
    <div class="navigationUser">
        <div class="userBx">
            <div class="imgBx">
                <img src="img/perfil/prf.png" alt="">
            </div>
            <p class="username"> <%= AuxUser.getAuxUser().getUser().getName()%> </p>
        </div>
        <div class="menuToggle"></div>
        <ul class="menu">
            <li><a href=""><ion-icon name="person-outline"></ion-icon> Mi perfil</a></li>
            <li><a href=""><ion-icon name="notifications-outline"></ion-icon>Notificaciones</a></li>
            <li><a href=""><ion-icon name="notifications-outline"></ion-icon>Ayuda</a></li>
            <li><a href=""><ion-icon name="settings-outline"></ion-icon>Configuraciones</a></li>
            <li><a href="Controlador?accion=closeSesion"><ion-icon name="log-out-outline"></ion-icon>Cerrar Sesión</a></li>
        </ul>
    </div>

    <script>
        $(".buttonLogin").hide();
    </script>
    <%}%>
</header>