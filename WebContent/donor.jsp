<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="project.EmailSenderClass" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="project.connectionprovider" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>book bazaar</title>
</head>
<body>
<%
String name=request.getParameter("dname");
String email=request.getParameter("demail");
String address=request.getParameter("address");
String pincode=request.getParameter("pin");
String phone=request.getParameter("dphn");
String book=request.getParameter("book");
String cls=request.getParameter("class");
try
{
	Connection con=connectionprovider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("insert into donor (name,email,address,pincode,phone,book,class) values ('"+name+"','"+email+"','"+address+"','"+pincode+"','"+phone+"','"+book+"','"+cls+"')");
	con.close();
	//sending email to donor
	EmailSenderClass.emailChecker(name,email,address,pincode,phone,book,cls);	
	response.sendRedirect("Confirm.html");
}
catch(Exception e)
{
	out.println("mail not sent");
	out.println(e);
}

%>
</body>
</html>