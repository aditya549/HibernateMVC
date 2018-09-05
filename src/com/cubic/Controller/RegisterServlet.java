package com.cubic.Controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cubic.DAO.EmployeeDAO;
import com.cubic.UserBean.EmployeeBean;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		EmployeeBean eb=new EmployeeBean();
		eb.setEname(req.getParameter("ename"));
		eb.setEdomain(req.getParameter("domain"));
		eb.setEsalary(req.getParameter("salary"));
		eb.setEmailid(req.getParameter("email"));
		eb.setPlace(req.getParameter("place"));
		eb.setExperience(req.getParameter("exp"));
		eb.setMobile(req.getParameter("mobile"));
		System.out.println("Testing Demo");
		System.out.println(req.getParameter("exp"));
		System.out.println(req.getParameter("place"));
		System.out.println(req.getParameter("email"));
		System.out.println(req.getParameter("salary"));
		System.out.println(req.getParameter("domain"));
		System.out.println(req.getParameter("ename"));
		EmployeeDAO.register(eb);
		boolean b=eb.isIsvalid();
		if(b) {
			resp.getWriter().println("<script>alert('Employee Record Is Inserted Successfully');</script>");
			resp.getWriter().println("<script>window.location.href='http://localhost:8056/Hibernate_WebApplication_CRUD/index.jsp';</script>");
			/*resp.sendRedirect("success.jsp");*/
		}
		else
		resp.getWriter().println("<script>alert('Problem Occured While Inserting PLease TRy Again Later');</script>");
		resp.getWriter().println("<script>window.location.href='http://localhost:8056/Hibernate_WebApplication_CRUD/index.jsp';</script>");
	}
}
