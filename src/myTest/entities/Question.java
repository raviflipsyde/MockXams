package myTest.entities;


import java.io.Serializable;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "MX_QUESTION_TABLE")
public class Question implements QuestionInterface, Serializable,
		Comparable<Question> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "question_id")
	private long id;

	@OneToOne
	private Topic topic;

	@Column(name = "question_no", nullable = false)
	private int questionNumber;
	
	@OneToOne
	private QuestionType qtype;
	
	@Transient
	private String q_status;
	
	
	@Column(name = "question_string", nullable = false)
	private String questionString;

	
	@Column(name = "question_Difficulty", nullable = false)
	private int levelOfDifficulty;
	
	
	// @ElementCollection
	// @OneToMany(cascade = CascadeType.ALL)
	// @JoinColumn(name = "ID")
	// // @JoinTable(name = "ANSWER_OPTIONS", joinColumns = { @JoinColumn(name =
	// "question_id") } })
	@LazyCollection(LazyCollectionOption.FALSE)
	@ElementCollection()
	@CollectionTable(name = "ANSWER_OPTIONS", joinColumns = @JoinColumn(name = "question_id"))
	@Column(name = "options")
	private Set<String> answerOptions;
	
	@Transient
	private String answerString;
	

	public Question() {
		super();
		this.setQ_status("NA");
		this.setAnswerString(" ");
	}

	public String getAnswerString() {
		return answerString;
	}

	public void setAnswerString(String answerString) {
		this.answerString = answerString;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public String getQuestionString() {
		return questionString;
	}

	public void setQuestionString(String questionString) {
		this.questionString = questionString;
	}


	public Set<String> getAnswerOptions() {
		return answerOptions;
	}

	public void setAnswerOptions(Set<String> answerOptions) {
		this.answerOptions = answerOptions;
	}

	@Override
	public String toString() {
		return questionString;
	}

	@Override
	public int compareTo(Question question) {

		return ((Long) getId()).compareTo(question.getId());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	
	public int getQuestionNumber() {
		return questionNumber;
	}

	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}

	public QuestionType getQtype() {
		return qtype;
	}

	public void setQtype(QuestionType qtype) {
		this.qtype = qtype;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	
	public int getLevelOfDifficulty() {
		return levelOfDifficulty;
	}

	public void setLevelOfDifficulty(int levelOfDifficulty) {
		this.levelOfDifficulty = levelOfDifficulty;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Question other = (Question) obj;
		if (id != other.id)
			return false;
		return true;
	}

	
}
