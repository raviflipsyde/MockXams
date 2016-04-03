package myTest.unitTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import myTest.entities.Answer;
import myTest.entities.Question;
import myTest.entities.QuestionSet;
import myTest.entities.QuestionType;
import myTest.entities.Test1;
import myTest.entities.Topic;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ReadXlsxTest {

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

	public Test1 getTest() {

		List<QuestionSet> qSetList = new ArrayList<QuestionSet>();
		QuestionSet qSet = new QuestionSet();
		
		Test1 test = new Test1();
		Question question = new Question();
		Answer answer = new Answer();
		Set<String> answerOptions = new HashSet<String>();

		try {

			String fileName = ".\\WebContent\\Uploads\\Excel\\newFile.xlsx";

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

	public static void main(String[] args) {

		ReadXlsxTest rxT = new ReadXlsxTest();

		SessionFactory sessionFactory = new Configuration()
				.configure(
						new File(
								"C:\\Project\\workspace1\\MockJEE\\src\\myTest\\unitTest\\local.cfg.xml"))
				.buildSessionFactory();

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();

		try {

			List<Topic> topicList = session.createQuery("FROM Topic").list();

			for (Topic t : topicList) {
				rxT.getTopicMap().put(t.getTopicName(), t);
			}

			List<QuestionType> qTypeList = session.createQuery(
					"FROM QuestionType").list();

			for (QuestionType qt : qTypeList) {
				rxT.getQuestionTypeMap().put(qt.getQuestionType(), qt);
			}

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();

		} finally {
			session.close();
		}

		Test1 tst = rxT.getTest();
		System.out.println(tst);

		session = sessionFactory.openSession();
		tx = session.beginTransaction();

		try {

			session.save(tst);
			System.out.println("Popat... ");
			for(Answer ans:rxT.ansList1){
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

}
