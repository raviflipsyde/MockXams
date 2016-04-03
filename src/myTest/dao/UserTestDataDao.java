package myTest.dao;

import java.util.List;

import myTest.entities.UserTestData;

public interface UserTestDataDao {
	public void addUserTestData(UserTestData userTestData);
	public void updateUSerTestData(UserTestData userTestData);
	public void deleteUserTestData(Integer userTestDataId);
	
	UserTestData getUserTestDataByUserIdTestId(long test1Id, long userId);
	List<UserTestData> getUserTestDataByTestId(long test1Id);
	List<UserTestData> getUserTestDataByUserId(long userId);
	float getUserTestDataMarks(long test1Id, long userId);
	List<UserTestData> getActiveUserTestDataByUserId(long userId);
	public void deleteUserTestData(long test1Id, long userId);
	
}
