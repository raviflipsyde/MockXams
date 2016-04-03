package myTest.dao;

import java.util.List;

import myTest.entities.QuestionSet;
import myTest.entities.Test1;

public interface Test1Dao {
	public void addTest1(Test1 test);

	public List<Test1> getAllTest1();

	public Test1 getTest1ById(long test1Id);

	public Test1 getTest1ByName(String test1Name);

	public void addQuestionSetToTest(QuestionSet qSet);

	public void deleteTest1(Integer test1Id);

	public List<Test1> getAllActiveTest1();

	public void activateTests(List<String> testNames);

	public void deactivateTests(List<String> testNames);
	
}
