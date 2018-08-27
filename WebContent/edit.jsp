<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.cubic.UserBean.EmployeeBean"%>
<%@page import="org.hibernate.Query"%>
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
<title>Hibernate Web Application Edit Page</title>
</head>
<body>

<%
Configuration cfg=new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory factory=cfg.buildSessionFactory();
Session s=factory.openSession();
Transaction t=s.beginTransaction();
int eid=Integer.parseInt(request.getParameter("eid"));
Query q=s.createQuery("from EmployeeBean where eid=:eid");
q.setInteger("eid", eid);
List<EmployeeBean> ls=q.list();
Iterator itr=ls.iterator();
while(itr.hasNext())
{
EmployeeBean eb=(EmployeeBean)itr.next();
%>

<p align="center">Hi User, Welcome To Cubic It Solution<br><br>
Please Fill Bellow To Update You'r Registration Form</p>
<hr style="text-align: center;border: outset;margin-left: 400px;margin-right: 400px">
<hr style="text-align: center;border: outset;margin-left: 450px;margin-right: 450px">
<h1 style="text-align: center;border: outset;margin-left: 400px;margin-right: 400px">Update Employee Registration Form</h1>
<form action="UpdateServlet" method="post">
<table align="center" cellpadding="10" border="4">
	<tr>
		<td>Enter Employee Name</td><td><input type="text" name="ename" value="<%=eb.getEname() %>"></td></tr>
		<tr><td>Enter Employee Domain</td><td>
		<select name="domain">
		<%if(eb.getEdomain().equalsIgnoreCase("Java")){%> 
		<option value="JAVA" selected="selected">JAVA</option>
		<option value="DOTNET">DotNet</option>
		<option value="Testing">Testing</option>
		<option value="WEB Designing">Web Designing</option>
		<%}if(eb.getEdomain().equalsIgnoreCase("dotnet")){%> 
		<option value="JAVA" >JAVA</option>
		<option value="DOTNET" selected="selected">DotNet</option>
		<option value="Testing">Testing</option>
		<option value="WEB Designing">Web Designing</option>
		<%}if(eb.getEdomain().equalsIgnoreCase("Testing")){%>
		<option value="JAVA" >JAVA</option>
		<option value="DOTNET" >DotNet</option>
		<option value="Testing" selected="selected">Testing</option>
		<option value="WEB Designing">Web Designing</option>
		<%}if(eb.getEdomain().equalsIgnoreCase("Web Designing")){%>
		<option value="JAVA" >JAVA</option>
		<option value="DOTNET" >DotNet</option>
		<option value="Testing">Testing</option>
		<option value="WEB Designing" selected="selected">Web Designing</option>
		<%}%>		
		</select></td></tr>
		<tr><td>Enter Employee Salary</td><td><input type="text" name="salary" value="<%=eb.getEsalary() %>"></td></tr>
		<tr><td>Enter Employee Email id</td><td><input type="text" name="email" value="<%=eb.getEmailid() %>"></td></tr>
		<tr><td>Enter Employee Place</td><td>
		<select name="place" value="<%=eb.getPlace() %>">
		<%if(eb.getPlace().equalsIgnoreCase("Hyderabad")){%>
		<option value="Hyderabad" selected="selected">Hyderabad</option>
		<option value="Chennai">Chennai</option>
		<option value="Bangalore">Bangalore</option>
		<option value="Pune">Pune</option>
		<%}if(eb.getPlace().equalsIgnoreCase("Chennai")){%>
				<option value="Hyderabad" >Hyderabad</option>
		<option value="Chennai" selected="selected">Chennai</option>
		<option value="Bangalore">Bangalore</option>
		<option value="Pune">Pune</option>
		<%}if(eb.getPlace().equalsIgnoreCase("Bangalore")){%>
				<option value="Hyderabad" >Hyderabad</option>
		<option value="Chennai">Chennai</option>
		<option value="Bangalore" selected="selected">Bangalore</option>
		<option value="Pune" >Pune</option>
		<%}if(eb.getPlace().equalsIgnoreCase("pune")){%>
				<option value="Hyderabad" >Hyderabad</option>
		<option value="Chennai">Chennai</option>
		<option value="Bangalore">Bangalore</option>
		<option value="Pune" selected="selected">Pune</option>
		<%}%>
		</select></td></tr>
		<tr><td>Enter Employee Experience</td><td><input type="text" name="exp" value="<%=eb.getExperience() %>"></td></tr>
		<tr align="center"><td colspan="2">
		<input type="hidden" name="eid" value="<%=eb.getEid() %>">
		<input type="submit" value="Update">&nbsp&nbsp&nbsp&nbsp
		<input type="reset" value="Clear All Fields"></td>
	</tr>
</table>
</form>
<% 
}
%>
<p align="center"><a href="fetch.jsp">Cancel The Update Registration Goto Employee Records</a></p>
<p align="center"><a href="index.jsp">Goto Home</a></p>
<hr style="text-align: center;border: outset;margin-left: 400px;margin-right: 400px">
<hr style="text-align: center;border: outset;margin-left: 450px;margin-right: 450px">
<p align="center">&copy;&reg;Cubic It Solution Pvt Ltd</p>
</body>
</html>