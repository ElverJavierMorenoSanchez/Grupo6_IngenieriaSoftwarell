<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="ConnectionDB.ConnectionMongoDB"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="ModelDAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Productos - Tienda Online.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/allPageStyle.css">
        <link rel="stylesheet" href="css/headerStyle.css">
        <link rel="stylesheet" href="css/productStyle.css">
        <link rel="stylesheet" href="css/footerStyle.css">
        <script src="js/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            List<String> categoryList = productDAO.listCategory();
            Iterator<String> iteratorCategory = categoryList.iterator();
            List<Product> productList = productDAO.listProduct();
            Iterator<Product> iteratorProduct = productList.iterator();
            Product product = null;
        %>
        <div id="header"></div>

        <div class="products"><h2 class="titleText">NUESTROS <span>P</span>RODUCTOS</h2></div>
        <section class="productsList" id="productsList">
            <%
                String category = "";
                String auxCategory = "";
                String firstLetter = "";
                String imgUrl = "";
                int id = 0;
                while (iteratorCategory.hasNext()) {
                    category = iteratorCategory.next();
                    auxCategory = category;
                    auxCategory = auxCategory.toUpperCase();
                    firstLetter = auxCategory.substring(0, 1);
                    auxCategory = auxCategory.substring(1, auxCategory.length());

            %>
            <div class="title">
                <h2 class="titleText"><span><%= firstLetter%></span><%= auxCategory%></h2>
            </div>
            <div class="content">
                <%
                    iteratorProduct = productList.iterator();
                    while (iteratorProduct.hasNext()) {
                        product = iteratorProduct.next();
                        if (category.equals(product.getCategory())) {
                            imgUrl = "img/products/";
                            imgUrl += product.getImgUrl();
                            String name = product.getName();
                            double price = product.getPrice();
                %>

                <div class="box">
                    <div class="imgBx">
                        <img src=<%= imgUrl%> alt="">
                        <div class="optionCart">
                            <button class="add button" data-id="<%= id%>">
                                <span class="icon">
                                    <ion-icon name="cart-outline"></ion-icon>
                                </span>
                                <h3>AÑADIR AL CARRITO</h3>
                            </button>
                        </div>
                    </div>
                    <div class="text">
                        <h2 class="name"><%= name%></h2>
                        <h3 class="price">$ <%= price%></h3>
                        <h3 class="description"><%= product.getDescription()%></h3>
                    </div>
                </div>
                <% id += 1;
                        }
                    }%>
            </div>
            <%}%>
        </section>

        <div id="footer"></div>

        <script src="js/allPageCode.js"></script>
        <script src="js/productsCode.js"></script>
        <script>
            const array = [];
            let name = "";
            let price = 0;
            let id = 0;
            let qty = 0;
            let product = null;
            <%
                iteratorProduct = productList.iterator();
                id = 0;
                while (iteratorProduct.hasNext()) {
                    product = iteratorProduct.next();
                    String name = product.getName();
                    double price = product.getPrice();
                    int qty = product.getQuantity();

            %>
            name = "<%= name%>";
            price = <%= price%>;
            id = <%= id%>;
            qty = <%= qty%>;
            product = {
                id: id,
                title: name,
                price: price,
                qty: qty
            };
            array.push(product);
            <% id += 1;
                }%>
            db.items = array;
            console.log(db.items);
            
            //renderStore();
        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
