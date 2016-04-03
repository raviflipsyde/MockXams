package myTest.manager;

import java.util.List;
import java.util.Map;

import myTest.entities.Answer;
import myTest.entities.Question;
import myTest.entities.UserTestDataAnswers;

public interface UserTestDataAnswersManager {

	void addUserTestDataAnswers(UserTestDataAnswers userTestDataAnswers);

	void updateUSerTestDataAnswers(UserTestDataAnswers userTestDataAnswers);

	void deleteUserTestDataAnswers(Integer userTestDataAnswersId);

	List<UserTestDataAnswers> getUserTestDataAnswersByUserTestDataId(
			long userTestDataId);

	void saveUserTestAnswers(long userTestDataId, long answerId,
			String answertOption, String requestType);

	Map<Long, Answer> getAnswersByTestId(Map<Long, Question> qMap);

	public float getUserTestDataMarks(long test1Id, long userId);
	

	
	
	}
