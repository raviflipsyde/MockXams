package myTest.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import myTest.dao.QuestionSetDao;
import myTest.dao.Test1Dao;
import myTest.dao.TopicDao;
import myTest.entities.Test1;
import myTest.entities.User;

public class TestManagerImpl implements TestManager {

	@Autowired
	private Test1Dao testDAO;

	@Autowired
	private TopicDao topicDAO;

	@Autowired
	private QuestionSetDao qSetDAO;
	
	@Override
	public void addTest(Test1 test) {
		testDAO.addTest1(test);
		
	}
	@Override
	public List<Test1> getAllTest() {
		return testDAO.getAllTest1();
	}
	@Override
	public Test1 getTestById(long id) {
		
		return testDAO.getTest1ById(id);
	}
	@Override
	public Test1 getTestByName(String testName) {
		
		return testDAO.getTest1ByName(testName);
	}
	@Override
	public void saveTestForUser(User user, Test1 test) {
		// TODO Auto-generated method stub
		System.out.println(" in saveTestForUser");
		
	}
	@Override
	public List<Test1> getTestsForUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Test1> getAllActiveTest() {
		return testDAO.getAllActiveTest1();
	}
	@Override
	public void activateTests(List<String> testNames) {
		 testDAO.activateTests(testNames);
		
	}
	@Override
	public void deactivateTests(List<String> testNames) {
		 testDAO.deactivateTests(testNames);
		
	}
	
	
		
	
}
