package com.dao;

import com.domain.KeChengFile;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class KeChengFileDaoImpl extends HibernateDaoSupport implements IKeChengFileDao {

    @Autowired
    public void mySessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public void save(KeChengFile keChengFile) {
        this.getHibernateTemplate().save(keChengFile);
    }

    @Override
    public List<KeChengFile> findAllKeChengFile() {
        String hql = "FROM KeChengFile";
        List<KeChengFile> list = (List<KeChengFile>) this.getHibernateTemplate().find(hql);
        if(list!=null && list.size()>0){
            return list;
        }
        return null;
    }

    @Override
    public KeChengFile findKeChengFileById(String id) {
        String hql = "FROM KeChengFile kc where id = ?";
        List<KeChengFile> list = (List<KeChengFile>) this.getHibernateTemplate().find(hql,id);
        if(list!=null && list.size()>0){
            KeChengFile keChengFile = list.get(0);
            return keChengFile;
        }
        return null;
    }

    @Override
    public void deleteKeChengFile(KeChengFile keChengFile) {
        this.getHibernateTemplate().delete(keChengFile);
    }
}
