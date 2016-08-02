package com.tianjh.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.tianjh.entity.Lesson;

public class LessonDaoImpl implements LessonDao {

	private static Logger log = Logger.getLogger(LessonDaoImpl.class);
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Lesson getLesson(String id) {
		// TODO Auto-generated method stub
		log.debug("DaoGetId:" + id);
		String hql = "from Lesson l where l.id=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, id);

		return (Lesson) query.uniqueResult();
	}

	@Override
	public List<Lesson> getAllLesson() {
		// TODO Auto-generated method stub
		String hql = "from Lesson";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		return query.list();
	}

	@Override
	public void addLesson(Lesson lesson) {
		// TODO Auto-generated method stub
		System.out.println(lesson.getId() +"  "+ lesson.getLessonName()
				+ "  "+lesson.getLessonType() +"  "+ lesson.getLessonUnit()+"  "+lesson.getTime()
				+ "  "+lesson.getDescri()+"  "+lesson.getUserId());
		sessionFactory.getCurrentSession().save(lesson);

	}

	@Override
	public boolean delLesson(String id) {
		// TODO Auto-generated method stub
		log.debug("DaoDelId:" + id);
		String hql = "delete Lesson l where l.id = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, id);

		return (query.executeUpdate() > 0);
	}

}
