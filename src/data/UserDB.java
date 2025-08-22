package data;

import java.util.*;
import model.User;

public class UserDB {
    private static List<User> users = new ArrayList<>();

    public static void insert(User user) {
        users.add(user);
    }

    public static List<User> getUsers() {
        return users;
    }
}
