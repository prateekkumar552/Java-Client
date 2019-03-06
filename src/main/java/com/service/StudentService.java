package com.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.model.Student;
@Service
public class StudentService {	
	@Autowired
	RestTemplate temp;	
	public  boolean checkUserLogin(String un, String pwd) {
		String resulturl="http://localhost:8081/MyRestDemo/student/verifylogin/"+un+"/"+pwd;
		ResponseEntity<Boolean> response=temp.getForEntity(resulturl, Boolean.class);
		return (Boolean)response.getBody();
		
	}
	
	public  List<Student> getAllStudent(){
		ResponseEntity<Student[]> response = temp.getForEntity("http://localhost:8081/MyRestDemo/student/all", Student[].class);
		return Arrays.asList(response.getBody());
	 
 }
	
	public  boolean addStudent(Student stu) {
		ResponseEntity<Boolean> response=temp.postForEntity("http://localhost:8081/MyRestDemo/student/addstudent",stu, Boolean.class);
		return (Boolean)response.getBody();
	}
	
	public  List<Student> getStudentById(int id){
		ResponseEntity<Student[]> response = temp.getForEntity("http://localhost:8081/MyRestDemo/student/"+id, Student[].class);
		return Arrays.asList(response.getBody());
	}
	
	public  void deleteStudent(Integer rollno) {
		System.out.println("I am in delete");
		temp.delete("http://localhost:8081/MyRestDemo/student/deletestudent/"+rollno);
		
	}
	
	public  void updateStudent(Student stu) {
		//temp.put("http://localhost:8081/MyRestDemo/student/updatestudent", stu);
		temp.put("http://localhost:8081/MyRestDemo/student/updatestudent", stu);
		
	}
	
	public Student getByRollno(int rollno) {
		ResponseEntity<Student> response = temp.getForEntity( "http://localhost:8081/MyRestDemo/student/get/"+rollno, Student.class);
		return response.getBody();
	}

}
