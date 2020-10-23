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
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Welcome admin</title>
    <style>
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #AE1438;
   color: white;
   text-align: center;
}
</style>
  </head>
<body>
<nav class="navbar navbar-light" style="background-color: #AE1438;">
  <!-- Navbar content -->
  <a class="navbar-brand"><p class="text-light"><strong>Book Bazaar</strong></p></a>
  <form class="form-inline">
  <a href="adminHomePage.jsp" class="btn btn-light btn-sm mr-2" role="button" type="submit">Back</a>
    <a href="logout.jsp" class="btn btn-light btn-sm mr-2" role="button" type="submit">Log Out</a>
    </form>
	</nav>
	<div class="container my-4">
	<center>
	<div class="card shadow p-3 mb-5 bg-white rounded" style="width: 70rem;">
  <div class="card-body">
<p class="card-text">
<p><strong>Welcome, admin <%=session.getAttribute("name")%></strong></p>




<table class="table table-borderless" border=1 width=100%>
<thead class="thead-dark">
	<tr class="table-active">
		<td><strong>Donor Name</strong></td>
		<td><strong>Donor Email</strong></td>
		<td><strong>Donor Phone</strong></td>
		<td><strong>Book</strong></td>
		<td><strong>Class</strong></td>
		<td><strong>Edit</strong></td>
		<td><strong>Delete</strong></td>
	</tr>
</thead>


<%
String cls=request.getParameter("class");
try
{
	Connection con=connectionprovider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from donor where class='"+cls+"'");
	while(rs.next())
	{
		String id=rs.getString("id");
%>

	<tr>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		<td><%= rs.getString(7) %></td>
		<td><a href="edit.jsp?id=<%=id%>"><button class="btn btn-warning">Edit</button></a></td>
		<td><a href="delete.jsp?id=<%=id%>"><button class="btn btn-danger">Delete</button></a></td>
	</tr>

<% 
	}
	%>
	</table>
		</p>
</div>
</div>
</center>
</div>
	<% 
}
catch(Exception e)
{
	out.println(e);
}

%>

<div class="footer">
  <p class="text-light">© 2020 Copyright:
    <strong>shaleen.201095@gmail.com</strong></p>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>