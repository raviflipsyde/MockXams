package myTest.manager;

import java.util.List;

import myTest.entities.UserTestData;

public interface UserTestDataManager {

	public void addUserTestData(UserTestData userTestData);
	public void updateUSerTestData(UserTestData userTestData);
	public void deleteUserTestData(Integer userTestDataId);
	public UserTestData returnCorrectUsetTestData(UserTestData userTestData); 
	
	public void deleteUserTestData(long test1Id, long userId);
	public UserTestData getUserTestDataByUserIdTestId(long test1Id, long userId);
	public List<UserTestData> getUserTestDataByTestId(long test1Id);
	public List<UserTestData> getUserTestDataByUserId(long userId);
	
	public List<UserTestData> getActiveUserTestDataByUserId(long userId);
	}
