package myTest.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
@Table(name = "MX_ANSWER_TABLE")
public class Answer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5027740252202534083L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "answer_id")
	private long id;
	
	@OneToOne(fetch=FetchType.EAGER)	
	private Question question;
	
	@Column(name = "answer_correct_ans", nullable = false)
	private String correctAnswer;
	
	@Column(name = "answer_explaination", nullable = true)
	private String description;

	@Column(name = "answer_correct_marks", nullable = false)
	private float correctMarks;

	@Column(name = "answer_incorrect_marks", nullable = false)
	private float incorrectMarks;



	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getCorrectMarks() {
		return correctMarks;
	}

	public void setCorrectMarks(float correctMarks) {
		this.correctMarks = correctMarks;
	}

	public float getIncorrectMarks() {
		return incorrectMarks;
	}

	public void setIncorrectMarks(float incorrectMarks) {
		this.incorrectMarks = incorrectMarks;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((correctAnswer == null) ? 0 : correctAnswer.hashCode());
		result = prime * result
				+ ((question == null) ? 0 : question.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Answer other = (Answer) obj;
		if (correctAnswer == null) {
			if (other.correctAnswer != null)
				return false;
		} else if (!correctAnswer.equals(other.correctAnswer))
			return false;
		if (question == null) {
			if (other.question != null)
				return false;
		} else if (!question.equals(other.question))
			return false;
		return true;
	}
	
	
}
