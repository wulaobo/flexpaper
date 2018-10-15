package com.dao;

import com.domain.User;

public interface IUserDao {
    User loginByUsernameAndPassword(String username, String password);

    void excuteUpdate(String QueryName,Object...objects);

    String findPasswordByUsername(String username);
}
