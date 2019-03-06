package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.Student;
import com.service.StudentService;


@Controller
public class LoginController {
	
	@Autowired
	StudentService service;
	
	
	
	@RequestMapping(value="/login")
	public String getMessage(Map<String,Student> model){
		System.out.println("i am in login");
		Student stu=new Student();
		model.put("mylogin",stu);
		return "login";		
	}
	
	@RequestMapping(value="/loginformdata",method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("mylogin")Student stu,BindingResult result,HttpServletRequest req) {
		System.out.println("i am in login");
		boolean flag=service.checkUserLogin(stu.getUsername(), stu.getPassword());
		if(flag==false) {
			req.setAttribute("MSG", "Username or Password incorrect");
			return "login";
		}
		/*validator.validate(stu, result);
		if(result.getErrorCount()!=0) {
			req.setAttribute("mylogin", stu);
			return "login";
		}*/
		else {
			/*ModelAndView model=new ModelAndView();
			model.addObject("MSG", "Welcome "+stu.getName());
			
			List<Student> al=service.getAllStudent();*/
			req.setAttribute("MSG", "Welcome");
			
			return "welcome";
		}
	}
	
	@RequestMapping(value="/gologout")
	public String userLogout() {
		return "redirect:login";
	}
	
	@RequestMapping(value="/showall")
	public String showall(@ModelAttribute("STU")Student stu,BindingResult result, HttpServletRequest req) {
		System.out.println("i am in welcome");
		List<Student> al=service.getAllStudent();
		req.setAttribute("AL", al);
		
		return "welcome";
	}
	
	/*@RequestMapping(value="/showall", method=RequestMethod.GET)
	public String showall(Model model) {
		model.addAttribute("student", new Student());
		model.addAttribute("listStudents", this.service.getAllStudent());
		return "welcome";
	}*/
	
	
	/*@RequestMapping(value="/delete/{rollno}")
	public String deleteUser(@ModelAttribute("STUD")Student stu,BindingResult result, HttpServletRequest req) {
		boolean status=service.deleteStudent(stu.getRollno());
		if(status == false) {
			req.setAttribute("ID", "User not found");
			
		}else {
			req.setAttribute("ID", "User successfully deleted");
		}
		return "redirect:welcome";
	}*/
	
	@RequestMapping(value="/delete/{rollno}")
	public String removeStudent(@PathVariable("rollno") int rollno, HttpServletRequest req) {
		System.out.println("I am in removeStudent()");
		
		/*List<Student> li=service.getAllStudent();
		for(Student list:li) {
			  rollno=list.getRollno();
		}*/
		    
		this.service.deleteStudent(rollno);
		List<Student> al=service.getAllStudent();
		req.setAttribute("AL", al);
		return "welcome";
	}
	
	@RequestMapping(value="/edit/{rollno}")
	public String updateStudent(@ModelAttribute("Student")Student stu, BindingResult result, Model m) {
		System.out.println("I am in updateStudent()");
		Student st=service.getByRollno(stu.getRollno());
		m.addAttribute("Student", st);
		System.out.println("updateform");
		return "update";
		
	}
	
	/*@RequestMapping(value="/delete/{rollno}")
	public String deleteUser(@ModelAttribute("STUD")Student stu,BindingResult result, HttpServletRequest req) {
		System.out.println("I am in deleteUser()");
		Boolean flag=service.deleteStudent(stu.getRollno());
		if(flag==false) {
			req.setAttribute("MSG", "Invalid User");
		}else {
			List<Student> al=service.getAllStudent();
			req.setAttribute("AL", al);
		}
		this.service.deleteStudent(stu.getRollno());
		return "welcome";
	}
*/
	@RequestMapping(value="/editsave")
	public String editsave(@ModelAttribute("Student")Student stu) {
		System.out.println("I am in edit save");
		this.service.updateStudent(stu);
		return "redirect:/showall";
	}
}
