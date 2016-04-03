package myTest.controller;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import myTest.entities.Question;
import myTest.entities.QuestionSet;
import myTest.entities.Test1;
import myTest.entities.Topic;
import myTest.manager.QuestionManager;
import myTest.manager.TestManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QuestionController {

	@Autowired
	private QuestionManager questionManger;

	@Autowired
	private TestManager testManager;

	public QuestionController() {

	}

	public QuestionController(QuestionManager manager) {
		this.questionManger = manager;
	}

	@RequestMapping(value = { "/addNewTest" })
	public String addNewTest(Map<String, Object> model) {

		try {
			List<QuestionSet> qSetList1 = questionManger.getAllQuestionSet();
			List<String> qSetList2 = new ArrayList<String>();
			for (QuestionSet qs : qSetList1) {
				qSetList2.add(qs.toString());
			}

			Test1 newTest = new Test1();

			model.put("newTest", newTest);
			model.put("qSetList1", qSetList2);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "testMainPage";
	}

	@RequestMapping(value = { "/saveNewTest" }, method = RequestMethod.POST)
	public String saveNewTest(String TestName, int testDuration, String[] qSet) {
		System.out.println(TestName);
		List<QuestionSet> qSetList = new ArrayList<QuestionSet>();
		Map<String, QuestionSet> qSetMap = questionManger
				.getAllQuestionSetMap();
		for (int count = 0; count < qSet.length; count++) {
			qSetList.add(qSetMap.get(qSet[count]));
		}
		Test1 test = new Test1();
		test.setqSet(qSetList);
		test.setTestName(TestName);

		test.setTestDuration(testDuration);
		testManager.addTest(test);
		return "redirect:/addNewTest";
	}

	@RequestMapping(value = { "/addNewQuestionSet" })
	public String addNewQuestionSet(Map<String, Object> model) {

		try {

			List<Question> questionList1 = new ArrayList<Question>();
			List<String> questionList2 = new ArrayList<String>();

			questionList1 = questionManger.getAllQuestions();

			for (Question qs : questionList1) {
				questionList2.add(qs.toString());
			}

			QuestionSet newQuestionset = new QuestionSet();
			model.put("newQuestionset", newQuestionset);
			model.put("newQuestion", new Question());

			model.put("questionList1", questionList2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "newQuestionSet";

	}

	@RequestMapping(value = { "/saveNewQuestionSet" }, method = RequestMethod.POST)
	public String saveNewQuestionSet(String questionSetName, String[] questions) {
		QuestionSet qSet = new QuestionSet();
		qSet.setQuestionSetName(questionSetName);
		Map<String, Question> map1 = questionManger.getAllQuesstionsMap();
		@SuppressWarnings("unused")
		Map<Long, Question> map2 = questionManger.getAllQuesstionsIdMap();
		qSet.setQuestions(new ArrayList<Question>());

		for (int index = 0; index < questions.length; index++) {
			qSet.getQuestions().add(map1.get(questions[index]));
		}

		questionManger.addQuestionSet(qSet);
		return "redirect:/addNewQuestionSet";
	}

	@RequestMapping(value = { "/addNewQuestion" })
	public String addNewQuestion(Map<String, Object> model) {

		Question newQuestion = new Question();
		List<Topic> allTopicList = questionManger.getAllTopics();
		model.put("allTopicList", allTopicList);
		model.put("newQuestion", newQuestion);
		return "newQuestion";
	}

	@RequestMapping(value = { "/saveNewQuestion" }, method = RequestMethod.POST)
	public String saveNewQuestion(String topic, String questionString,
			String correctAnswer, float correctMarks, float incorrectMarks) {

		System.out.println(topic);
		System.out.println(questionString);
		System.out.println(correctAnswer);
		System.out.println(correctMarks);
		System.out.println(incorrectMarks);

		Question newQuestion1 = new Question();
//		newQuestion1.setIncorrectMarks(incorrectMarks);
//		newQuestion1.setCorrectMarks(correctMarks);
		newQuestion1.setQuestionString(questionString);

		newQuestion1.setTopic(questionManger.getAllTopicsMap().get(topic));

		StringTokenizer st2 = new StringTokenizer(correctAnswer, ",");
		Set<String> ansList = new LinkedHashSet<String>();
		while (st2.hasMoreElements()) {
			ansList.add(st2.nextElement().toString().trim());
		}
		if (ansList.size() > 1)
			newQuestion1.setAnswerOptions(ansList);
//		newQuestion1.setCorrectAnswer(ansList.iterator().next());
		System.out.println(newQuestion1);
		questionManger.addQuestion(newQuestion1);

		return "redirect:/addNewQuestion";
	}

	@RequestMapping(value = { "/addNewTopic" })
	public String addNewTopic(Map<String, Object> model) {

		Topic newTopic = new Topic();
		Question newQuestion = new Question();
		model.put("newTopic", newTopic);
		model.put("newQuestion", newQuestion);
		List<Topic> allTopicList = questionManger.getAllTopics();
		model.put("allTopicList", allTopicList);
		return "newTopic";
	}

	@RequestMapping(value = { "/saveNewTopic" }, method = RequestMethod.POST)
	public String saveNewTopic(Topic newTopic) {
		System.out.println("name:" + newTopic.getTopicName());
		System.out.println("Descr:" + newTopic.getDescription());
		questionManger.addTopic(newTopic);
		return "redirect:/addNewTopic";
	}

	/*
	 * @RequestMapping(value = { "/AddQuestionsPage" }) public String
	 * showQuestionPage(Map<String, Object> model) {
	 * 
	 * ArrayList<String> sectionList1 = new ArrayList<String>();
	 * ArrayList<String> topicList1 = new ArrayList<String>(); ArrayList<String>
	 * tagList1 = new ArrayList<String>();
	 * 
	 * Question newQuestion = new Question(); model.put("newQuestion",
	 * newQuestion); model.put("sectionList1", sectionList1);
	 * model.put("topicList1", topicList1); model.put("tagList1", tagList1);
	 * 
	 * return "newQuestion"; }
	 * 
	 * @RequestMapping(value = { "/addnewquestion" }, method =
	 * RequestMethod.POST) public String addQuestion(String section, String
	 * topic, String[] tags, String questionString, String correctAnswer, float
	 * correctMarks, float incorrectMarks) {
	 * 
	 * System.out.println(section); System.out.println(topic);
	 * System.out.println(tags.length+":" +tags);
	 * System.out.println(questionString); System.out.println(correctAnswer);
	 * System.out.println(correctMarks); System.out.println(incorrectMarks);
	 * 
	 * Question newQuestion = new Question();
	 * newQuestion.setIncorrectMarks(incorrectMarks);
	 * newQuestion.setCorrectMarks(correctMarks);
	 * newQuestion.setQuestionString(questionString);
	 * newQuestion.setSection(questionManger.getAllSectionMap().get(section));
	 * newQuestion.setTopic(questionManger.getAllTopicsMap().get(topic));
	 * List<Tags> tagss= new ArrayList<Tags>();
	 * 
	 * 
	 * for(int index=0; index<tags.length;index++){
	 * tagss.add(questionManger.getAllTagsMap().get(tags[index])); }
	 * newQuestion.setTags(tagss);
	 * 
	 * StringTokenizer st2 = new StringTokenizer(correctAnswer, ",");
	 * Set<String> ansList = new LinkedHashSet<String>(); while
	 * (st2.hasMoreElements()) {
	 * ansList.add(st2.nextElement().toString().trim()); } if(ansList.size()>1)
	 * newQuestion.setAnswerOptions(ansList);
	 * newQuestion.setCorrectAnswer(ansList.iterator().next());
	 * System.out.println(newQuestion); questionManger.addQuestion(newQuestion);
	 * return "redirect:/AddQuestionsPage"; }
	 * 
	 * @RequestMapping(value={"/AddQuestionSetPage"}) public String
	 * showQuestionSetPage(Map<String, Object> model, String section){
	 * 
	 * try{ List<Section> sectionList1 = questionManger.getAllSection();
	 * List<Question> questionList1 = new ArrayList<Question>(); List<String>
	 * questionList2 = new ArrayList<String>();
	 * 
	 * System.out.println("Section:"+section); if(section!=null){ questionList1
	 * = questionManger.getAllQuestionsBySection(section); }
	 * 
	 * for(Question qs:questionList1){ questionList2.add(qs.toString()); }
	 * 
	 * QuestionSet newQuestionset = new QuestionSet();
	 * model.put("newQuestionset", newQuestionset); model.put("newQuestion", new
	 * Question()); model.put("sectionList1", sectionList1);
	 * model.put("questionList1",questionList2); } catch(Exception e){
	 * e.printStackTrace(); } return "newQuestionSet"; }
	 * 
	 * 
	 * @RequestMapping(value = { "/addnewquestionset" }, method =
	 * RequestMethod.POST) public String addQuestionSet(String questionSetName,
	 * String[] questions) {
	 * 
	 * QuestionSet qSet = new QuestionSet();
	 * qSet.setQuestionSetName(questionSetName); Map<String, Question> map1 =
	 * questionManger.getAllQuesstionsMap();
	 * 
	 * @SuppressWarnings("unused") Map<Long, Question> map2 =
	 * questionManger.getAllQuesstionsIdMap(); qSet.setQuestions(new
	 * ArrayList<Question>());
	 * 
	 * 
	 * for(int index=0; index < questions.length;index++){
	 * qSet.getQuestions().add(map1.get(questions[index])); }
	 * 
	 * questionManger.addQuestionSet(qSet); return
	 * "redirect:/AddQuestionSetPage"; }
	 */

}
