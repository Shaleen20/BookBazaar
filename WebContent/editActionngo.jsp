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
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	try
	{
		Connection con=connectionprovider.getCon();
		PreparedStatement ps=con.prepareStatement("update ngo set ngo_name=?,ngo_address=?,ngo_phone=? where ngo_id=?");
		ps.setString(1,name);
		ps.setString(2,address);
		ps.setString(3,phone);
		ps.setString(4,id);
		ps.executeUpdate();
		response.sendRedirect("confirmUpdateNGO.html");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>