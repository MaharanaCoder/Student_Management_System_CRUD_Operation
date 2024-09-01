package com.studentproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Attributes.Name;

import org.apache.catalina.valves.StuckThreadDetectionValve;

public class StudentDAO {
	
	public static int saveData(AddStudent s) {
		
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "");
			PreparedStatement pst = con.prepareStatement("INSERT INTO sms.student(Name, Class, Age, Address, Phoneno, Gender) values(?,?,?,?,?,?)");
			pst.setString(1, s.getName());
			pst.setString(2, s.getClasss());
			pst.setInt(3, s.getAge());
			pst.setString(4, s.getAddress());
			pst.setString(5, s.getMobile());
			pst.setString(6, s.getGender());
			
		   result =	pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
		
	}
	
	public static List<AddStudent> displyaData() {
		List<AddStudent> s = new ArrayList<AddStudent>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from sms.student");
			while(rs.next()) {
				AddStudent student = new AddStudent();
				
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("Name"));
				student.setClasss(rs.getString("Class")); 
				student.setAge(rs.getInt("age"));
				student.setAddress(rs.getString("Address"));
				student.setMobile(rs.getString("Phoneno"));
				student.setGender(rs.getString("Gender"));
				
				s.add(student);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return s;	
	}
	
	
	public static int deleteStudent(int id) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "");
			PreparedStatement pst = con.prepareStatement("delete from sms.student where id = ?");
			pst.setInt(1, id);
			result = pst.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	
	public static AddStudent updateStudent(int id) {
		AddStudent student = new AddStudent();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from sms.student where id="+id);
			while(rs.next()) {
				
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("Name"));
				student.setClasss(rs.getString("Class")); 
				student.setAge(rs.getInt("age"));
				student.setAddress(rs.getString("Address"));
				student.setMobile(rs.getString("Phoneno"));
				student.setGender(rs.getString("Gender"));
				
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
		
	}
	
	public static int updateById(AddStudent s) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "");
			PreparedStatement pst  = con.prepareStatement("UPDATE sms.student SET Name=?,Class=?,Age=?,Gender=?,Address=?,Phoneno=? WHERE id=?");
			pst.setString(1,s.getName());
			pst.setString(2, s.getClasss());
			pst.setInt(3, s.getAge());
			pst.setString(4,s.getGender());
			pst.setString(5,s.getAddress());
			pst.setString(6,s.getMobile());
			pst.setInt(7, s.getId());
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public static List<AddStudent> searchName(String name) {
		List<AddStudent> s = new ArrayList<AddStudent>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sms", "root", "");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from sms.student where Name like '%"+ name +"%'");
			while(rs.next()) {
				AddStudent student = new AddStudent();
				
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("Name"));
				student.setClasss(rs.getString("Class")); 
				student.setAge(rs.getInt("age"));
				student.setAddress(rs.getString("Address"));
				student.setMobile(rs.getString("Phoneno"));
				student.setGender(rs.getString("Gender"));
				
				s.add(student);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
		
	}

}
