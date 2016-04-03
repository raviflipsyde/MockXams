package myTest.dao;

import java.util.List;

import myTest.entities.UserTestDataAnswers;

public interface UserTestDataAnswersDao {

	void addUserTestDataAnswers(UserTestDataAnswers userTestDataAnswers);

	void updateUSerTestDataAnswers(UserTestDataAnswers userTestDataAnswers);

	void deleteUserTestDataAnswers(Integer userTestDataAnswersId);

	List<UserTestDataAnswers> getUserTestDataAnswersByUserTestDataId(
			long userTestDataId);

	

	void saveUserTestDataAnswer(long userTestId, long answerId,
			String answertOption, String correctAns, float marks);

	void updateUserTestDataAnswer(long userTestId, long answerId,
			String answertOption, String correctAns, float marks);

	void deleteUserTestDataAnswer(long userTestId, long answerId,
			String answertOption, String correctAns, float marks);

}
