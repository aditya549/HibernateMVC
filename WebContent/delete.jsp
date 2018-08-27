<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.cubic.UserBean.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory();
Session s=factory.openSession();
Transaction t=s.beginTransaction();
int eid=Integer.parseInt(request.getParameter("eid"));
EmployeeBean eb=(EmployeeBean)s.get(EmployeeBean.class, eid);
s.delete(eb);
t.commit();
s.close();
factory.close();
%>
<script>
alert("One Record Deleted Successfully");
window.location.href="http://localhost:8056/Hibernate_WebApplication_CRUD/fetch.jsp";
</script>
</body>
</html>