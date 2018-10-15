package com.service;

import com.domain.User;

public interface IUserService {
    User login(User user);

    void updateUser(String username, String password, String id);

    String findPasswordByUsername(String username);
}
