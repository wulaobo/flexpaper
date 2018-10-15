package com.dao;

import com.domain.CanKaoFile;
import com.domain.KeChengFile;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CanKaoFileDaoImpl extends HibernateDaoSupport implements ICanKaoFileDao {

    @Autowired
    public void mySessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public void save(CanKaoFile canKaoFile) {
        this.getHibernateTemplate().save(canKaoFile);
    }

    @Override
    public List<CanKaoFile> findAllCanKaoFile() {
        String hql = "FROM CanKaoFile";
        List<CanKaoFile> list = (List<CanKaoFile>) this.getHibernateTemplate().find(hql);
        if(list!=null && list.size()>0){
            return list;
        }
        return null;
    }

    @Override
    public void deleteCanKaoFile(CanKaoFile canKaoFile) {
        this.getHibernateTemplate().delete(canKaoFile);
    }

    @Override
    public CanKaoFile findKeChengFileById(String id) {
        String hql = "FROM CanKaoFile kc where id = ?";
        List<CanKaoFile> list = (List<CanKaoFile>) this.getHibernateTemplate().find(hql,id);
        if(list!=null && list.size()>0){
            CanKaoFile canKaoFile = list.get(0);
            return canKaoFile;
        }
        return null;
    }


}
