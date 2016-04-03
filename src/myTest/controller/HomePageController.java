package myTest.controller;



import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;











import myTest.entities.Test1;
import myTest.entities.User;
import myTest.entities.UserTestData;
import myTest.manager.TestManager;
import myTest.manager.UserManager;
import myTest.manager.UserTestDataManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
public class HomePageController {

	@Autowired
	private UserManager userManager;
	
	@Autowired
	private TestManager testManager;
	
	@Autowired
	private UserTestDataManager userTestDataManager;
	
	static HashMap<String, String> ADMIN_USERS_PASSWORD = new HashMap<String, String>();
	
	public HomePageController(){
		ADMIN_USERS_PASSWORD.put("admin", "admin");
		ADMIN_USERS_PASSWORD.put("admin1", "jakkas");
	}	
	
	public HomePageController(UserManager manager){
		this.userManager = manager;
	}
	
	@RequestMapping(value={"/UserData"})
	public String showUserProfile(Map<String, Object> model, HttpSession session){
		
		
		User user  = (User) session.getAttribute("USER");
		System.out.println(user.getUserName());
		model.put("profileUser", user);
		return "userProfile";
	}
	
	@RequestMapping(value={"/register"})
	public String showNewUserForm(Map<String, Object> model){
		
		User user = new User();
		model.put("newUser", user);
		return "userregistration";
	}
	
	@RequestMapping(value={"/addnewuser"})
	public String addNewUserForm(User newUser){
		System.out.println("Contact:"+newUser.getContactNo());
		System.out.println("Email:"+newUser.getEmailId());
		System.out.println("Id:"+newUser.getId());
		System.out.println("Passwd:"+newUser.getPassword());
		System.out.println("USername:"+newUser.getUserName());
		
				userManager.addUser(newUser);
		
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value={"/updateUserInfo"})
	public String updateUSerInfo(@RequestParam String actions1,User newUser){
		if(actions1.equals("Update")){
		System.out.println("Contact:"+newUser.getContactNo());
		System.out.println("Email:"+newUser.getEmailId());
		System.out.println("Id:"+newUser.getId());
		System.out.println("Passwd:"+newUser.getPassword());
		System.out.println("USername:"+newUser.getUserName());
//				userManager.addUser(newUser);
		System.out.println("update..");
		return "redirect:/";
		}
		else{
			System.out.println("arre bawa..gajab...");
			return "userPage";
		}
	}
	
	@RequestMapping(params = "update", method = RequestMethod.POST)
	public String updateUser(HttpServletRequest request, @ModelAttribute User user, BindingResult result, SessionStatus status) {
		
		System.out.println("in update user");
		return "UserPage";
		
	    
	}
	
	@RequestMapping(value = "/testpage1", method = RequestMethod.GET)
	public String showTestPage1(Model model){
		System.out.println("starting with the test page..!!");		
		return "testPage";
	}
	
	@RequestMapping(value = "/home1")
	public String showHomePage1(Model model){
		System.out.println("starting with the home page..!!");		
		return "home";
	}

	
	
	@RequestMapping(value = "/testmainpage", method = RequestMethod.GET)
	public String showTestMainPage(Map<String, Object> model){
		System.out.println("starting with the test main page..!!");		
//		Test test = new Test();
//		model.put("test", test);
		return "testMainPage";
	}
	
	@RequestMapping({"/","/home"})
	public String showHomepage(Map<String, Object> model){
		
		User user = new User();
		model.put("newUser", user);
		return "Signin";
	}
	
//	@RequestMapping({"/dashboard"})
//	public String showDashBoardpage(Map<String, Object> model, HttpServletRequest request){
//		
//		User user = (User) request.getSession().getAttribute("USER");
//		if(null!= user){
//		
//			if(ADMIN_USERS_PASSWORD.containsKey(user.getUserName())){
//				List<Test1> activeTest = testManager.getAllActiveTest();
//				List<String> actTestName = new ArrayList<String>();
//				
//				for(Test1 test: activeTest){
//					actTestName.add(test.getTestName());
//				}
//				GsonBuilder builder = new GsonBuilder();
//				Gson gson = builder.create();
//				String avlbleTestJSON = gson.toJson(actTestName);
//				
//				model.put("testAvailable", actTestName);
//				model.put("testAvailableJSON", avlbleTestJSON);
//				return "Dashboard_admin";
//							
//			}
//			else{
//				return "Dashboard_student";
//			}
//		}
//		
//		return "Signin";
//	}
	
	
	
	@RequestMapping(method = RequestMethod.POST,value={"/login"})
	public String authenticateUser(User user, Map<String, Object> model, HttpSession session) {
		
		try{
		System.out.println("Contact:"+user.getContactNo());
		System.out.println("Email:"+user.getEmailId());
		System.out.println("Id:"+user.getId());
		System.out.println("Passwd:"+user.getPassword());
		System.out.println("USername:"+user.getUserName());
		
		//--to see the session data
		 Enumeration<String> e = session.getAttributeNames();
		  while (e.hasMoreElements()){
		    String s = e.nextElement();
		    System.out.println(s);
		    System.out.println("**" + session.getAttribute(s));
		  }


		
		  User dbUSer = null;
		  
		  dbUSer = userManager.getUserByUsername(user.getUserName());
			if(dbUSer.getPassword().equals(user.getPassword())){
				dbUSer = userManager.getUserByUsername(user.getUserName());
				session.setAttribute("USER", dbUSer);
				session.setAttribute("USERID", dbUSer.getId());
			}
			
			return "redirect:/dashboard";		
		

		
		}catch(Exception e){
			e.printStackTrace();
			return "errorPage";		
		}
		
	}
	
	@RequestMapping(value = { "/logout" })
	public String logoutUser(Map<String, Object> model, HttpServletRequest request, HttpSession session)	{
		
		try{
		
		
		//--to see the session data
		 Enumeration<String> e = session.getAttributeNames();
		  while (e.hasMoreElements()){
		    String s = e.nextElement();
		    System.out.println(s);
		    System.out.println("**" + session.getAttribute(s));
		  }
		  
		  User dbUSer = (User) session.getAttribute("USER");
		  session.setAttribute("USER", null);
		  session.invalidate();
		  User user = new User();
			model.put("newUser", user);
			
		   return "Signin";

		
		
		}catch(Exception e){
			e.printStackTrace();
			return "errorPage";		
		}
		
	}
	
	
	
	
}