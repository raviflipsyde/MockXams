package myTest.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.dao.AnswersDao;
import myTest.dao.UserTestDataAnswersDao;
import myTest.dao.UserTestDataDao;
import myTest.entities.Answer;
import myTest.entities.Question;
import myTest.entities.UserTestDataAnswers;

public class UserTestDataAnswersManagerImpl implements
		UserTestDataAnswersManager {

	@Autowired
	private UserTestDataAnswersDao userTestDataAnswersDao;

	@Autowired
	private UserTestDataDao userTestDataDao;
	
	@Autowired
	private AnswersDao answersDao;



	private HashMap<Long, String> answerStringMap;

	private HashMap<Long, Float> answerStringRightScore;
	private HashMap<Long, Float> answerStringWrongScore;

	@Override
	@Transactional
	public void addUserTestDataAnswers(UserTestDataAnswers userTestDataAnswers) {

		userTestDataAnswersDao.addUserTestDataAnswers(userTestDataAnswers);

	}

	
	@Override
	@Transactional
	public Map<Long, Answer> getAnswersByTestId(Map<Long, Question> qMap) {

		return answersDao.getAnswersByTestId(qMap);

	}
	
	
	@Override
	@Transactional
	public void updateUSerTestDataAnswers(
			UserTestDataAnswers userTestDataAnswers) {
		userTestDataAnswersDao.updateUSerTestDataAnswers(userTestDataAnswers);
	}

	@Override
	@Transactional
	public void deleteUserTestDataAnswers(Integer userTestDataAnswersId) {
		userTestDataAnswersDao.deleteUserTestDataAnswers(userTestDataAnswersId);

	}

	@Override
	@Transactional
	public List<UserTestDataAnswers> getUserTestDataAnswersByUserTestDataId(
			long userTestDataId) {
		return userTestDataAnswersDao
				.getUserTestDataAnswersByUserTestDataId(userTestDataId);
	}

	@Override
	@Transactional
	public void saveUserTestAnswers(long userTestDataId, long answerId,
			String answertOption, String requestType) {

		// Initialize the maps for the first Time.
		if (answerStringMap == null || answerStringMap.size() <= 0) {
			answerStringMap = new HashMap<Long, String>();
			answerStringRightScore = new HashMap<Long, Float>();
			answerStringWrongScore = new HashMap<Long, Float>();

			List<Answer> ansList = answersDao.getAllAnswers();
			Long key = null;
			String ansString = null;
			Float ansRightScore = null;
			Float ansWrongScore = null;
			for (Answer ans : ansList) {
				key = ans.getQuestion().getId();
				ansString = ans.getCorrectAnswer();
				ansRightScore = ans.getCorrectMarks();
				ansWrongScore = ans.getIncorrectMarks();

				answerStringMap.put(key, ansString);
				answerStringRightScore.put(key, ansRightScore);
				answerStringWrongScore.put(key, ansWrongScore);
			}
		}

		// req for persistgence
		String correctAnswer = answerStringMap.get(answerId);
		float marks = 0;
		if (answertOption.equalsIgnoreCase(correctAnswer)) {
			marks = answerStringRightScore.get(answerId);
		} else {
			marks = answerStringWrongScore.get(answerId);
		}
try{
		if(requestType.equalsIgnoreCase("1")){
			userTestDataAnswersDao.saveUserTestDataAnswer(userTestDataId, answerId, answertOption, correctAnswer, marks);	
		}
		else if(requestType.equalsIgnoreCase("2")){
			userTestDataAnswersDao.updateUserTestDataAnswer(userTestDataId, answerId, answertOption, correctAnswer, marks);
		}
		else if(requestType.equalsIgnoreCase("3")){
			userTestDataAnswersDao.deleteUserTestDataAnswer(userTestDataId, answerId, answertOption, correctAnswer, marks);
		}
		
}
catch(Exception e){
	e.printStackTrace();
}
		

	}


	@Override
	@Transactional
	public float getUserTestDataMarks(long test1Id, long userId) {
		userTestDataDao.getUserTestDataMarks(test1Id, userId);
		return 0;
	}
	
	



}
