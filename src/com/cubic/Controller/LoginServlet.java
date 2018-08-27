package com.cubic.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.lf5.viewer.LogFactor5InputDialog;

import com.cubic.DAO.LoginDao;
import com.cubic.UserBean.AdminTable;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		PrintWriter out=resp.getWriter();
		AdminTable at=new AdminTable();
		at.setAdminname(req.getParameter("uname"));
		at.setAdminpassword(req.getParameter("password"));
		LoginDao.login(at);
		boolean test=at.getValid();
		if(test) {
			out.println("<script>alert('Login Successfully');</script>");
			out.println("<script>window.location.href='http://localhost:8056/Hibernate_WebApplication_CRUD/index.jsp';</script>");
		}
		else
			out.println("<script>alert('Invalid Details PLease Try Again');</script>");
		out.println("<script>window.location.href='http://localhost:8085/Hibernate_WebApplication_CRUD';</script>");
	}

}
