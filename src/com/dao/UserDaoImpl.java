package com.dao;

import com.domain.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class UserDaoImpl extends HibernateDaoSupport implements IUserDao{

    @Autowired
    public void mySessionfactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public User loginByUsernameAndPassword(String username, String password) {
        String hql = "FROM User u WHERE u.username = ? AND u.password = ?";
        List<User> list = (List<User>) this.getHibernateTemplate().find(hql,username,password);
        if(list!=null && list.size()>0){
            User user = list.get(0);
            return user;
        }
        return null;
    }

    public void excuteUpdate(String QueryName, Object... objects) {
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.getNamedQuery(QueryName);
        int i = 0;
        for (Object object:objects) {
            query.setParameter(i++,object);
        }
        query.executeUpdate();  //执行更新和删除语句
    }

    @Override
    public String findPasswordByUsername(String username) {
        String hql = "SELECT u.password FROM User u WHERE u.username = ?";
        List<Object> list = (List<Object>) this.getHibernateTemplate().find(hql,username);
        if(list!=null && list.size()>0){
            String password = (String) list.get(0);
            return password;
        }
        return null;
    }
}
