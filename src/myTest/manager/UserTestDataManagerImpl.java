package myTest.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import myTest.dao.UserTestDataDao;
import myTest.entities.UserTestData;

public class UserTestDataManagerImpl implements UserTestDataManager {

	@Autowired
	private UserTestDataDao userTestDataDao;

	@Override
	@Transactional
	public void addUserTestData(UserTestData userTestData) {

		userTestDataDao.addUserTestData(userTestData);

	}

	@Override
	@Transactional
	public void updateUSerTestData(UserTestData userTestData) {
		userTestDataDao.updateUSerTestData(userTestData);
	}

	@Override
	@Transactional
	public void deleteUserTestData(Integer userTestDataId) {
		userTestDataDao.deleteUserTestData(userTestDataId);

	}

	@Override
	@Transactional
	public UserTestData getUserTestDataByUserIdTestId(long test1Id, long userId) {
		return userTestDataDao.getUserTestDataByUserIdTestId(test1Id, userId);
	}

	@Override
	@Transactional
	public List<UserTestData> getUserTestDataByTestId(long test1Id) {
		return userTestDataDao.getUserTestDataByTestId(test1Id);
	}

	@Override
	@Transactional
	public List<UserTestData> getUserTestDataByUserId(long userId) {
		return userTestDataDao.getUserTestDataByUserId(userId);
	}

	@Override
	public UserTestData returnCorrectUsetTestData(UserTestData userTestData) {
		long test1Id = userTestData.getTest().getId();
		long userId = userTestData.getUser().getId();
		
		UserTestData existingUSerTestData = userTestDataDao
				.getUserTestDataByUserIdTestId(test1Id, userId);
		
		

		if (existingUSerTestData == null) {
			this.addUserTestData(userTestData);
		} else
			userTestData = existingUSerTestData;
		
		return userTestData;
	}

	@Override
	public List<UserTestData> getActiveUserTestDataByUserId(long userId) {
		return userTestDataDao.getActiveUserTestDataByUserId(userId);
	}

	@Override
	public void deleteUserTestData(long test1Id, long userId) {
		userTestDataDao.deleteUserTestData( test1Id, userId);
		
	}

}
