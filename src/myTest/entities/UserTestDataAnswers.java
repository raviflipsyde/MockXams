package myTest.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "MX_USER_TEST_DATA_ANSWERS",
uniqueConstraints = 
@UniqueConstraint(columnNames={"userTestDataId", "answerId"}))
public class UserTestDataAnswers implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 832879635711737178L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "user_test_answers_id")
	private long id;
	
	@OneToOne
	@JoinColumn(name="userTestDataId")
	private UserTestData userTestData;
	
	@OneToOne
	@JoinColumn(name="answerId")
	private Answer answer;
	
	@Column(name = "correct_answer", nullable = false)
	private String correctAnswer;
	
	@Column(name = "submitted_answer", nullable = false)
	private String submittedAnswer;
	
	@Column(name = "marks", nullable = false)
	private float marks;
	
	
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public UserTestData getUserTestData() {
		return userTestData;
	}

	public void setUserTestData(UserTestData userTestData) {
		this.userTestData = userTestData;
	}

	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public String getSubmittedAnswer() {
		return submittedAnswer;
	}

	public void setSubmittedAnswer(String submittedAnswer) {
		this.submittedAnswer = submittedAnswer;
	}

	public float getMarks() {
		return marks;
	}

	public void setMarks(float marks) {
		this.marks = marks;
	}

	
	
	
}
