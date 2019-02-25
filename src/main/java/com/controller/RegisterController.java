package com.controller;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Student;
import com.service.StudentService;

@Controller
public class RegisterController {
	
	@Autowired
	StudentService service;
	
	@RequestMapping(value="/newuser")
	public String goToRegister(Map<String, Object> mymap) {
		mymap.put("SIGNUPUSER", new Student());
		return "register";
	}
	
	@RequestMapping(value="/submituser")
	public String registerUser(@ModelAttribute("SIGNUPUSER") Student stu, ModelMap model) {
		System.out.println(stu);
		boolean status=service.addStudent(stu);
		if(status == true) {
			model.addAttribute("MSG", "Welcome "+stu.getName()+". You are successfully registered");
		}else{
			model.addAttribute("MSG", "Registration Unsuccessful");
		}
		return "register";
		
	}
	
	@RequestMapping(value="/gologin")
	public String goLogin() {
		return "redirect:login";
	}

}
