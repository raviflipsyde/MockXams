package myTest.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.entities.Answer;
import myTest.entities.Question;

public class AnswersDaoImpl implements AnswersDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addAnswer(Answer answer) {
		this.sessionFactory.getCurrentSession().save(answer);
	}

	@Override
	@Transactional
	public void updateAnswer(Answer answer) {
		this.sessionFactory.getCurrentSession().update(answer);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Answer> getAllAnswers() {
		System.out.println("in getAllTest1()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("from Answer").list();
	}

	@Override
	@Transactional
	public Answer getAnswerById(long answerID) {
		System.out.println("in getAllTest1()");
		return (Answer) this.sessionFactory.getCurrentSession()
				.createQuery("from Answer t1 WHERE t1.id= :id")
				.setLong("id", answerID).uniqueResult();

	}

	@Override
	@Transactional
	public Answer getAnswerByQuestionId(long questionID) {
		System.out.println("in getAllTest1()");
		return (Answer) this.sessionFactory.getCurrentSession()
				.createQuery("from Answer t1 WHERE t1.question.id= :id")
				.setLong("id", questionID).uniqueResult();

	}

	
	@Override
	@Transactional
	public void deleteAnswer(Integer answerId) {

		Answer answer = (Answer) sessionFactory.getCurrentSession().load(
				Answer.class, answerId);
		if (null != answer) {
			this.sessionFactory.getCurrentSession().delete(answer);
		}
	}

	@Override
	@Transactional
	public Map<Long, Answer> getAnswersByTestId(Map<Long, Question> qMap) {
		System.out.println("in getAnswersByTestId()");
		
		Map<Long, Answer> ansMap = new HashMap<Long, Answer>();
		Answer answer = null;
		Iterator<Long> iterator1 = qMap.keySet().iterator();
		while(iterator1.hasNext()){
			Long key = (Long) iterator1.next();
			answer = (Answer) this.sessionFactory.getCurrentSession()
					.createQuery("from Answer t1 WHERE t1.question.id= :id")
					.setLong("id", key).uniqueResult();
			ansMap.put(key, answer);
			
		}
		
		
		return ansMap;
	}
	
	
}
