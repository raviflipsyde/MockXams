package myTest.dao;

import java.util.List;

import myTest.entities.User;

public interface UserDao {
	public void addUser(User user);
    public List<User> getAllUsers();
    public void deleteUser(Integer userId);
	public User getUserByUsername(String uname);
	User getUserByEmail(String email);
	User getUserByContactNo(String contactNo);
}
