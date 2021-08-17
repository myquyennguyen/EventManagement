package com.eventmanagement.controller;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.eventmanagement.DAO.impl.EventDAO;
import com.eventmanagement.DAO.impl.UserDAO;
import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.entity.EventEntity;
import com.eventmanagement.entity.RegisterEventEntity;
import com.eventmanagement.entity.UserEntity;
import com.eventmanagement.hibernate.HibernateUtils;
import com.eventmanagement.service.EventService;

@Controller(value = "homeController")
public class HomeController {
	@RequestMapping(value = "/homehome", method = RequestMethod.GET)
	public String home() {
		EventService es = new EventService();
		List re = es.findAllForWeb();
		if(re != null)
			System.out.print("Dung roi!");
		else
			System.out.print("Sai roi!");
		return "home";
	}
	
	@RequestMapping(value="/create_event", method = RequestMethod.GET)
	public ModelAndView eventdetails() {
		ModelAndView view = new ModelAndView("/admin/create_event");
		return view;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView loginpage() {
		ModelAndView mav = new ModelAndView("/web/login");
		return mav;
	}
	
	@RequestMapping(value="/403", method = RequestMethod.GET)
	public ModelAndView page403() {
		ModelAndView mav = new ModelAndView("/web/403");
		return mav;
	}
	
	@GetMapping("/user/registration")
	public String showRegistrationForm(WebRequest request, Model model) {
	    UserDTO userDto = new UserDTO();
	    model.addAttribute("user", userDto);
	    return "registration";
	}
	
	@GetMapping("/test")
	public void test() {
		UserDAO userdao = new UserDAO();
		EventDAO eventDAO = new EventDAO();
		
		UserEntity user = userdao.findUserByUserId(1);
		EventEntity event = eventDAO.findEventById(1);
		RegisterEventEntity register = new RegisterEventEntity();
		register.setEvent(event);
		register.setUser(user);
		register.setCountTickets(10);
		Session session = HibernateUtils.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(register);
		session.getTransaction().commit();
		System.out.print("Role la:"+user.getRole().getRoleName());
	}
	
}
