package ModelDAO;

import ConnectionDB.ConnectionMongoDB;
import Interfaces.ProductCrud;
import Model.Product;
import com.mongodb.MongoException;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.bson.Document;

public class ProductDAO implements ProductCrud {

    ConnectionMongoDB connectionMongoDB = new ConnectionMongoDB();
    MongoDatabase mongoDatabase;
    ResultSet resultSet;
    Product product;
    String category;

    @Override
    public ArrayList listProduct() {
        ArrayList<Product> productList = new ArrayList<>();

        try {
            mongoDatabase = connectionMongoDB.getMongoDatabase();
            MongoCollection collection = mongoDatabase.getCollection("Products");
            FindIterable<Document> findIterable = collection.find(new Document());
            MongoCursor<Document> mongoCursor = findIterable.iterator();

            while (mongoCursor.hasNext()) {
                Document docObject = mongoCursor.next();
                product = new Product();
                product.setName(docObject.getString("name"));
                product.setPrice(docObject.getDouble("price"));
                product.setQuantity(docObject.getInteger("quantity"));
                product.setCategory(docObject.getString("category"));
                product.setDescription(docObject.getString("description"));
                product.setImgUrl(docObject.getString("imgUrl"));
                productList.add(product);
            }
        } catch (MongoException e) {
            System.out.println("Error" + e);
        }

        return productList;
    }

    @Override
    public Product listProduct(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList listCategory() {
        ArrayList<String> categoryList = new ArrayList<>();
        
        try { mongoDatabase = connectionMongoDB.getMongoDatabase();
            MongoCollection collection = mongoDatabase.getCollection("category");
            FindIterable<Document> findIterable = collection.find(new Document());
            MongoCursor<Document> mongoCursor = findIterable.iterator();

            while (mongoCursor.hasNext()) {
                Document docObject = mongoCursor.next();
                category = docObject.getString("category");
                        
               categoryList.add(category);
            }
        } catch (MongoException e) {
            System.out.println("Error" + e);
        }

        return categoryList;
    }

    @Override
    public boolean addProduct(Product product) {
        
        double iva = 0.12;
        double totalPrice = calculateTotalPrice(product.getPrice(), iva);
        
        String query = "{"
                + "name: " +"'"+ product.getName() + "'"+","
                + "price: " + product.getPrice() +","
                + "quantity: " + product.getQuantity() +","
                + "category: " +"'"+ product.getCategory() + "'"+","
                + "description: " +"'"+ product.getDescription() + "'"+","
                + "imgUrl: " +"'"+ product.getImgUrl() + "'"+","
                + "}";
        
        try {
            mongoDatabase = connectionMongoDB.getMongoDatabase();
            MongoCollection collection = mongoDatabase.getCollection("Products");
            collection.insertOne(Document.parse(query));
        } catch (MongoException e) {
            System.out.println("Error" + e);
        }

        return false;
    }

    @Override
    public boolean updateProduct(Product product) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteProduct(Product product) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public double calculateTotalPrice(double iva, double price) {
        double totalPrice;
        double IVA = (double) 0.12;
        totalPrice = price * IVA;

        return totalPrice;
    }
}
