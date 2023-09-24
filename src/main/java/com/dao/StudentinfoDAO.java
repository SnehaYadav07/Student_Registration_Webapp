package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import com.entity.student;

public class StudentinfoDAO {

	private Connection conn;
	
	public StudentinfoDAO(Connection conn) {
		super();
		this.conn=conn;
	}
		
	
	public boolean saveStudent(student s) {
			boolean f=false;
			
			try {
				String sql="insert into students_information(name,email,age,userid) values(?,?,?,?)";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, s.getName());
				ps.setString(2, s.getEmail());
				ps.setString(3, s.getAge());
				ps.setInt(4, s.getUserid());
				
				int i=ps.executeUpdate();
				
				if(i==1) {
					f=true;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return f;
		}
	
	public List<student> getAllStudents(int id)
	{
		
		List <student> list=new ArrayList<student>();
		
		student student=null;
		
		try {
			
			String sql="select * from students_information where userid=? order by name";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1 ,id);
			
			ResultSet rsResultSet=ps.executeQuery();
			
			while(rsResultSet.next()) {
				
				student=new student();
				student.setId(rsResultSet.getInt(1));
				student.setName(rsResultSet.getString(2));
				student.setEmail(rsResultSet.getString(3));
				student.setAge(rsResultSet.getString(4));
				
				list.add(student);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	
	
	public student getStudentbyIdintStudent (int sid)
	{
		
		student student=new student();
		
		try {
			
			PreparedStatement ps=conn.prepareStatement("select * from students_information where id=? ");
			ps.setInt(1, sid);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				student.setId(rs.getInt(1));
				student.setName(rs.getString(2));
				student.setEmail(rs.getString(3));
				student.setAge(rs.getString(4));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return student;
	}
	
	public boolean updateStudent(student s)
	{
		boolean f=false;
		
		try {
			String sql="update students_information set name=?,email=?,age=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, s.getName());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getAge());
			ps.setInt(4, s.getId());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteStudent(int id) {
		boolean f=false;
		
		try {
			
			String sql="delete from students_information where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}
}
	
