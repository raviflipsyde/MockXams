package myTest.dao;

import java.util.List;

import myTest.entities.Question;

public interface QuestionDao {
	public void addQuestion(Question question);
    public List<Question> getAllQuestions();
    public List<Question> getAllQuestionsByTag(String TagName);
    public List<Question> getAllQuestionsByTopic(String TopicName);

    public void deleteQuestion(Integer quesId);
}
