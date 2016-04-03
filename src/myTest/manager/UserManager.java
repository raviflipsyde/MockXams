package myTest.manager;

import java.util.List;

import myTest.entities.User;







public interface UserManager {

	public void addUser(User user);
    public List<User> getAllUsers();
    public void deleteUser(Integer userId);
    public User getUserByUsername(String uname);
}
