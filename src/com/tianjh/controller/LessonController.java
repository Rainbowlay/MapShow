package com.tianjh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tianjh.entity.Lesson;
import com.tianjh.service.LessonService;

@Controller
@RequestMapping("/lesson")
public class LessonController {

	private static Logger log = Logger.getLogger(LessonController.class);

	@Resource(name = "lessonService")
	private LessonService lessonService;

	@RequestMapping("/toGetAllLesson")
	public String toGetAllLesson(){
		return "getAllLesson";
	}
	@ResponseBody
	@RequestMapping("/getAllLesson")
	public List<Lesson> getAllLesson(HttpServletRequest request) {
		//request.setAttribute("lessonList", lessonService.getAllLesson());
		List<Lesson> list = lessonService.getAllLesson();
		return list;
	}

	@RequestMapping("/toGetLesson")
	public String toGetLesson() {
		return "getLesson";
	}

	@RequestMapping("/toShow")
	public String toShow() {
		return "show";
	}
	// 非RESTFUL方式
	// @RequestMapping("/getLesson")
	// public String getLesson(String id, HttpServletRequest request) {
	//
	// request.setAttribute("lesson", lessonService.getLesson(id));
	// return "/getLesson";
	// }
	@RequestMapping(value = "/getLesson/{id}", method = RequestMethod.GET)
	public String getLesson(@PathVariable String id, HttpServletRequest request) {

		log.debug("getLessonId:" + id);
		request.setAttribute("lesson", lessonService.getLesson(id));
		return "/getLesson";
	}

	// 非RESTFUL方式
	// @RequestMapping("/toAddLesson")
	// public String toAddLesson() {
	// return "addLesson";
	// }
	//
	// @RequestMapping("/addLesson")
	// public String addLesson(Lesson lesson, HttpServletRequest request) {
	//
	// lessonService.addLesson(lesson);
	//
	// return "redirect:/lesson/getAllLesson";
	// }

	// @RequestMapping(value = "/toAddLesson", method = RequestMethod.GET)
	@RequestMapping(value = "/toAddLesson")
	// public String addLesson(@ModelAttribute("lesson") Lesson lesson) {
	public String toaddLesson() {
		return "addLesson";
	}

	// @RequestMapping(value = "/addLesson", method = RequestMethod.POST)
	@RequestMapping(value = "/addLesson", method = RequestMethod.POST)
	// public String addLesson(@Validated Lesson lesson, BindingResult mm)
	// throws IOException { // @Validated: 对User数据进行校验
	// if (mm.hasErrors()) {
	// return "lesson/addLesson";
	// }
	// lessonService.addLesson(lesson);
	// return "redirect:/lesson/getAllLesson";
	// }
	public void addLesson(@RequestBody Lesson lesson,
			HttpServletResponse response) {
		String result = "{\"id\":\"" + lesson.getId() + "\",\"userName\":\""
				+ lesson.getUserId() + "\"}";
		System.out.println("11111111111111");
		System.out.println(result);
		lessonService.addLesson(lesson);
		response.setContentType("application/json");
		System.out.println(result);
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// return "redirect:/lesson/getAllLesson";
	}

	// 非RESTFUL方式
	// @RequestMapping("/toDelLesson")
	// public String toDelLesson() {
	// return "delLesson";
	// }

	// @RequestMapping("/delLesson")
	// public void delLesson(String id, HttpServletResponse response) {
	//
	// String result = "{\"result\":\"error\"}";
	//
	// if (lessonService.delLesson(id)) {
	// result = "{\"result\":\"success\"}";
	// }
	//
	// response.setContentType("application/json");
	//
	// try {
	// PrintWriter out = response.getWriter();
	// out.write(result);
	// System.out.println(result);
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public void delete(@PathVariable String id, HttpServletResponse response) {

		log.debug("delLessonId:" + id);
		String result = "{\"result\":\"error\"}";

		if (lessonService.delLesson(id)) {
			result = "{\"result\":\"success\"}";
		}

		response.setContentType("application/json");

		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
