package myTest.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "MX_USER_TEST_DATA")
public class UserTestData implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4301677551239391760L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "user_test_id")
	private long id;
	
	@OneToOne
	private User user;
	
	@OneToOne	
	private Test1 test;
	
	@Column(name = "test_score", nullable = false)
	private float score;
	
	@Column(name = "result_status", nullable = false)
	private int resultStatus;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "test_date", nullable = false)
	private Date date;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Test1 getTest() {
		return test;
	}

	public void setTest(Test1 test) {
		this.test = test;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getResultStatus() {
		return resultStatus;
	}

	public void setResultStatus(int resultStatus) {
		this.resultStatus = resultStatus;
	}
	
	
	
	
}
