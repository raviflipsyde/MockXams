package myTest.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.entities.Question;

public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addQuestion(Question question) {

		this.sessionFactory.getCurrentSession().save(question);

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Question> getAllQuestions() {
		System.out.println("in getallQuestions()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Question").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Question> getAllQuestionsByTag(String TagName) {
		System.out.println("in getallQuestions()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Question q ").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Question> getAllQuestionsByTopic(String TopicName) {
		System.out.println("in getallQuestionsByTopics()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Question q WHERE q.topic = :topic")
				.setParameter("topic", TopicName).list();

	}

	@Override
	@Transactional
	public void deleteQuestion(Integer quesId) {
		Question question = (Question) sessionFactory.getCurrentSession().load(
				Question.class, quesId);
		if (null != question) {
			this.sessionFactory.getCurrentSession().delete(question);
		}

	}

}
