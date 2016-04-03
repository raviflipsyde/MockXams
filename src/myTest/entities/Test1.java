package myTest.entities;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
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
@Table(name = "MX_TEST1_DATA")
public class Test1 implements TestInterface, Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "test1_id")
	private long id;
	
	@Column(name = "test_name", nullable = false)
	private String TestName;
	
	@Column(name = "test_duration", nullable = false)
	private int testDuration;
	
	@Column(name = "test_status", nullable = false)
	private int testStatus;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "QUESTION_SETS"
		, joinColumns = { @JoinColumn(name = "test1_id") }
		, inverseJoinColumns = { @JoinColumn(name = "qset_id") })

	private List<QuestionSet> qSet;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTestName() {
		return TestName;
	}

	public void setTestName(String testName) {
		TestName = testName;
	}

	public int getTestDuration() {
		return testDuration;
	}

	public void setTestDuration(int testDuration) {
		this.testDuration = testDuration;
	}

	public List<QuestionSet> getqSet() {
		return qSet;
	}

	public void setqSet(List<QuestionSet> qSet) {
		this.qSet = qSet;
	}
	
	

	public int getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(int testStatus) {
		this.testStatus = testStatus;
	}

	public HashMap<String,QuestionSet> getQSetMap(){
		List<QuestionSet> thisQSet = getqSet();
		HashMap<String , QuestionSet> returnMap = new HashMap<String, QuestionSet>();
		for(QuestionSet qs:thisQSet){
			returnMap.put(qs.getQuestionSetName(), qs);
		}
	if (returnMap.size()>0) return returnMap; else return null;
	
	}
	
	
}
