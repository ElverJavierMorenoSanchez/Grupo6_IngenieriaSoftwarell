<%-- 
    Document   : newUser
    Created on : 30-may-2022, 22:25:45
    Author     : RobertoCarlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, inicial-scale=1.0">
        <title>Formulario de Registro</title>
        <link rel="stylesheet" type="text/css" href="css/allPageStyle.css">
        <link rel="stylesheet" type="text/css" href="css/newUserStyle.css">
        <script src="js/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <section>
            <div class="container">
                <div class="user signupBx">
                    <div class="imgBx"><img src="img/bg.jpg"> </div>
                    <div class="formBx">
                        <form>
                            <h2>Crear una Cuenta</h2>
                            <input type="text" name="name" placeholder="Nombre">
                            <input type="text" name="surname" placeholder="Apellido">
                            <input type="text" name="address" placeholder="Direccion">
                            <input type="text" name="city" placeholder="Ciudad">
                            <input type="text" name="phone" placeholder="Telefono">
                            <input type="text" name="email" placeholder="Correo Electronico">
                            <input type="text" name="username" placeholder="Usuario">
                            <input type="password" name="password" placeholder="Contraseña">

                            <button type="submit" value="" name="accion">
                                Crear Cuenta
                            </button>

                            <p class="login">¿Ya tienes una Cuenta?<a href="Controlador?accion=loginPage"> Ingresa aqui.</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script>
            
            document.querySelector("form button").addEventListener("click", e =>{
                const pass = document.querySelector("form input[name='password']").value;
                const user = document.querySelector("form input[name='username']").value;
                const nm = document.querySelector("form input[name='name']").value;
                const sn = document.querySelector("form input[name='surname']").value;
                const add = document.querySelector("form input[name='address']").value;
                const ct = document.querySelector("form input[name='city']").value;
                const ph = document.querySelector("form input[name='phone']").value;
                const em = document.querySelector("form input[name='email']").value;

                if (nm === "") {
                    document.querySelector("form button").setAttribute("value", "newUser");
                    alert("Nombre incorrecto");
                } else if (sn === "") {
                    alert("Apellido incorrecto");
                    document.querySelector("form button").setAttribute("value", "newUser");
                } else if (add === "") {
                    alert("Dirección incorrecta");
                    document.querySelector("form button").setAttribute("value", "newUser");
                } else if (ct === "") {
                    alert("Ciudad incorrecta");
                    document.querySelector("form button").setAttribute("value", "newUser");
                } else if (ph === "" || ph.length < 10) {
                    alert("Telefono incorrecto");
                    document.querySelector("form button").setAttribute("value", "newUser");
                } else if (em === "") {
                    alert("Correo incorrecto");
                    document.querySelector("form button").setAttribute("value", "newUser");
                } else if (user === "") {
                    alert("Nombre de usuario incorrecto");
                    document.querySelector("form button").setAttribute("value", "newUser");
                } else if (pass.length < 8) {
                    alert("Contraseña incorrecta");
                    document.querySelector("form button").setAttribute("value", "newUser");
                }else{
                    document.querySelector("form button").setAttribute("value", "addUser");
                }
            });
        </script>
    </body>
</html>
