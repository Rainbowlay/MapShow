package com.tianjh.service;

import java.util.List;

import com.tianjh.entity.Lesson;

public interface LessonService {

	public Lesson getLesson(String id);// 通过id获取课程

	public List<Lesson> getAllLesson();// 获取所以课程

	public void addLesson(Lesson lesson);// 增加课程

	public boolean delLesson(String id);// 通过id删除课程

}
