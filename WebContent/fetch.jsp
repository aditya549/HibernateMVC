<%@page import="java.util.Iterator"%>
<%@page import="com.cubic.UserBean.EmployeeBean"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Records Display Page</title>
</head>
<body>
<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory();
Session s=factory.openSession();
Transaction t=s.beginTransaction();
List<EmployeeBean> l=s.createQuery("from EmployeeBean").list();
Iterator itr=l.iterator();
%>
<h1 align="center" style="border: outset;margin-left: 400px;margin-right: 400px">All Employee Details</h1>
<table align="center" border="4" cellpadding="5">
<tr>
<th>Employee Name</th>
<th>Employee Domain</th>
<th>Employee Salary</th>
<th>Employee MAILID</th>
<th>Employee Place</th>
<th>Employee Experience</th>
<th>Modifications</th></tr>
<% 
while(itr.hasNext()){
	EmployeeBean eb=(EmployeeBean)itr.next();
%>
	<tr>
	<td align="center"><%=eb.getEname() %></td>
	<td align="center"><%=eb.getEdomain() %></td>
	<td align="center"><%=eb.getEsalary() %></td>
	<td align="center"><%=eb.getEmailid() %></td>
	<td align="center"><%=eb.getPlace() %></td>
	<td align="center"><%=eb.getExperience() %></td>
	<td align="center"><a href="edit.jsp?eid=<%=eb.getEid() %>">Edit</a>&nbsp&nbsp
	
	<a href="delete.jsp?eid=<%=eb.getEid()%>" onclick="return confirm('Are you sure You Want To Delete?')">delete</a></td>
	</tr>
<% 
}
%>
</table>
<% 
t.commit();
s.close();
factory.close();
%>
<h1 align="center" style="margin-left: 800px; margin-right: 200px;border: outset;"><a href="index.jsp">Goto Home</a></h1>
</body>
</html>