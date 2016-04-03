package myTest.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.entities.Question;
import myTest.entities.QuestionSet;

public class QuestionSetDaoImpl implements QuestionSetDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addQuestionSet(QuestionSet qSet) {
		this.sessionFactory.getCurrentSession().save(qSet);

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<QuestionSet> getAllQuestionSet() {
		System.out.println("in getAllQuestionSet()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("from QuestionSet").list();
	}

	@Override
	@Transactional
	public void deleteQuestionSet(Integer qSetId) {

		QuestionSet questionSet = (QuestionSet) sessionFactory
				.getCurrentSession().load(QuestionSet.class, qSetId);
		if (null != questionSet) {
			this.sessionFactory.getCurrentSession().delete(questionSet);
		}
	}

	@Override
	@Transactional
	public void addQuestionToQuestionSet(Integer qSetId, Question question) {
		System.out.println("in addQuestionToQuestionSet()");
		QuestionSet qSet = (QuestionSet) this.sessionFactory
				.getCurrentSession().get(QuestionSet.class, qSetId);
		qSet.getQuestions().add(question);

	}

	@Override
	@Transactional
	public void addQuestionToQuestionSet(String qSetName, Question question) {
		System.out.println("in addQuestionToQuestionSet()");
		// Query query = (Query) this.sessionFactory.getCurrentSession()
		// .createQuery("from QuestionSet q WHERE q.questionSetName= :qSetName ");
		// query.setString("qSetName", qSetName);
		QuestionSet qSet = (QuestionSet) this.sessionFactory
				.getCurrentSession()
				.createQuery(
						"from QuestionSet q WHERE q.questionSetName= :qSetName ")
				.setString("qSetName", qSetName).uniqueResult();
		qSet.getQuestions().add(question);

	}

}
