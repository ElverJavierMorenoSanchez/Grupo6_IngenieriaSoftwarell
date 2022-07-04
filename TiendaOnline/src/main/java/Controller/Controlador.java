package Controller;

import Model.AuxUser;
import Model.Product;
import Model.User;
import ModelDAO.ProductDAO;
import ModelDAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    String home = "index.jsp";
    String products = "jsps/products.jsp";
    String adminProduct = "jsps/adminProduct.jsp";
    String newUser = "jsps/newUser.jsp";
    String loginPage = "jsps/loginPage.jsp";
    Product product = new Product();
    User user = new User();
    ProductDAO productDAO = new ProductDAO();
    UserDAO userDAO = new UserDAO();
    int id;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AuxUser.getAuxUser();
        String access = "";
        String accion = request.getParameter("accion");
        switch (accion) {
            case "home": {
                access = home;
            }
            break;
            case "products": {
                access = products;
            }
            break;
            case "adminProduct": {
                access = adminProduct;
            }
            break;
            case "newUser": {
                access = newUser;
            }
            break;
            case "loginPage": {
                access = loginPage;
            }
            break;
            case "addProduct": {
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String category = request.getParameter("category");
                String description = request.getParameter("description");
                String imgUrl = request.getParameter("imgUrl");

                product.setName(name);
                product.setPrice(price);
                product.setQuantity(quantity);
                product.setCategory(category);
                product.setDescription(description);
                product.setImgUrl(imgUrl);

                productDAO.addProduct(product);

                access = adminProduct;
            }
            break;
            case "addUser": {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                user.setUsername(username);
                user.setPassword(password);

                if (userDAO.findUser(user)) {
                    access = loginPage;
                } else {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");

                    user.setName(name);
                    user.setEmail(email);

                    AuxUser.getAuxUser().setUser(user);
                    userDAO.addUser(user);
                }
            }
            break;
            case "validationUser": {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                user.setUsername(username);
                user.setPassword(password);

                if (username.equals("admin") && password.equals("admin")) {
                    access = adminProduct;
                } else if (userDAO.findUser(user)) {
                    AuxUser.getAuxUser().setUser(user);
                    access = home;
                } else {
                    access = loginPage;
                }
            }
            break;
            case "closeSesion": {
                access = home;
                AuxUser.getAuxUser().setUser(null);
            }
            break;
        }

        RequestDispatcher view = request.getRequestDispatcher(access);
        view.forward(request, response);

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
