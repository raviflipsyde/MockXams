package myTest.dao;

import java.util.List;
import java.util.Map;

import myTest.entities.Answer;
import myTest.entities.Question;

public interface AnswersDao {

	void addAnswer(Answer answer);

	List<Answer> getAllAnswers();

	void updateAnswer(Answer answer);

	Answer getAnswerById(long answerID);

	Answer getAnswerByQuestionId(long questionID);

	void deleteAnswer(Integer answerId);	

	Map<Long, Answer> getAnswersByTestId(Map<Long, Question> qMap);
	
}
