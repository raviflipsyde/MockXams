package myTest.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.entities.UserTestData;

public class UserTestDataDaoImpl implements UserTestDataDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addUserTestData(UserTestData userTestData) {
		this.sessionFactory.getCurrentSession().save(userTestData);

	}

	@Override
	@Transactional
	public void updateUSerTestData(UserTestData userTestData) {
		this.sessionFactory.getCurrentSession().update(userTestData);

	}

	@Override
	@Transactional
	public void deleteUserTestData(Integer userTestDataId) {

		UserTestData userTestData = (UserTestData) sessionFactory
				.getCurrentSession().load(UserTestData.class, userTestDataId);
		if (null != userTestData) {
			this.sessionFactory.getCurrentSession().delete(userTestData);
		}

	}

	@Override
	@Transactional
	public UserTestData getUserTestDataByUserIdTestId(long test1Id, long userId) {
		System.out.println("in getUserTestDataByUserIdTestId()");

		UserTestData returnList = (UserTestData) this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from UserTestData utd1 WHERE utd1.test.id= :test1Id AND utd1.user.id= :userId")
				.setLong("test1Id", test1Id).setLong("userId", userId)
				.uniqueResult();
		return returnList;
	}

	@Override
	@Transactional
	public List<UserTestData> getUserTestDataByTestId(long test1Id) {
		System.out.println("in getUserTestDataByTestId()");
		List<UserTestData> returnList = (List<UserTestData>) this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from UserTestData utd1 WHERE utd1.test.id= :test1Id")
				.setLong("test1Id", test1Id).list();

		return returnList;
	}

	@Override
	@Transactional
	public List<UserTestData> getUserTestDataByUserId(long userId) {
		System.out.println("in getUserTestDataByUserId()");
		List<UserTestData> returnList = this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from UserTestData utd1 WHERE utd1.user.id= :userId")
				.setLong("userId", userId).list();

		return returnList;

	}

	@Override
	@Transactional
	public List<UserTestData> getActiveUserTestDataByUserId(long userId) {
		System.out.println("in getActiveUserTestDataByUserId()");
		List<UserTestData> returnList = this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from UserTestData utd1 WHERE utd1.user.id= :userId "
								+ "and utd1.test.testStatus = :testStatus "
								+ "and utd1.resultStatus = :resultStatus ")
				.setLong("userId", userId).setLong("testStatus", 1)
				.setLong("resultStatus", 1).list();

		return returnList;

	}

	@Override
	@Transactional
	public float getUserTestDataMarks(long test1Id, long userId) {

		List result = this.sessionFactory
				.getCurrentSession()
				.createSQLQuery(
						"Select sum(utda1.marks) from mx_user_test_data_answers utda1, mx_user_test_data utd1"
								+ " where utda1.userTestDataId = utd1.user_test_id"
								+ " and utd1.test_test1_id = ?"
								+ " and utd1.user_user_id = ?")
				.setLong(0, test1Id).setLong(1, userId).list();
		double output = (double) result.get(0);
		float op = (float) output;

		String hqlInsert = "update mx_user_test_data "
				+ "set test_score= ?, result_status= ?  "
				+ "where user_user_id = ? and test_test1_id = ?";
		int createdEntities = this.sessionFactory.getCurrentSession()
				.createSQLQuery(hqlInsert).setFloat(0, op).setLong(1, 1L)
				.setLong(2, userId).setLong(3, test1Id).executeUpdate();

		return op;

	}

	@Override
	@Transactional
	public void deleteUserTestData(long test1Id, long userId) {
		UserTestData utd = getUserTestDataByUserIdTestId(test1Id, userId);
		int id = (int) utd.getId();
		deleteUserTestData(id);

	}

}
