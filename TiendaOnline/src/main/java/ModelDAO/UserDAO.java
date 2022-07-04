/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import ConnectionDB.ConnectionMongoDB;
import Interfaces.UserCrud;
import Model.AuxUser;
import Model.User;
import com.mongodb.MongoException;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.*;
import java.sql.ResultSet;
import org.bson.Document;

/**
 *
 * @author RobertoCarlos
 */
public class UserDAO implements UserCrud {

    ConnectionMongoDB connectionMongoDB = new ConnectionMongoDB();
    MongoDatabase mongoDatabase;
    ResultSet resultSet;
    User user;

    @Override
    public boolean addUser(User user) {
        String query = "{"
                + "name: " + "'" + user.getName() + "'" + ","
               + "email: " + "'" + user.getEmail()+ "'" + ","
                + "username: " + "'" + user.getUsername()+ "'" + ","
                + "password: " + "'" + user.getPassword() + "'"
                + "}";

        try {
            mongoDatabase = connectionMongoDB.getMongoDatabase();
            MongoCollection collection = mongoDatabase.getCollection("User");
            collection.insertOne(Document.parse(query));
        } catch (MongoException e) {
            System.out.println("Error" + e);
        }

        return false;
    }

    @Override
    public boolean updateUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean deleteUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean findUser(User user) {
        boolean band = false;

        try {
            mongoDatabase = connectionMongoDB.getMongoDatabase();
            MongoCollection collection = mongoDatabase.getCollection("User");

            FindIterable<Document> findIterable = collection.find(
                    and(or(eq("email", user.getUsername()), eq("username", user.getUsername())),
                            eq("password", user.getPassword())));

            if (findIterable.first() != null) {
                AuxUser.getAuxUser();
                
                user.setName(findIterable.first().getString("name"));
                user.setEmail(findIterable.first().getString("email"));
                user.setUsername(findIterable.first().getString("username"));
                user.setPassword(findIterable.first().getString("password"));
                
                AuxUser.getAuxUser().setUser(user);
                band = true;
            }

        } catch (MongoException e) {
            System.out.println("Error" + e);
        }

        return band;
    }

    @Override
    public boolean calculateAge(User user) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
