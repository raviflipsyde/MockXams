package myTest.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.entities.Topic;

public class TopicDaoImpl implements TopicDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void addTopic(Topic topic) {
		this.sessionFactory.getCurrentSession().save(topic);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Topic> getAllTopics() {
		System.out.println("in getAllTopics()");
		return this.sessionFactory.getCurrentSession()
				.createQuery("FROM Topic").list();
	}

	@Override
	@Transactional
	
	public void deleteTopic(Integer topicId) {
		Topic topic = (Topic) sessionFactory.getCurrentSession().load(
				Topic.class, topicId);
		if (null != topic) {
			this.sessionFactory.getCurrentSession().delete(topic);
		}

	}

}
