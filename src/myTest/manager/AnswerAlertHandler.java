package myTest.manager;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AnswerAlertHandler implements MessageListener{

	@Autowired
	private UserTestDataAnswersManager manager;
	

	
	public void processAnswers(String str) {

		System.out.println("Message Recieved:" + str);
		String persistVal[] = str.split(",");
		try {
			manager.saveUserTestAnswers(Long.parseLong(persistVal[0]),
					Long.parseLong(persistVal[1]), persistVal[2], persistVal[3]);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}





	@Override	
	public void onMessage(Message str) {
		
	
		try {

			TextMessage message = (TextMessage) str;
			String strw = message.getText();
			String persistVal[] = strw.toString().split(",");			
			str.acknowledge();
			
			manager.saveUserTestAnswers(Long.parseLong(persistVal[0]),
					Long.parseLong(persistVal[1]), persistVal[2], persistVal[3]);		
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
}
