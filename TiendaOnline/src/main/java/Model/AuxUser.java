package Model;

public class AuxUser {
    public static AuxUser auxUser;    
    private User user;

    public static AuxUser getAuxUser() {
        if (auxUser == null) {
            auxUser = new AuxUser();
        }
        return auxUser;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
