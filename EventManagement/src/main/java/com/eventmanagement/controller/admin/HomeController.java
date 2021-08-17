package com.eventmanagement.controller.admin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eventmanagement.dto.EventDTO;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public  ModelAndView createEvent() {
		ModelAndView mav = new ModelAndView( "/admin/create_event");
		mav.addObject("id", 0);
		return mav;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editEvent(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/admin/update_event");
		mav.addObject("update", 0);
		mav.addObject("id", id);
		return mav;
	}
	@RequestMapping(value="/edit/{id}/edit", method=RequestMethod.GET)
	public ModelAndView editEventEdit(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/admin/update_event");
		mav.addObject("update", 1);
		mav.addObject("id", id);
		return mav;
	}
	
	@RequestMapping(value="/event/{id}")
	public ModelAndView viewEvent(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/admin/eventdetails");
		mav.addObject("id", id);
		return mav;
	}
	
	@RequestMapping(value="/listcustomers/{id}")
	public ModelAndView listCustomers(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/admin/listcustomer");
		mav.addObject("id", id);
		return mav;
	}
	
	@RequestMapping(value="/view/review")
	public  ModelAndView reviewEvent_(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object event = session.getAttribute("event");
		ModelAndView mav = new ModelAndView( "/admin/review");
		mav.addObject("id", -1);
		mav.addObject("event", event);
		return mav;
	}
	
	@RequestMapping(value="/create/edit")
	public  ModelAndView createEvent_(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object event = session.getAttribute("event");
		ModelAndView mav = new ModelAndView( "/admin/create_event");
		mav.addObject("id", -1);
		mav.addObject("event", event);
		return mav;
	}
		
	@RequestMapping(value="/review")
	@ResponseBody
	public void reviewEvent(@RequestBody EventDTO event, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("event", event);
	}
	
	@RequestMapping(value="/removesession")
	@ResponseBody
	public void removeSession(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("event");
	}
}
