package myTest.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.entities.QuestionSet;
import myTest.entities.Test1;

public class Test1DaoImpl implements Test1Dao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addTest1(Test1 test) {
		this.sessionFactory.getCurrentSession().save(test);
	}

	@Transactional
	public void updateTest1(Test1 test) {
		this.sessionFactory.getCurrentSession().update(test);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Test1> getAllTest1() {
		System.out.println("in getAllTest1()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Test1").list();
	}

	@Override
	@Transactional
	public Test1 getTest1ById(long test1Id) {
		System.out.println("in getAllTest1()");
		return (Test1) this.sessionFactory.getCurrentSession()
				.createQuery("from Test1 t1 WHERE t1.id= :id")
				.setLong("id", test1Id).uniqueResult();

	}
	
		
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Test1> getAllActiveTest1() {
		System.out.println("in getAllActiveTest1()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Test1 t1 WHERE t1.testStatus= :status")
				.setLong("status", 1).list();
	}
	

	@Override
	@Transactional
	public Test1 getTest1ByName(String test1Name) {
		System.out.println("in getAllTest1()");
		return (Test1) this.sessionFactory.getCurrentSession()
				.createQuery("from Test1 t1 WHERE t1.TestName= :testName")
				.setString("testName", test1Name).uniqueResult();

	}

	@Override
	@Transactional
	public void addQuestionSetToTest(QuestionSet qSet) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public void deleteTest1(Integer test1Id) {

		Test1 test = (Test1) sessionFactory.getCurrentSession().load(
				Test1.class, test1Id);
		if (null != test) {
			this.sessionFactory.getCurrentSession().delete(test);
		}
	}

	@Override
	@Transactional
	public void activateTests(List<String> testNames) {
		
		String sqlUpdate = "update mx_test1_data "
				+ "set test_status= ?  "
				+ "where test_name = ? ";
		for(String tName: testNames){
		int createdEntities = this.sessionFactory.getCurrentSession()
				.createSQLQuery(sqlUpdate).setLong(0, 1)
				.setString(1, tName).executeUpdate();
		}
		
		


	}

	@Override
	@Transactional
	public void deactivateTests(List<String> testNames) {
		String sqlUpdate = "update mx_test1_data "
				+ "set test_status= ?  "
				+ "where test_name = ? ";
		for(String tName: testNames){
		int createdEntities = this.sessionFactory.getCurrentSession()
				.createSQLQuery(sqlUpdate).setLong(0, 2)
				.setString(1, tName).executeUpdate();
		}
		
	}

}
