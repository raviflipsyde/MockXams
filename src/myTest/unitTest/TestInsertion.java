package myTest.unitTest;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import myTest.entities.Answer;
import myTest.entities.Question;
import myTest.entities.QuestionSet;
import myTest.entities.QuestionType;
import myTest.entities.Test1;
import myTest.entities.Topic;
import myTest.entities.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class TestInsertion {

	public static void main(String[] args) {
		
		
// ---------------DATA CREATION START--------------------------//
		
		
		Topic phy1 = new Topic(); Topic phy2 = new Topic(); Topic phy3 = new Topic();		
		Topic chem1 = new Topic(); Topic chem2 = new Topic(); Topic chem3 = new Topic();
		Topic math1 = new Topic(); Topic math2 = new Topic(); Topic math3 = new Topic();
		
		phy1.setTopicName("Phy1"); phy1.setDescription("Phy1");
		phy2.setTopicName("Phy2"); phy2.setDescription("Phy2");
		phy3.setTopicName("Phy3"); phy3.setDescription("Phy3");
		
		chem1.setTopicName("Chem1"); chem1.setDescription("Chem1");
		chem2.setTopicName("Chem2"); chem2.setDescription("Chem2");
		chem3.setTopicName("Chem3"); chem3.setDescription("Chem3");
		
		math1.setTopicName("Math1"); math1.setDescription("Math1");
		math2.setTopicName("Math2"); math2.setDescription("Math2");
		math3.setTopicName("Math3"); math3.setDescription("Math3");

		QuestionType qtype1 = new QuestionType();
		qtype1.setQuestionType("Multiple Choice Qusstion");
		qtype1.setDescription("Multiple Choice Qusstion");
		
		Set<String> answerOptions = new HashSet<String>();
		answerOptions.add("Option A");answerOptions.add("Option B");answerOptions.add("Option C");
		answerOptions.add("Option D");answerOptions.add("None Of the Above");
		
		Question qp1 = new Question(); Question qp2 = new Question(); Question qp3 = new Question();
		Question qp4 = new Question(); Question qp5 = new Question(); Question qp6 = new Question();
		Question qp7 = new Question(); Question qp8 = new Question(); Question qp9 = new Question();
		Question qc1 = new Question(); Question qc2 = new Question(); Question qc3 = new Question();
		Question qc4 = new Question(); Question qc5 = new Question(); Question qc6 = new Question();
		Question qc7 = new Question(); Question qc8 = new Question(); Question qc9 = new Question();
		Question qm1 = new Question(); Question qm2 = new Question(); Question qm3 = new Question();
		Question qm4 = new Question(); Question qm5 = new Question(); Question qm6 = new Question();
		Question qm7 = new Question(); Question qm8 = new Question(); Question qm9 = new Question();
		
		
		Answer ap1 = new Answer();Answer ap2 = new Answer();Answer ap3 = new Answer();
		Answer ap4 = new Answer();Answer ap5 = new Answer();Answer ap6 = new Answer();
		Answer ap7 = new Answer();Answer ap8 = new Answer();Answer ap9 = new Answer();
		
		Answer ac1 = new Answer();Answer ac2 = new Answer();Answer ac3 = new Answer();
		Answer ac4 = new Answer();Answer ac5 = new Answer();Answer ac6 = new Answer();
		Answer ac7 = new Answer();Answer ac8 = new Answer();Answer ac9 = new Answer();
		
		Answer am1 = new Answer();Answer am2 = new Answer();Answer am3 = new Answer();
		Answer am4 = new Answer();Answer am5 = new Answer();Answer am6 = new Answer();
		Answer am7 = new Answer();Answer am8 = new Answer();Answer am9 = new Answer();
		
		
		qp1.setQtype(qtype1); qp1.setTopic(phy1); qp1.setQuestionNumber(1);qp1.setAnswerOptions(answerOptions); qp1.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY1");
		qp2.setQtype(qtype1); qp2.setTopic(phy2); qp2.setQuestionNumber(2);qp2.setAnswerOptions(answerOptions); qp2.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY2");
		qp3.setQtype(qtype1); qp3.setTopic(phy3); qp3.setQuestionNumber(3);qp3.setAnswerOptions(answerOptions); qp3.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY3");
		qp4.setQtype(qtype1); qp4.setTopic(phy1); qp4.setQuestionNumber(4);qp4.setAnswerOptions(answerOptions); qp4.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY4");
		qp5.setQtype(qtype1); qp5.setTopic(phy2); qp5.setQuestionNumber(5);qp5.setAnswerOptions(answerOptions); qp5.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY5");
		qp6.setQtype(qtype1); qp6.setTopic(phy3); qp6.setQuestionNumber(6);qp6.setAnswerOptions(answerOptions); qp6.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY6");
		qp7.setQtype(qtype1); qp7.setTopic(phy1); qp7.setQuestionNumber(7);qp7.setAnswerOptions(answerOptions); qp7.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY7");
		qp8.setQtype(qtype1); qp8.setTopic(phy2); qp8.setQuestionNumber(8);qp8.setAnswerOptions(answerOptions); qp8.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY8");
		qp9.setQtype(qtype1); qp9.setTopic(phy3); qp9.setQuestionNumber(9);qp9.setAnswerOptions(answerOptions); qp9.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.PHY9");
		
		qc1.setQtype(qtype1); qc1.setTopic(chem1); qc1.setQuestionNumber(1);qc1.setAnswerOptions(answerOptions); qc1.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM1");
		qc2.setQtype(qtype1); qc2.setTopic(chem2); qc2.setQuestionNumber(2);qc2.setAnswerOptions(answerOptions); qc2.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM2");
		qc3.setQtype(qtype1); qc3.setTopic(chem3); qc3.setQuestionNumber(3);qc3.setAnswerOptions(answerOptions); qc3.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM3");
		qc4.setQtype(qtype1); qc4.setTopic(chem1); qc4.setQuestionNumber(4);qc4.setAnswerOptions(answerOptions); qc4.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM4");
		qc5.setQtype(qtype1); qc5.setTopic(chem2); qc5.setQuestionNumber(5);qc5.setAnswerOptions(answerOptions); qc5.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM5");
		qc6.setQtype(qtype1); qc6.setTopic(chem3); qc6.setQuestionNumber(6);qc6.setAnswerOptions(answerOptions); qc6.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM6");
		qc7.setQtype(qtype1); qc7.setTopic(chem1); qc7.setQuestionNumber(7);qc7.setAnswerOptions(answerOptions); qc7.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM7");
		qc8.setQtype(qtype1); qc8.setTopic(chem2); qc8.setQuestionNumber(8);qc8.setAnswerOptions(answerOptions); qc8.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM8");
		qc9.setQtype(qtype1); qc9.setTopic(chem3); qc9.setQuestionNumber(9);qc9.setAnswerOptions(answerOptions); qc9.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.CHEM9");

		qm1.setQtype(qtype1); qm1.setTopic(math1); qm1.setQuestionNumber(1);qm1.setAnswerOptions(answerOptions); qm1.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH1");
		qm2.setQtype(qtype1); qm2.setTopic(math2); qm2.setQuestionNumber(2);qm2.setAnswerOptions(answerOptions); qm2.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH2");
		qm3.setQtype(qtype1); qm3.setTopic(math3); qm3.setQuestionNumber(3);qm3.setAnswerOptions(answerOptions); qm3.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH3");
		qm4.setQtype(qtype1); qm4.setTopic(math1); qm4.setQuestionNumber(4);qm4.setAnswerOptions(answerOptions); qm4.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH4");
		qm5.setQtype(qtype1); qm5.setTopic(math2); qm5.setQuestionNumber(5);qm5.setAnswerOptions(answerOptions); qm5.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH5");
		qm6.setQtype(qtype1); qm6.setTopic(math3); qm6.setQuestionNumber(6);qm6.setAnswerOptions(answerOptions); qm6.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH6");
		qm7.setQtype(qtype1); qm7.setTopic(math1); qm7.setQuestionNumber(7);qm7.setAnswerOptions(answerOptions); qm7.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH7");
		qm8.setQtype(qtype1); qm8.setTopic(math2); qm8.setQuestionNumber(8);qm8.setAnswerOptions(answerOptions); qm8.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH8");
		qm9.setQtype(qtype1); qm9.setTopic(math3); qm9.setQuestionNumber(9);qm9.setAnswerOptions(answerOptions); qm9.setQuestionString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.MATH9");
		
		
		List<Question> listP = new ArrayList<Question>();
		listP.add(qp1); listP.add(qp2); listP.add(qp3);
		listP.add(qp4); listP.add(qp5); listP.add(qp6);
		listP.add(qp7); listP.add(qp8); listP.add(qp9);
		
		List<Question> listC = new ArrayList<Question>();
		listC.add(qc1); listC.add(qc2); listC.add(qc3);
		listC.add(qc4); listC.add(qc5); listC.add(qc6);
		listC.add(qc7); listC.add(qc8); listC.add(qc9);
		
		List<Question> listM = new ArrayList<Question>();		
		listM.add(qm1); listM.add(qm2); listM.add(qm3);
		listM.add(qm4); listM.add(qm5); listM.add(qm6);
		listM.add(qm7); listM.add(qm8); listM.add(qm9);
		
		QuestionSet setP = new QuestionSet();
		setP.setQuestionSetName("Physics1");
		setP.setQuestionSetDisplayName("Physics");
		
		setP.setQuestions(listP);
		
		QuestionSet setC = new QuestionSet();
		setC.setQuestionSetName("Chemistry1");
		setC.setQuestionSetDisplayName("Chemistry");
		setC.setQuestions(listC);
		
		QuestionSet setM = new QuestionSet();
		setM.setQuestionSetName("Maths1");
		setM.setQuestionSetDisplayName("Mathematics");
		setM.setQuestions(listM);
		
		List<QuestionSet> qSetList = new ArrayList<QuestionSet>();
		qSetList.add(setP); qSetList.add(setC); qSetList.add(setM);
		Test1 test101 = new Test1();		
		test101.setqSet(qSetList );
		test101.setTestDuration(180);
		test101.setTestName("JEE MOCK 101");
		
		User user1 = new User();
		user1.setUserName("user1");
		user1.setPassword("user1pass");
		user1.setContactNo("101101101");
		user1.setEmailId("user1@user1.com");
		
		User user2 = new User();
		user2.setUserName("user2");
		user2.setPassword("user2pass");
		user2.setContactNo("202202202");
		user2.setEmailId("user2@user2.com");
		
		User user3 = new User();
		user3.setUserName("user3");
		user3.setPassword("user3pass");
		user3.setContactNo("303303303");
		user3.setEmailId("user3@user3.com");
		
		
		
// ---------------DATA CREATION END--------------------------//		

		
//-----------------DATA INSERTION IN DB START----------------------//		
		SessionFactory sessionFactory  = new Configuration().configure(new File("C:\\Project\\workspace1\\MockJEE\\src\\myTest\\unitTest\\abc.cfg.xml")).buildSessionFactory();				
		
		Session session = sessionFactory.openSession();
    	Transaction tx = session.beginTransaction();
    	
    	
    	try{
    	
    		
    		
    		
    		
    		
    		ap1.setQuestion(qp1 ); ap1.setCorrectAnswer("Option A"); ap1.setCorrectMarks(4f); ap1.setIncorrectMarks(-1f); ap1.setDescription("lkdflsd");
    		ap2.setQuestion(qp2); ap2.setCorrectAnswer("Option B"); ap2.setCorrectMarks(4f); ap2.setIncorrectMarks(-1f); ap2.setDescription("lkdflsd");
    		ap3.setQuestion(qp3); ap3.setCorrectAnswer("Option C"); ap3.setCorrectMarks(4f); ap3.setIncorrectMarks(-1f); ap3.setDescription("lkdflsd");
    		ap4.setQuestion(qp4); ap4.setCorrectAnswer("Option D"); ap4.setCorrectMarks(4f); ap4.setIncorrectMarks(-1f); ap4.setDescription("lkdflsd");
    		ap5.setQuestion(qp5); ap5.setCorrectAnswer("Option A"); ap5.setCorrectMarks(4f); ap5.setIncorrectMarks(-1f); ap5.setDescription("lkdflsd");
    		ap6.setQuestion(qp6); ap6.setCorrectAnswer("Option B"); ap6.setCorrectMarks(4f); ap6.setIncorrectMarks(-1f); ap6.setDescription("lkdflsd");
    		ap7.setQuestion(qp7); ap7.setCorrectAnswer("Option C"); ap7.setCorrectMarks(4f); ap7.setIncorrectMarks(-1f); ap7.setDescription("lkdflsd");
    		ap8.setQuestion(qp8); ap8.setCorrectAnswer("Option D"); ap8.setCorrectMarks(4f); ap8.setIncorrectMarks(-1f); ap8.setDescription("lkdflsd");
    		ap9.setQuestion(qp9); ap9.setCorrectAnswer("Option A"); ap9.setCorrectMarks(4f); ap9.setIncorrectMarks(-1f); ap9.setDescription("lkdflsd");
    		
    		ac1.setQuestion(qc1); ac1.setCorrectAnswer("Option A"); ac1.setCorrectMarks(4f); ac1.setIncorrectMarks(-1f); ac1.setDescription("lkdflsd");
    		ac2.setQuestion(qc2); ac2.setCorrectAnswer("Option B"); ac2.setCorrectMarks(4f); ac2.setIncorrectMarks(-1f); ac2.setDescription("lkdflsd");
    		ac3.setQuestion(qc3); ac3.setCorrectAnswer("Option C"); ac3.setCorrectMarks(4f); ac3.setIncorrectMarks(-1f); ac3.setDescription("lkdflsd");
    		ac4.setQuestion(qc4); ac4.setCorrectAnswer("Option D"); ac4.setCorrectMarks(4f); ac4.setIncorrectMarks(-1f); ac4.setDescription("lkdflsd");
    		ac5.setQuestion(qc5); ac5.setCorrectAnswer("Option A"); ac5.setCorrectMarks(4f); ac5.setIncorrectMarks(-1f); ac5.setDescription("lkdflsd");
    		ac6.setQuestion(qc6); ac6.setCorrectAnswer("Option B"); ac6.setCorrectMarks(4f); ac6.setIncorrectMarks(-1f); ac6.setDescription("lkdflsd");
    		ac7.setQuestion(qc7); ac7.setCorrectAnswer("Option C"); ac7.setCorrectMarks(4f); ac7.setIncorrectMarks(-1f); ac7.setDescription("lkdflsd");
    		ac8.setQuestion(qc8); ac8.setCorrectAnswer("Option D"); ac8.setCorrectMarks(4f); ac8.setIncorrectMarks(-1f); ac8.setDescription("lkdflsd");
    		ac9.setQuestion(qc9); ac9.setCorrectAnswer("Option A"); ac9.setCorrectMarks(4f); ac9.setIncorrectMarks(-1f); ac9.setDescription("lkdflsd");
    		
    		
    		am1.setQuestion(qm1); am1.setCorrectAnswer("Option A"); am1.setCorrectMarks(4f); am1.setIncorrectMarks(-1f); am1.setDescription("lkdflsd");
    		am2.setQuestion(qm2); am2.setCorrectAnswer("Option B"); am2.setCorrectMarks(4f); am2.setIncorrectMarks(-1f); am2.setDescription("lkdflsd");
    		am3.setQuestion(qm3); am3.setCorrectAnswer("Option C"); am3.setCorrectMarks(4f); am3.setIncorrectMarks(-1f); am3.setDescription("lkdflsd");
    		am4.setQuestion(qm4); am4.setCorrectAnswer("Option D"); am4.setCorrectMarks(4f); am4.setIncorrectMarks(-1f); am4.setDescription("lkdflsd");
    		am5.setQuestion(qm5); am5.setCorrectAnswer("Option A"); am5.setCorrectMarks(4f); am5.setIncorrectMarks(-1f); am5.setDescription("lkdflsd");
    		am6.setQuestion(qm6); am6.setCorrectAnswer("Option B"); am6.setCorrectMarks(4f); am6.setIncorrectMarks(-1f); am6.setDescription("lkdflsd");
    		am7.setQuestion(qm7); am7.setCorrectAnswer("Option C"); am7.setCorrectMarks(4f); am7.setIncorrectMarks(-1f); am7.setDescription("lkdflsd");
    		am8.setQuestion(qm8); am8.setCorrectAnswer("Option D"); am8.setCorrectMarks(4f); am8.setIncorrectMarks(-1f); am8.setDescription("lkdflsd");
    		am9.setQuestion(qm9); am9.setCorrectAnswer("Option A"); am9.setCorrectMarks(4f); am9.setIncorrectMarks(-1f); am9.setDescription("lkdflsd");
    		
    		
    		
session.save(user1); session.save(user2); session.save(user3); 
session.save(phy1); session.save(phy2); session.save(phy3); session.save(chem1);
session.save(chem2); session.save(chem3); session.save(math1); session.save(math2);
session.save(math3); session.save(qtype1);

session.save(qp1);
session.save(qp2); session.save(qp3); session.save(qp3); session.save(qp4);
session.save(qp5); session.save(qp6); session.save(qp7); session.save(qp8);
session.save(qp9); session.save(qc1); session.save(qc2); session.save(qc3);
session.save(qc4); session.save(qc5); session.save(qc6); session.save(qc7);
session.save(qc8); session.save(qc9); session.save(qm1); session.save(qm2);
session.save(qm3); session.save(qm4); session.save(qm5); session.save(qm6);
session.save(qm7); session.save(qm8); session.save(qm9); 

session.save(setP);session.save(setC);session.save(setM);

session.save(test101);

    		session.save(ap1); session.save(ap2); session.save(ap3); 
    		session.save(ap4); session.save(ap5); session.save(ap6); 
    		session.save(ap7); session.save(ap8); session.save(ap9); 
    		session.save(ac1); session.save(ac2); session.save(ac3);
    		session.save(ac4); session.save(ac5); session.save(ac6); 
    		session.save(ac7); session.save(ac8); session.save(ac9); 
    		session.save(am1); session.save(am2); session.save(am3); 
    		session.save(am4); session.save(am5); session.save(am6);
    		session.save(am7); session.save(am8); session.save(am9); 
    		
    		tx.commit();
    		
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		tx.rollback();
    		
    	}
    	finally{
    		session.close();
    	}
//-----------------DATA INSERTION IN DB END----------------------//
	}

	
//miscellaneous crap
	
//	Topic t1 = new Topic();
//	t1.setDescription("Topic1 Description");
//	t1.setTopicName("Topic1");
//	Topic t2 = (Topic) session.createQuery("from Topic tp1 WHERE tp1.id= :id")
//			.setLong("id", 1).uniqueResult();
//	
//	Question qp1 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 1).uniqueResult();
//	Question qp2 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 2).uniqueResult();
//	Question qp3 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 3).uniqueResult();
//	Question qp4 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 4).uniqueResult();
//	Question qp5 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 5).uniqueResult();
//	Question qp6 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 6).uniqueResult();
//	Question qp7 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 7).uniqueResult();
//	Question qp8 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 8).uniqueResult();
//	Question qp9 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 9).uniqueResult();
//	
//	Question qc1 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 10).uniqueResult();
//	Question qc2 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 11).uniqueResult();
//	Question qc3 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 12).uniqueResult();
//	Question qc4 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 13).uniqueResult();
//	Question qc5 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 14).uniqueResult();
//	Question qc6 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 15).uniqueResult();
//	Question qc7 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 16).uniqueResult();
//	Question qc8 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 17).uniqueResult();
//	Question qc9 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 18).uniqueResult();
//	
//	Question qm1 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 19).uniqueResult();
//	Question qm2 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 20).uniqueResult();
//	Question qm3 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 21).uniqueResult();
//	Question qm4 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 22).uniqueResult();
//	Question qm5 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 23).uniqueResult();
//	Question qm6 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 24).uniqueResult();
//	Question qm7 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 25).uniqueResult();
//	Question qm8 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id",26).uniqueResult();
//	Question qm9 = (Question) session.createQuery("from Question tp1 WHERE tp1.id= :id").setLong("id", 27).uniqueResult();
//	
//	
	

}
