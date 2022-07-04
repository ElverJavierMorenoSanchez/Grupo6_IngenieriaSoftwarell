<%@page import="ModelDAO.UserDAO"%>
<%@page import="Model.User"%>
<%@page import="ModelDAO.ValidationDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page Tienda online</title>
        <link rel="stylesheet" href="css/loginStyle.css">
        <script src="js/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <section>
            <div class="imgBx">
                <img src="img/bg.jpg">
            </div>
            <div class="contentBx">
                <div class="formBx">
                    <h2>Login</h2>
                    <form>
                        <div class="inputBx">
                            <span>Username</span>
                            <input class="user" type="text" name="username">
                        </div>
                        <div class="inputBx">
                            <span>Password</span>
                            <input class="pass" type="password" name="password">
                        </div>
                        <div class="remember">
                            <label><input type="checkbox" name=""> Remember me</label>
                        </div>
                        <div class="inputBx">
                            <button type="submit" value="" name="accion">
                                Iniciar Sesión
                            </button>
                        </div>
                        <div class="inputBx">
                            <p>Don't have an account? <a href="Controlador?accion=newUser">Sign up</a></p>
                        </div>
                    </form>

                    <h3>Login with social media</h3>
                    <ul class="sci">
                        <li><img src="img/facebook.png"></li>
                        <li><img src="img/twitter.png"></li>
                        <li><img src="img/instagram.png"></li>
                    </ul>     	
                </div>
            </div>
        </section>

        <script>

            document.querySelector(".inputBx button").addEventListener("click", e => {
                const pass = document.querySelector(".inputBx .pass").value;
                const user = document.querySelector(".inputBx .user").value;

                if (user === "") {
                    document.querySelector(".inputBx button").setAttribute("value", "loginPage");
                    alert("Usuario incorrecto");
                } else if (pass.length < 8) {
                    document.querySelector(".inputBx button").setAttribute("value", "loginPage");
                    alert("Contraseña incorrecta");
                } else{
                    document.querySelector(".inputBx button").setAttribute("value", "validationUser");
                }
            });
        </script>
    </body>
</html>