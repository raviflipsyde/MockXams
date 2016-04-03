package myTest.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import myTest.entities.QuestionSet;
import myTest.entities.Test1;
import myTest.entities.User;
import myTest.entities.UserTestData;
import myTest.manager.QuestionManager;
import myTest.manager.TestManager;
import myTest.manager.UserTestDataAnswersManager;
import myTest.manager.UserTestDataManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@SessionAttributes("thisTest")
public class TestController {

	@Autowired
	private QuestionManager questionManger;
	@Autowired
	private TestManager testManager;
	@Autowired
	private UserTestDataManager userTestDataManager;

	@Autowired
	private UserTestDataAnswersManager userTestDataAnswersManager;

	@Autowired
	JmsTemplate jmsTemplate;

	Test1 thisTest;

	public TestController() {
		thisTest = new Test1();
	}

	public TestController(QuestionManager manager) {
		this.questionManger = manager;
	}

	// @RequestMapping(value = { "/showTest", "/getNextQuestion",
	// "/saveCurrentAnswer" })
	// public String showTest(Map<String, Object> model, String testName,
	// HttpServletRequest request, Question currentQuestion, String input,
	// String currentQuestionNo) {
	//
	// System.out.println("in show test");
	// String uri = request.getRequestURI();
	//
	// if (uri.indexOf("showTest") > 0) {
	//
	// thisTest = testManager.getTestByName("Test101");
	//
	// List<QuestionSet> qSet = thisTest.getqSet();
	//
	// QuestionSet qSeet1 = qSet.get(0);
	// List<Question> qList2 = qSeet1.getQuestions();
	// model.put("thisTest", thisTest);
	// model.put("thisTestQSet", qSet);
	//
	// }
	// return "testMainPage";
	// }

	@RequestMapping(value = { "/showTest1", "/getNextQuestion",
			"/saveCurrentAnswer" })
	public String showTest12(@ModelAttribute("thisTest") Test1 thisTest,
			Map<String, Object> model, HttpServletRequest request) {

		System.out.println("in show test");
		String uri = request.getRequestURI();

		if (uri.indexOf("showTest") > 0) {

			thisTest = testManager.getTestByName("JEE Mock 102");

			List<QuestionSet> qSet = thisTest.getqSet();

			
			
			model.put("thisTest", thisTest);
			model.put("thisTestQSet", qSet);

		}
		return "testMainPage";

	}

	@RequestMapping(value = { "/showTest" })
	public String showTest(@RequestParam(value="testid") String testid, Map<String, Object> model, HttpServletRequest request) {

		System.out.println("in show test");
		String uri = request.getRequestURI();
		
		
		if (uri.indexOf("showTest") > 0) {

			// get the test data
			thisTest = testManager.getTestByName(testid);
			// get the user data
			User user = (User) request.getSession().getAttribute("USER");
			request.getSession().setAttribute("TESTID", testid);
			// create the user-test data
			UserTestData utd = new UserTestData();
			Date date = new Date();
			utd.setDate(date);
			utd.setTest(thisTest);
			utd.setUser(user);

			// persist the user-test data and get the unique id--to be used
			// while saving the answers
			utd = userTestDataManager.returnCorrectUsetTestData(utd);

			System.out.println("UTD ID:" + utd.getId());
			request.getSession().setAttribute("USERTESTID", utd.getId());
			request.getSession().setAttribute("TESTID", thisTest.getId());
			// TODO-- add answer options--the answers that are already given by
			// the user..useful in case of faulty browser closing

			model.put("thisTest", thisTest);
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.create();
			String testJSON = gson.toJson(thisTest);
			System.out.println(testJSON);
			request.setAttribute("thisTestJSON", testJSON);
			model.put("thisTestJSON", testJSON);

		}
		return "testMainPage";

	}

	@RequestMapping(value = { "/postAnswer" })
	public String postAnswer(Map<String, Object> model,
			HttpServletRequest request) {

		System.out.println("Post Ansewer...");
		
		
		String answerValue = request.getParameter("answerOpt");		
		String questionId = request.getParameter("questionId");
		long questionID = Long.parseLong(questionId);
		// TODO-- using time left to save on serverside...
		@SuppressWarnings("unused")
		String timeLeft = request.getParameter("timeLeft");
		
		String requestTypeFlag =  request.getParameter("requestTypeFlag");
		
		
		long userTestId = (long) request.getSession().getAttribute("USERTESTID");
//		long testId = (long) request.getSession().getAttribute("TESTID");
//		long userId = (long) request.getSession().getAttribute("USERID");
		
		//enque the post request to the answer queue for persistence...
		
		final String msgVal = Long.toString(userTestId)+","+Long.toString(questionID)+","+answerValue+","+requestTypeFlag;
		
		jmsTemplate.send(new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				// TODO Auto-generated method stub
				
				return session.createTextMessage(msgVal);
				
			}
		});
		
		return "testMainPage";

	}
	
	
