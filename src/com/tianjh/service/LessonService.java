package com.tianjh.service;

import java.util.List;

import com.tianjh.entity.Lesson;

public interface LessonService {

	public Lesson getLesson(String id);// ͨ��id��ȡ�γ�

	public List<Lesson> getAllLesson();// ��ȡ���Կγ�

	public void addLesson(Lesson lesson);// ���ӿγ�

	public boolean delLesson(String id);// ͨ��idɾ���γ�

}
