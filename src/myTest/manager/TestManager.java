package myTest.manager;

import java.util.List;

import myTest.entities.Test1;
import myTest.entities.User;

public interface TestManager {

	public void addTest(Test1 test);
	
	public List<Test1> getAllTest();
	
	public Test1 getTestById(long id);
	
	public Test1 getTestByName(String testName);
	
	public void saveTestForUser(User user, Test1 test);
	
	public List<Test1> getTestsForUser(User user);
	
	public List<Test1> getAllActiveTest();
	
	public void activateTests(List<String> testNames);
	
	public void deactivateTests(List<String> testNames);
	}
