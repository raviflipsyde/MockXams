package myTest.dao;

import java.util.List;

import myTest.entities.Question;
import myTest.entities.QuestionSet;

public interface QuestionSetDao {
	public void addQuestionSet(QuestionSet qSet);
	public void addQuestionToQuestionSet(Integer qSetId, Question question);
	public void addQuestionToQuestionSet(String  qSetName, Question question);
    public List<QuestionSet> getAllQuestionSet();
    public void deleteQuestionSet(Integer qSetId);
}
