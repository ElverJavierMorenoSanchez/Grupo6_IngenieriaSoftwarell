package Interfaces;

import Model.User;

public interface UserCrud {

    public boolean addUser(User user);

    public boolean updateUser(User user);

    public boolean deleteUser(User user);

    public boolean findUser(User user);

    /*Regla de negocio*/
    public boolean calculateAge(User user);
}
