package com.dao;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import javax.annotation.Resource;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements IBaseDao<T> {

    //代表的是某个实体的类型
    private Class<T> entityClass;

    @Resource(name="sessionFactory")
    public void mySessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    public BaseDaoImpl() {
        ParameterizedType superclass = (ParameterizedType) this.getClass().getGenericSuperclass();
        Type[] actualTypeArguments = superclass.getActualTypeArguments();
        entityClass = (Class<T>) actualTypeArguments[0];
    }

    public void save(T entity) {
        this.getHibernateTemplate().save(entity);
    }

    public void delete(T entity) {
        this.getHibernateTemplate().delete(entity);
    }

    public T findById(Serializable id) {
        return this.getHibernateTemplate().get(entityClass,id);
    }

    public List<T> findAll() {
        String hql = "from "+entityClass.getSimpleName();
        return (List<T>) this.getHibernateTemplate().find(hql);
    }
}
