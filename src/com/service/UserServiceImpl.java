package com.service;

import com.dao.IUserDao;
import com.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public User login(User user) {
        String username = user.getUsername();
        String password = user.getPassword();
        User u = userDao.loginByUsernameAndPassword(username,password);
        return u;
    }

    @Override
    public void updateUser(String username, String password, String id) {
        userDao.excuteUpdate("user.updateUser",username,password,id);
    }

    @Override
    public String findPasswordByUsername(String username) {
        String password = userDao.findPasswordByUsername(username);
        return password;
    }
}
