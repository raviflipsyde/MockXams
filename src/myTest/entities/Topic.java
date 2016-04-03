package myTest.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MX_TOPIC_MASTER_TABLE")
public class Topic implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5027740252202534083L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "topic_id")
	private long id;
	@Column(name = "topic_name", nullable = false)
	private String topicName;
	@Column(name = "topic_description", nullable = true)
	private String description;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return  topicName ;
	}

	
}
