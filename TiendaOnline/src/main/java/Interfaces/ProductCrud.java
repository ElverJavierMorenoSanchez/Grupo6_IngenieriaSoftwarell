package Interfaces;

import Model.Product;
import java.util.ArrayList;

public interface ProductCrud {

    public ArrayList listProduct();

    public Product listProduct(int id);

    public boolean addProduct(Product product);

    public boolean updateProduct(Product product);

    public boolean deleteProduct(Product product);
    
    public ArrayList listCategory();

    /*Regla de negocio*/
    public double calculateTotalPrice(double iva, double price);
}