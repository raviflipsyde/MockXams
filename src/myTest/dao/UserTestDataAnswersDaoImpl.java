package myTest.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.entities.UserTestDataAnswers;

public class UserTestDataAnswersDaoImpl implements UserTestDataAnswersDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addUserTestDataAnswers(UserTestDataAnswers userTestDataAnswers) {
		this.sessionFactory.getCurrentSession().save(userTestDataAnswers);

	}

	@Override
	@Transactional
	public void updateUSerTestDataAnswers(
			UserTestDataAnswers userTestDataAnswers) {
		this.sessionFactory.getCurrentSession().update(userTestDataAnswers);

	}

	@Override
	@Transactional
	public void deleteUserTestDataAnswers(Integer userTestDataAnswersId) {

		UserTestDataAnswers userTestDataAnswers = (UserTestDataAnswers) sessionFactory
				.getCurrentSession().load(UserTestDataAnswers.class,
						userTestDataAnswersId);
		if (null != userTestDataAnswers) {
			this.sessionFactory.getCurrentSession().delete(userTestDataAnswers);
		}

	}

	@Override
	@Transactional
	public List<UserTestDataAnswers> getUserTestDataAnswersByUserTestDataId(
			long userTestDataId) {
		System.out.println("in getUserTestDataAnswersByUserTestDataId()");

		List<UserTestDataAnswers> returnList = (List<UserTestDataAnswers>) this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from UserTestDataAnswers utda1 WHERE utda1.userTestData.id= :userTestDataId")
				.setLong("userTestDataId", userTestDataId).list();

		return returnList;
	}

	@Override
	@Transactional
	public void saveUserTestDataAnswer(long userTestId, long answerId,
			String answertOption, String correctAns, float marks) {

		String hqlInsert = "insert into mx_user_test_data_answers "
				+ "(userTestDataId,answerId,submitted_answer,correct_answer, marks) "
				+ "values (?,?,?,?,?)";
		int createdEntities = this.sessionFactory.getCurrentSession()
				.createSQLQuery(hqlInsert).setLong(0, userTestId)
				.setLong(1, answerId).setString(2, answertOption)
				.setString(3, correctAns).setFloat(4, marks).executeUpdate();

	}

	@Override
	@Transactional
	public void updateUserTestDataAnswer(long userTestId, long answerId,
			String answertOption, String correctAns, float marks) {

		String hqlInsert = "update mx_user_test_data_answers "
				+ "set submitted_answer= ? ,correct_answer = ?, marks = ? "
				+ "where userTestDataId = ? and answerId = ?";
		int createdEntities = this.sessionFactory.getCurrentSession()
				.createSQLQuery(hqlInsert).setString(0, answertOption)
				.setString(1, correctAns).setFloat(2, marks)
				.setLong(3, userTestId).setLong(4, answerId).executeUpdate();

	}

	@Override
	@Transactional
	public void deleteUserTestDataAnswer(long userTestId, long answerId,
			String answertOption, String correctAns, float marks) {

		String hqlInsert = "delete from mx_user_test_data_answers "
				+ "where userTestDataId = ? and answerId = ?";
		int createdEntities = this.sessionFactory.getCurrentSession()
				.createSQLQuery(hqlInsert).setLong(0, userTestId)
				.setLong(1, answerId).executeUpdate();

	}

}
