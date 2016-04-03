package myTest.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import myTest.entities.Answer;
import myTest.entities.Question;
import myTest.entities.QuestionSet;
import myTest.entities.QuestionType;
import myTest.entities.Test1;
import myTest.entities.Topic;
import myTest.entities.User;
import myTest.entities.UserTestData;
import myTest.entities.UserTestDataAnswers;
import myTest.manager.QuestionManager;
import myTest.manager.TestManager;
import myTest.manager.UserManager;
import myTest.manager.UserTestDataAnswersManager;
import myTest.manager.UserTestDataManager;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class DashBoardController {

	@Autowired
	private QuestionManager questionManger;

	@Autowired
	private UserManager userManger;
	@Autowired
	private TestManager testManager;

	@Autowired
	private UserTestDataManager userTestDataManager;

	@Autowired
	private UserTestDataAnswersManager userTestDataAnswersManager;

	@Autowired
	private SessionFactory sessionFactory;

	HashMap<String, Topic> topicMap = new HashMap<String, Topic>();
	HashMap<String, QuestionType> questionTypeMap = new HashMap<String, QuestionType>();
	List<Answer> ansList1 = new ArrayList<Answer>();

	// save Questions
	// save question set
	// save Test
	// save Answers

	public HashMap<String, Topic> getTopicMap() {
		return topicMap;
	}

	public void setTopicMap(HashMap<String, Topic> topicMap) {
		this.topicMap = topicMap;
	}

	public HashMap<String, QuestionType> getQuestionTypeMap() {
		return questionTypeMap;
	}

	public void setQuestionTypeMap(HashMap<String, QuestionType> questionTypeMap) {
		this.questionTypeMap = questionTypeMap;
	}

	public XSSFWorkbook readFile(String filename) throws IOException {
		return new XSSFWorkbook(new FileInputStream(filename));
	}

	@RequestMapping(value = { "/testScore" })
	public String showTestResults(
			@RequestParam(value = "testid") String testid,
			Map<String, Object> model, HttpServletRequest request) {

		Test1 thisTest = testManager.getTestByName(testid);
		User user = (User) request.getSession().getAttribute("USER");

		HashMap<Long, Question> qMap = new HashMap<Long, Question>();
		HashMap<Long, Answer> ansMap = new HashMap<Long, Answer>();

		for (QuestionSet qSet : thisTest.getqSet()) {

			for (Question qs : qSet.getQuestions()) {
				qMap.put(qs.getId(), qs);
			}
		}
		ansMap = (HashMap<Long, Answer>) userTestDataAnswersManager
				.getAnswersByTestId(qMap);

		UserTestData userTestData = userTestDataManager
				.getUserTestDataByUserIdTestId(thisTest.getId(), user.getId());

		List<UserTestDataAnswers> userTestDataAnswers = userTestDataAnswersManager
				.getUserTestDataAnswersByUserTestDataId(userTestData.getId());
		Map<Long, UserTestDataAnswers> mapUserTestDataAns = new HashMap<Long, UserTestDataAnswers>();
		long qsId = 0;
		for (UserTestDataAnswers utda : userTestDataAnswers) {
			qsId = utda.getAnswer().getQuestion().getId();
			mapUserTestDataAns.put(qsId, utda);
		}

		model.put("QSMAP", qMap);
		model.put("ANSMAP", ansMap);
		model.put("USERMAP", mapUserTestDataAns);
		model.put("USRTSTDATA", userTestData);
		
		System.out.println(userTestDataAnswers);

		return "TestScoreCard";

	}

	@RequestMapping(value = { "/testSummary" })
	public String showTestSummary(
			@RequestParam(value = "testid") String testid,
			Map<String, Object> model, HttpServletRequest request) {

		Test1 thisTest = testManager.getTestByName(testid);

		List<UserTestData> utd = userTestDataManager
				.getUserTestDataByTestId(thisTest.getId());

		model.put("summary", utd);

		return "TestScoreSummary";

	}

	@RequestMapping({ "/uploadPage" })
	public String showUploadPage(Map<String, Object> model) {

		return "testUpload";
	}

	@RequestMapping({ "/ActivatePage" })
	public String showTestActivatePage(Map<String, Object> model) {
		List<Test1> list1 = testManager.getAllTest();
		model.put("allTest", list1);
		return "testEnable";
	}

	@RequestMapping(method = RequestMethod.POST, value = { "/formActivate" })
	public String activateExam(HttpServletRequest request) {

		String activateFlag = request.getParameter("myselect");
		String testIds = request.getParameter("comment");
		ArrayList<String> names = new ArrayList<String>();

		StringTokenizer st2 = new StringTokenizer(testIds, ",");

		while (st2.hasMoreElements()) {
			String ele = (String) st2.nextElement();
			names.add(ele.trim());
		}

		System.out.println("Active:" + activateFlag);
		System.out.println("testId:" + testIds);

		if ("1".equalsIgnoreCase(activateFlag)) {
			testManager.activateTests(names);
		} else {
			testManager.deactivateTests(names);
		}

		return "redirect:/dashboard";

	}

	@RequestMapping(method = RequestMethod.POST, value = { "/formupload" })
	public @ResponseBody String handleFileUpload(HttpServletRequest request, // @RequestParam("name")
																				// String
																				// name,
			@RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// BufferedOutputStream stream =
				// new BufferedOutputStream(new FileOutputStream(new
				// File(name)));
				// stream.write(bytes);
				// stream.close();

				String filePath = request.getServletContext().getRealPath("/");
				file.transferTo(new File(filePath + "\\Uploads\\newxl.xlsx"));

				saveTest(request);

				return "redirect:/";

			} catch (Exception e) {
				e.printStackTrace();
				return "errorPage";
			}
		} else {
			return "errorPage";
		}
	}

	public void saveTest(HttpServletRequest request) {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		try {

			List<Topic> topicList = session.createQuery("FROM Topic").list();

			for (Topic t : topicList) {
				this.getTopicMap().put(t.getTopicName(), t);
			}

			List<QuestionType> qTypeList = session.createQuery(
					"FROM QuestionType").list();

			for (QuestionType qt : qTypeList) {
				this.getQuestionTypeMap().put(qt.getQuestionType(), qt);
			}

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();

		} finally {
			session.close();
		}

		Test1 tst = this.getTest(request);
		System.out.println(tst);

		session = sessionFactory.openSession();
		

		try {
			tx = session.beginTransaction();
			session.save(tst);
			tx.commit();
			tx = session.beginTransaction();
			System.out.println("Popat... ");
			for (Answer ans : this.ansList1) {
				session.save(ans);
			}
			
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();

		} finally {
			session.close();
		}

	}

	public Test1 getTest(HttpServletRequest request) {

		List<QuestionSet> qSetList = new ArrayList<QuestionSet>();
		QuestionSet qSet = new QuestionSet();

		Test1 test = new Test1();
		Question question = new Question();
		Answer answer = new Answer();
		Set<String> answerOptions = new HashSet<String>();

		try {

			String filePath = request.getServletContext().getRealPath("/");
			String fileName = filePath + "\\Uploads\\newxl.xlsx";

			XSSFWorkbook wb = this.readFile(fileName);

			XSSFSheet sheet = wb.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();

			System.out.println("Sheet " + 0 + " \"" + wb.getSheetName(0)
					+ "\" has " + rows + " row(s).");

			XSSFRow row = sheet.getRow(0);
			int cells = row.getPhysicalNumberOfCells();
			XSSFCell cell = row.getCell(1);
			String value = null;
			test.setTestName(cell.getStringCellValue());
			cell = row.getCell(4);
			Double dTempTestID = cell.getNumericCellValue();
			int iTempVal = dTempTestID.intValue();

			test.setqSet(qSetList);

			row = sheet.getRow(1);
			cells = row.getPhysicalNumberOfCells();
			cell = row.getCell(1);

			Double d = cell.getNumericCellValue();
			test.setTestDuration(d.intValue());

			cell = row.getCell(4);
			Double d1 = cell.getNumericCellValue();
			test.setTestStatus(d1.intValue());

			for (int r = 4; r <= rows; r++) {

				row = sheet.getRow(r);
				if (row == null) {
					continue;
				}

				cells = row.getPhysicalNumberOfCells();

				cell = row.getCell(0);
				if (cell.getStringCellValue().length() != 0) {
					String QuestionSetName = cell.getStringCellValue();
					qSet = new QuestionSet();
					qSet.setQuestionSetDisplayName(QuestionSetName);
					qSet.setQuestionSetName(QuestionSetName + iTempVal);
					qSet.setQuestions(new ArrayList<Question>());
					qSetList.add(qSet);
				}

				question = new Question();
				answer = new Answer();

				cell = row.getCell(1);
				String qsType = cell.getStringCellValue();
				question.setQtype(questionTypeMap.get(qsType));

				cell = row.getCell(3);
				String qsTopic = cell.getStringCellValue();
				question.setTopic(topicMap.get(qsTopic));

				cell = row.getCell(4);
				int qsNo = new Double(cell.getNumericCellValue()).intValue();
				question.setQuestionNumber(qsNo);

				cell = row.getCell(5);
				String qsString = cell.getStringCellValue();
				question.setQuestionString(qsString);

				cell = row.getCell(6);
				int qsLOD = new Double(cell.getNumericCellValue()).intValue();
				question.setLevelOfDifficulty(qsLOD);

				answerOptions = new HashSet<String>();
				for (int c = 7; c < 11; c++) {
					cell = row.getCell(c);
					value = null;
					switch (cell.getCellType()) {

					case XSSFCell.CELL_TYPE_FORMULA:
						value = "" + cell.getCellFormula();
						break;

					case XSSFCell.CELL_TYPE_NUMERIC:
						value = "" + cell.getNumericCellValue();
						break;

					case XSSFCell.CELL_TYPE_STRING:
						value = "" + cell.getStringCellValue();
						break;

					default:
					}
					answerOptions.add(value);

				}
				question.setAnswerOptions(answerOptions);

				cell = row.getCell(11);
				String anCorctAns = cell.getStringCellValue();
				;
				answer.setCorrectAnswer(anCorctAns);

				cell = row.getCell(12);
				int ansCorrMrks = new Double(cell.getNumericCellValue())
						.intValue();
				answer.setCorrectMarks(ansCorrMrks);

				cell = row.getCell(13);
				int ansIncorrMrks = new Double(cell.getNumericCellValue())
						.intValue();
				answer.setIncorrectMarks(ansIncorrMrks);

				cell = row.getCell(14);
				String ansExpln = cell.getStringCellValue();
				;
				answer.setDescription(ansExpln);

				answer.setQuestion(question);
				qSet.getQuestions().add(question);
				ansList1.add(answer);
			}

			System.out.println(test);

		} catch (IOException e) {

			e.printStackTrace();
		}

		return test;

	}

	@RequestMapping(method = RequestMethod.POST, value = { "/deleteUserTestDataNow" })
	public String delteUserExamData(HttpServletRequest request) {

		String userString = request.getParameter("user1");
		String testString = request.getParameter("test1");
		System.out
				.println("USer:" + userString + "\n" + "Test:" + testString);
		
		userTestDataManager.deleteUserTestData(Long.parseLong(testString), Long.parseLong(userString));
		
		return "testDataDelete";

	}

	@RequestMapping({ "/testDataDeletePage" })
	public String showTestDataDeletePage(Map<String, Object> model) {

		List<Test1> activeTests = testManager.getAllActiveTest();
		List<User> activeUsers = userManger.getAllUsers();

		HashMap<Long, String> testMap = new HashMap<Long, String>();
		HashMap<Long, String> userMap = new HashMap<Long, String>();



		model.put("users", activeUsers);
		model.put("tests", activeTests);
		return "testDataDelete";
	}

	
	@RequestMapping(value = { "/userMasters" })
	public String showAllUsers(	Map<String, Object> model, HttpServletRequest request) {

		List<User> utd = userManger.getAllUsers();


		model.put("usersList", utd);

		return "UserMaster";

	}
	
	
}
