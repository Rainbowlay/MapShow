package com.tianjh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "lesson")
public class Lesson {

	@Id
	// @GeneratedValue(generator="system-uuid")
	// @GenericGenerator(name = "system-uuid",strategy="uuid")
	// @GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "assigned")
	@Column(name = "id", length = 32)
	private String id;

	@Column(name = "lessonName")
	private String lessonName;// 课程名称

	@Column(name = "lessonType")
	private String lessonType;// 课程类型

	@Column(name = "lessonUnit")
	private String lessonUnit;// 开课单位

	@Column(name = "time")
	private String time;
	
	@Column(name = "descri")
	private String descri;
	
	@Column(name = "userId")
	private String userId;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}



	public String getDescri() {
		return descri;
	}

	public void setDescri(String descri) {
		this.descri = descri;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Lesson() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public String getLessonType() {
		return lessonType;
	}

	public void setLessonType(String lessonType) {
		this.lessonType = lessonType;
	}

	public String getLessonUnit() {
		return lessonUnit;
	}

	public void setLessonUnit(String lessonUnit) {
		this.lessonUnit = lessonUnit;
	}

}
