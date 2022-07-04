<%-- 
    Document   : index
    Created on : 28-may-2022, 15:03:11
    Author     : Javier Snz
    Diseño basado en: https://www.youtube.com/watch?v=ac5nmWOkBEY&t=0s
--%>
<%@page import="ModelDAO.UserDAO"%>
<%@page import="Model.User"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="ModelDAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Tienda Online</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="css/allPageStyle.css">
        <link rel="stylesheet" href="css/indexStyle.css">
        <link rel="stylesheet" href="css/headerStyle.css">
        <link rel="stylesheet" href="css/footerStyle.css">
    </head>
    <body>  
        <div id="header"></div>
        <div id="home">
            <section class="banner" id="banner">
                <div class="content left">
                    <h2>Consigue nuestros mejores productos</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing, elit. Possimus consequuntur saepe, ullam tempora natus quae architecto eveniet nisi vel omnis, sint praesentium culpa cupiditate, explicabo laborum quasi! Sint dolores, quia. Lorem, ipsum dolor sit amet consectetur adipisicing, elit. Quos iste, placeat magni cum, eius aliquam sint numquam et esse recusandae, architecto nam necessitatibus, sed labore laboriosam minima sapiente! Cumque, molestias.</p>
                    <a href="Controlador?accion=products" class="btn">Nuestros Productos</a>
                </div>
                <div class="content right"></div>
            </section>
            <!--
            
            <section class="about" id="about">
                <div class="row">
                    <div class="col50">
                        <h2 class="titleText"><span>G</span>RAN VARIEDAD DE PRODUCTOS <br></h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing, elit. Possimus consequuntur saepe, ullam tempora natus quae architecto eveniet nisi vel omnis, sint praesentium culpa cupiditate, explicabo laborum quasi! Sint dolores, quia. Lorem, ipsum dolor sit amet consectetur adipisicing, elit. Quos iste, placeat magni cum, eius aliquam sint numquam et esse recusandae, architecto nam necessitatibus, sed labore laboriosam minima sapiente! Cumque, molestias.Lorem ipsum dolor sit amet consectetur adipisicing, elit. Possimus consequuntur saepe, ullam tempora natus quae architecto eveniet nisi vel omnis, sint praesentium culpa cupiditate, explicabo laborum quasi! Sint dolores, quia. Lorem, ipsum dolor sit amet consectetur adipisicing, elit. Quos iste, placeat magni cum, eius aliquam sint numquam et esse recusandae, architecto nam necessitatibus, sed labore laboriosam minima sapiente! Cumque, molestias. 
                            <br><br> Lorem ipsum dolor sit, amet, consectetur adipisicing elit. Exercitationem, nulla et dolorem veritatis aliquam explicabo saepe est hic voluptas maxime qui sunt temporibus voluptates reiciendis quibusdam quidem maiores, inventore blanditiis! Lorem ipsum dolor sit amet consectetur adipisicing, elit. Quasi, blanditiis, dolore. Repellendus expedita, dolore est debitis, maiores dolorum modi animi, iure itaque natus nemo perspiciatis. Dignissimos ipsum possimus repudiandae quis!</p>
                    </div>
                    <div class="col50">
                        <div class="imgBx">
                            <img src="img/bg/bg5.jpg" alt="">
                        </div>
                    </div>
                </div>
            </section> -->
            <section class="menuIndex" id="menuIndex">
                <div class="title">
                    <h2 class="titleText">NUESTROS <span>P</span>RODUCTOS</h2>
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.</p>
                </div>
                <div class="content">
                    <%
                        ProductDAO productDAO = new ProductDAO();
                        List<Product> productList = productDAO.listProduct();
                        Iterator<Product> iteratorProduct = productList.iterator();
                        System.out.println(productList.size());
                        Product product = null;
                        String imgUrl = "";
                        int i = 0;
                        while (i != 7 && iteratorProduct.hasNext()) {
                            i += 1;
                            imgUrl = "img/products/";
                            product = iteratorProduct.next();
                            imgUrl += product.getImgUrl();
                    %>
                    <div class="box">
                        <div class="imgBx">
                            <img src=<%= imgUrl%> alt="">
                        </div>
                        <div class="text">
                            <h3><%= product.getName()%></h3>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="title">
                    <a href="Controlador?accion=products" class="btn">VER MÁS</a>
                </div>
            </section>
            <section class="contact" id="contact">
                <div class="title">
                    <h2 class="titleText"><span>E</span>SCRÍBENOS</h2>
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.</p>
                </div>
                <div class="contactForm">
                    <h3>Enviar Mensaje</h3>
                    <div class="inputBox">
                        <input type="text" placeholder="Name">
                    </div>
                    <div class="inputBox">
                        <input type="text" placeholder="Email">
                    </div>
                    <div class="inputBox">
                        <textarea name="Name"></textarea>
                    </div>
                    <div class="inputBox">
                        <input type="submit" class="btn" value="Send">
                    </div>
                </div>
            </section>
        </div>

        <div id="footer"></div>
        
        <script src="js/allPageCode.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
