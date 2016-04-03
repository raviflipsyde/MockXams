package myTest.dao;

import java.util.List;

import myTest.entities.Topic;

public interface TopicDao {
	public void addTopic(Topic topic);

	public List<Topic> getAllTopics();

	public void deleteTopic(Integer topicId);
}
