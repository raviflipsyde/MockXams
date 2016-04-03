package myTest.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MX_QUESTION_TYPE_MASTER_TABLE")
public class QuestionType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5027740252202534083L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "qtype_id")
	private long id;
	
	@Column(name = "qtype_name", nullable = false)
	private String questionType;
	
	@Column(name = "qtype_description", nullable = true)
	private String description;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return  questionType ;
	}

	
}
