package com.cubic.Controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cubic.DAO.EmployeeDAO;
import com.cubic.UserBean.EmployeeBean;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		try {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session s=factory.openSession();
		Transaction tx=s.beginTransaction();
		System.out.println("Testing DAO");
		int eid=Integer.parseInt(req.getParameter("eid"));
		EmployeeBean eb=(EmployeeBean)s.get(EmployeeBean.class, eid);
		eb.setEname(req.getParameter("ename"));
		eb.setEdomain(req.getParameter("domain"));
		eb.setEsalary(req.getParameter("salary"));
		eb.setEmailid(req.getParameter("email"));
		eb.setPlace(req.getParameter("place"));
		eb.setExperience(req.getParameter("exp"));
		s.update(eb);
		tx.commit();
		resp.getWriter().println("<script>alert('Employee Record Is Updated Successfully');</script>");
		resp.getWriter().println("<script>window.location.href='http://localhost:8056/Hibernate_WebApplication_CRUD/fetch.jsp';</script>");
		/*resp.sendRedirect("success.jsp");*/
		s.close();
		factory.close();
		}
		catch (Exception e) {
			resp.sendRedirect("fail.jsp");
		}
			
	}
}
