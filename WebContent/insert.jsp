<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hibernate Web Application</title>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>

<p align="center">Hi User, Welcome To Cubic It Solution<br><br>
Please Fill Bellow Registration Form</p>
<hr style="text-align: center;border: outset;margin-left: 400px;margin-right: 400px">
<hr style="text-align: center;border: outset;margin-left: 450px;margin-right: 450px">
<h1 style="text-align: center;border: outset;margin-left: 400px;margin-right: 400px">Employee Registration Form</h1>
<form action="RegisterServlet" method="post">
<table align="center" cellpadding="10" border="4">
	<tr>
		<td>Enter Employee Name</td><td><input type="text" name="ename"></td></tr>
		<tr><td>Enter Employee Domain</td><td><select name="domain">
		<option value="JAVA">Java</option>
		<option value="DOTNET">DotNet</option>
		<option value="Testing">Testing</option>
		<option value="WEB Designing">Web Designing</option>
		</select></td></tr>
		<tr><td>Enter Employee Salary</td><td><input type="text" name="salary"></td></tr>
		<tr><td>Enter Employee Email id</td><td><input type="text" name="email"></td></tr>
		<tr><td>Enter Employee Mobile Number</td><td><input type="text" name="mobile"></td></tr>
		<tr><td>Enter Employee Place</td><td><select name="place">
		<option value="Hyderabad">Hyderabad</option>
		<option value="Chennai">Chennai</option>
		<option value="Bangalore">Bangalore</option>
		<option value="Pune">Pune</option>
		</select></td></tr>
		<tr><td>Enter Employee Experience</td><td><input type="text" name="exp"></td></tr>
		<tr align="center"><td colspan="2"><input type="submit" value="submit">&nbsp&nbsp&nbsp&nbsp
		<input type="reset" value="Clear All Fields"></td>
	</tr>
</table>
</form>
<p align="center"><a href="index.jsp">Cancel The Registration Goto Home</a></p>
<hr style="text-align: center;border: outset;margin-left: 400px;margin-right: 400px">
<hr style="text-align: center;border: outset;margin-left: 450px;margin-right: 450px">
<p align="center">&copy;&reg;Cubic It Solution Pvt Ltd</p>
</body>
<script>
window.history.forward();
function noBack() { 
window.history.forward(); 
}
 </script>
</html>