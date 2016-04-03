package myTest.dao;

import java.util.List;




import myTest.entities.User;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;





public class UserDaoImpl implements UserDao {

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void addUser(User user) {
		System.out.println("in addUser");
		this.sessionFactory.getCurrentSession().save(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> getAllUsers() {
		System.out.println("in getallusers()");
		sessionFactory.getCurrentSession().get(User.class, 1L);
		return this.sessionFactory.getCurrentSession().createQuery("from User").list();
	}
	
	@Override
	@Transactional
	public User getUserByUsername(String uname) {
		System.out.println("in getallusers()");
		sessionFactory.getCurrentSession().get(User.class, 1L);
		return (User) this.sessionFactory.getCurrentSession().createQuery("from User where userName = :uname").setString("uname", uname).uniqueResult();
	}
	
	@Override
	@Transactional
	public User getUserByEmail(String email) {
		System.out.println("in getallusers()");
		sessionFactory.getCurrentSession().get(User.class, 1L);
		return (User) this.sessionFactory.getCurrentSession().createQuery("from User where emailId = :email").setString("email", email).uniqueResult();
	}
	
	@Override
	@Transactional
	public User getUserByContactNo(String contactNo) {
		System.out.println("in getallusers()");
		sessionFactory.getCurrentSession().get(User.class, 1L);
		return (User) this.sessionFactory.getCurrentSession().createQuery("from User where contactNo = :contactNo").setString("contactNo", contactNo).uniqueResult();
	}
	
	

	@Override
	@Transactional
	public void deleteUser(Integer userId) {
		User user = (User) sessionFactory.getCurrentSession().load(
				User.class, userId);
        if (null != user) {
            this.sessionFactory.getCurrentSession().delete(user);
        }

	}

}
