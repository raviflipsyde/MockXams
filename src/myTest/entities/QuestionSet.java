package myTest.entities;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "MX_QUESTION_SET_DATA")
public class QuestionSet implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "question_set_id")
	private long id;

	@Column(name = "questionSetName")
	private String questionSetName;
	
	@Column(name = "questionSetDisplayName")
	private String questionSetDisplayName;

	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "QUESTION_SET_QUESTIONS", joinColumns = { @JoinColumn(name = "question_set_id") }, inverseJoinColumns = { @JoinColumn(name = "question_id") })
	private List<Question> questions;

	public String getQuestionSetName() {
		return questionSetName;
	}

	public void setQuestionSetName(String questionSetName) {
		this.questionSetName = questionSetName;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getQuestionSetDisplayName() {
		return questionSetDisplayName;
	}

	public void setQuestionSetDisplayName(String questionSetDisplayName) {
		this.questionSetDisplayName = questionSetDisplayName;
	}

	public Map<String, Question> getQuestionSetAsMap(){
		Map<String, Question> returnMap = new HashMap<String, Question>();
		List<Question> qList = getQuestions();
		Collections.sort(qList);
		int i = 1;
		for(Question q:qList){
			returnMap.put(Integer.toString(i), q);
		}
		return returnMap;
	}

	@Override
	public String toString() {
		return questionSetName;
	}
	
	
}