@RequestMapping(value = { "/dashboard" })
	
	public String gotoDashBoard(Map<String, Object> model,
			HttpServletRequest request) {
	User user = (User) request.getSession().getAttribute("USER");
	
	if(user.getAccessLevel()==1){
		List<Test1> activeTest = testManager.getAllActiveTest();
		List<UserTestData> activeResults = userTestDataManager.getActiveUserTestDataByUserId(user.getId());
		List<String> actTestName = new ArrayList<String>();
		List<String> actResults = new ArrayList<String>();
		
		for(UserTestData utd: activeResults){
			actResults.add(utd.getTest().getTestName());
		}
		
		for(Test1 test: activeTest){
			actTestName.add(test.getTestName());
		}
		
		
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		String avlbleTestJSON = gson.toJson(actTestName);
		String avlbleResultJSON = gson.toJson(actResults);
		
		model.put("testAvailable", actTestName);
		model.put("testAvailableJSON", avlbleTestJSON);
		model.put("resultAvailable", actResults);
		model.put("resultAvailableJSON", avlbleResultJSON);
		
		return "Dashboard_new_admin";
					
	}
	else{
		List<Test1> activeTest = testManager.getAllActiveTest();
		List<UserTestData> activeResults = userTestDataManager.getActiveUserTestDataByUserId(user.getId());
		List<String> actTestName = new ArrayList<String>();
		List<String> actResults = new ArrayList<String>();
		
		for(UserTestData utd: activeResults){
			actResults.add(utd.getTest().getTestName());
		}
		
		for(Test1 test: activeTest){
			actTestName.add(test.getTestName());
		}
		
		
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		String avlbleTestJSON = gson.toJson(actTestName);
		String avlbleResultJSON = gson.toJson(actResults);
		
		model.put("testAvailable", actTestName);
		model.put("testAvailableJSON", avlbleTestJSON);
		model.put("resultAvailable", actResults);
		model.put("resultAvailableJSON", avlbleResultJSON);
		
		return "Dashboard_student";
	}
	
	
}
	
	
	@RequestMapping(value = { "/submitTest" })
	
	public String onTestSubmit(Map<String, Object> model,
			HttpServletRequest request,HttpSession session) {

		System.out.println("onTestSubmit");
		User user = (User) request.getSession().getAttribute("USER");
		Long testid = (Long) request.getSession().getAttribute("TESTID");
		
		userTestDataAnswersManager.getUserTestDataMarks(testid, user.getId());
		session.setAttribute("test_started",null);
		
		return gotoDashBoard(model, request);
			
		
				
	}
	

	
	@RequestMapping(value = { "/showNewTest" })
	public String showNewTest(@RequestParam(value="testid") String testid, Map<String, Object> model, HttpServletRequest request, HttpSession session) {

		System.out.println("in show new test");
		
String uri = request.getRequestURI();
		
		System.out.println("test_started..."+session.getAttribute("test_started"));
		if (uri.indexOf("showNewTest") > 0 ) {

			session.setAttribute("test_started",new String("YES"));
			// get the test data
			thisTest = testManager.getTestByName(testid);
			// get the user data
			User user = (User) request.getSession().getAttribute("USER");
			request.getSession().setAttribute("TESTID", testid);
			// create the user-test data
			UserTestData utd = new UserTestData();
			Date date = new Date();
			utd.setDate(date);
			utd.setTest(thisTest);
			utd.setUser(user);

			// persist the user-test data and get the unique id--to be used
			// while saving the answers
			utd = userTestDataManager.returnCorrectUsetTestData(utd);

			System.out.println("UTD ID:" + utd.getId());
			request.getSession().setAttribute("USERTESTID", utd.getId());
			request.getSession().setAttribute("TESTID", thisTest.getId());
			// TODO-- add answer options--the answers that are already given by
			// the user..useful in case of faulty browser closing

			model.put("thisTest", thisTest);
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.create();
			String testJSON = gson.toJson(thisTest);
			System.out.println(testJSON);
			request.setAttribute("thisTestJSON", testJSON);
			model.put("thisTestJSON", testJSON);

		}
		
		return "Exam-template"; 
	}
	
	
}
