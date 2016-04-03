package myTest.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import myTest.dao.QuestionDao;
import myTest.dao.QuestionSetDao;
import myTest.dao.TopicDao;
import myTest.entities.Question;
import myTest.entities.QuestionSet;
import myTest.entities.Topic;

public class QuestionManagerImpl implements QuestionManager {

	@Autowired
	private QuestionDao questionDAO;

	@Autowired
	private TopicDao topicDAO;

	@Autowired
	private QuestionSetDao qSetDAO;
	@Override
	public void addQuestion(Question question) {
		questionDAO.addQuestion(question);
	}

	@Override
	public List<Question> getAllQuestions() {
		return questionDAO.getAllQuestions();
	}

	@Override
	public List<Question> getAllQuestionsByTopic(String TopicName) {
		return questionDAO.getAllQuestionsByTopic(TopicName);
	}



	@Override
	public void deleteQuestion(Integer quesId) {
		questionDAO.deleteQuestion(quesId);

	}


	@Override
	public List<Topic> getAllTopics() {
		return topicDAO.getAllTopics();
	}



	@Override
	public void addTopic(Topic topic) {
		topicDAO.addTopic(topic);
	}




	public Map<String, Topic> getAllTopicsMap() {
		List<Topic> list = getAllTopics();
		HashMap<String , Topic> map = new HashMap<String, Topic>();
		for(Topic topic:list){
			map.put(topic.getTopicName(), topic);
		}
		return map;

	}





	@Override
	public Map<String, Question> getAllQuesstionsMap() {
		List<Question> list = getAllQuestions();
		Map<String,Question> map = new HashMap<String, Question>();
		for(Question q:list){
			map.put(q.getQuestionString(), q);
		}
		return map;
	}
	
	@Override
	public Map<Long, Question> getAllQuesstionsIdMap() {
		List<Question> list = getAllQuestions();
		Map<Long,Question> map = new HashMap<Long, Question>();
		for(Question q:list){
			map.put(q.getId(), q);
		}
		return map;
	}

	@Override
	public void addQuestionSet(QuestionSet questionSet) {
		qSetDAO.addQuestionSet(questionSet);
		
	}

	@Override
	public List<QuestionSet> getAllQuestionSet() {
		return qSetDAO.getAllQuestionSet();
		
	}

	@Override
	public Map<String, QuestionSet> getAllQuestionSetMap() {
		List<QuestionSet> qSetList = getAllQuestionSet();
		Map<String, QuestionSet> returnMap = new HashMap<String, QuestionSet>();
		for(QuestionSet qSet: qSetList){
			returnMap.put(qSet.toString(), qSet);
		}
		
		return returnMap;
	}

	@Override
	public List<Question> getAllQuestionsBySection(String SectionName) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
