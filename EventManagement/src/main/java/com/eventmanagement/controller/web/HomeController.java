package com.eventmanagement.controller.web;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eventmanagement.dto.CustomersDTO;
import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.service.UserService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(Principal principal) {
		ModelAndView mav = new ModelAndView("web/home");
		String username = "0";
		if(principal != null) {
			username = principal.getName();
			if(username != null)
				mav.addObject("username", username);
		}
		return mav;
	}
	@RequestMapping(value = "/su-kien/{id}", method = RequestMethod.GET)
	public ModelAndView eventDetail(@PathVariable("id") int id, Principal principal) {
		ModelAndView mav = new ModelAndView("/web/eventdetails");
		mav.addObject("id", id);
		String username = "0";
		if(principal != null) {
			username = principal.getName();
			if(username != null)
				mav.addObject("username", username);
		}
		return mav;
	}
	
	@RequestMapping(value="/dang-ky", method = RequestMethod.GET)
	public ModelAndView register() {
		UserDTO userdto =  new UserDTO();
		ModelAndView mav = new ModelAndView("/web/register");
		mav.addObject("user", userdto);
		return mav;
	}
	
	@RequestMapping(value="/thong-tin-nguoi-dung/{username}", method = RequestMethod.GET)
	public ModelAndView userInf(@PathVariable("username") String username) {
		ModelAndView mav = new ModelAndView("/web/userInf");
		UserService us = new UserService();
		List<CustomersDTO> customerDTO = us.listEventByUsername(username);
		UserDTO user = us.findUserByUsername(username);
		mav.addObject("user", user);
		mav.addObject("events", customerDTO);
		return mav;
	}
	
}
