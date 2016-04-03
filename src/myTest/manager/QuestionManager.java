package myTest.manager;

import java.util.List;
import java.util.Map;

import myTest.entities.Question;
import myTest.entities.QuestionSet;
import myTest.entities.Topic;

public interface QuestionManager {

	public void addQuestion(Question question);
	
	public void addQuestionSet(QuestionSet questionSet);

	public List<Question> getAllQuestions();

	public List<Question> getAllQuestionsByTopic(String TopicName);

	public List<Question> getAllQuestionsBySection(String SectionName);

	public void deleteQuestion(Integer quesId);



	public List<Topic> getAllTopics();


	
	public void addTopic(Topic topic);
	


	
	public Map<String, Topic> getAllTopicsMap(); 


	
	public Map<String, Question> getAllQuesstionsMap();
	
	public Map<Long, Question> getAllQuesstionsIdMap();
	
	public List<QuestionSet> getAllQuestionSet();
	
	public Map<String, QuestionSet> getAllQuestionSetMap();
}
