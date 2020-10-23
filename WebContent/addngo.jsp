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
String name=request.getParameter("name");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
try
{
	Connection con=connectionprovider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("insert into ngo (ngo_name,ngo_address,ngo_phone) values ('"+name+"','"+address+"','"+phone+"')");
	con.close();	
	response.sendRedirect("ConfirmAddNGO.html");
}
catch(Exception e)
{
	out.println("mail not sent");
	out.println(e);
}

%>
</body>
</html>