package myTest.manager;

import java.util.List;










import myTest.dao.UserDao;
import myTest.entities.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;





public class UserManagerImpl implements UserManager {

	@Autowired
    private UserDao userDAO;
	
	@Override
	@Transactional
	public void addUser(User user) {
		User user1 = userDAO.getUserByUsername(user.getUserName());
		User user2 = userDAO.getUserByEmail(user.getEmailId());
		User user3 = userDAO.getUserByContactNo(user.getContactNo());
		user.setAccessLevel(2);
		if(user1 == null && user2 == null && user3 == null){
		userDAO.addUser(user);
		}
		else{
			System.out.println("Data repetation.....!!!");
		}
	}

	@Override
	@Transactional
	public List<User> getAllUsers() {
		return userDAO.getAllUsers();
	}

	@Override
	@Transactional
	public void deleteUser(Integer userId) {
		userDAO.deleteUser(userId);

	}
	
	 public void setUserDAO(UserDao userDAO) {
	        this.userDAO= userDAO;
	    }

	@Override
	public User getUserByUsername(String uname) {
	return	userDAO.getUserByUsername(uname);
	}

}
