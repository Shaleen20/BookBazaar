<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("name")==null)
{
	response.sendRedirect("adminLogin.html");
}

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="project.connectionprovider" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editing record</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("dname");
	String email=request.getParameter("demail");
	String phone=request.getParameter("dphn");
	String book=request.getParameter("book");
	String cls=request.getParameter("class");
	out.println(id+" "+name+" "+email+" "+phone+" "+book+" "+cls);
	try
	{
		Connection con=connectionprovider.getCon();
		PreparedStatement ps=con.prepareStatement("update donor set name=?,email=?,phone=?,book=?,class=? where id=?");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,phone);
		ps.setString(4,book);
		ps.setString(5,cls);
		ps.setString(6,id);
		ps.executeUpdate();
		response.sendRedirect("confirmUpdate.html");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>