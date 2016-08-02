package com.tianjh.service;

import java.util.List;

import com.tianjh.dao.LessonDao;
import com.tianjh.entity.Lesson;

public class LessonServiceImpl implements LessonService {

	private LessonDao lessonDao;

	public void setLessonDao(LessonDao lessonDao) {
		this.lessonDao = lessonDao;
	}

	@Override
	public Lesson getLesson(String id) {
		// TODO Auto-generated method stub
		return lessonDao.getLesson(id);
	}

	@Override
	public List<Lesson> getAllLesson() {
		// TODO Auto-generated method stub
		return lessonDao.getAllLesson();
	}

	@Override
	public void addLesson(Lesson lesson) {
		// TODO Auto-generated method stub
		lessonDao.addLesson(lesson);

	}

	@Override
	public boolean delLesson(String id) {
		// TODO Auto-generated method stub
		return lessonDao.delLesson(id);
	}

}
