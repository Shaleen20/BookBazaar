<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("name")==null)
{
	response.sendRedirect("adminLogin.html");
}
%>

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
	<div class="card shadow p-3 mb-5 bg-white rounded" style="width: 54rem;">
  <div class="card-body">
<p class="card-text">
<p><strong>Welcome, admin <%=session.getAttribute("name")%></strong></p>

<%
try
{
	String id=request.getParameter("id");
	Connection con=connectionprovider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from donor where id='"+id+"'");
	while(rs.next())
	{
%>

<form action="editAction.jsp" method="post">
<table class="table table-borderless">
<tr>
	<td><strong>Donor ID</strong></td>
	<td><input type="text" name="id" value="<%= rs.getString("id") %>" style="width: 500px;" readonly></td>
</tr>
<tr>
	<td><strong>Donor Name</strong></td>
	<td><input type="text" name="dname" value="<%= rs.getString("name") %>" style="width: 500px;"></td>
</tr>
<tr>
	<td><strong>Donor Email ID</strong></td>
	<td><input type="email" name="demail" value="<%= rs.getString("email") %>" style="width: 500px;"></td>
</tr>
<tr>
	<td><strong>Donor Phone No.</strong></td>
	<td><input type="text" name="dphn" value="<%= rs.getString("phone") %>" style="width: 500px;"></td>
</tr>
<tr>
	<td><strong>Book</strong></td>
	<td><input type="text" name="book" value="<%= rs.getString("book") %>" style="width: 500px;"></td>
</tr>
<tr>
	<td><strong>Class</strong></td>
	<td><select class="custom-select" name="class" style="width: 500px;">
  <option selected><%=rs.getString("class") %></option>
  <option value="Below 1">Below 1</option>
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
  <option value="Above 12">Above 12</option>
</select></td>
</tr>
<%
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
</table>
<center><input type="submit" value="Update" class="btn btn-info"></center>
</form>
</p>
</div>
</div>
</center>
</div>
<footer class="page-footer font-small" style="background-color: #AE1438;">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3"><p class="text-light">© 2020 Copyright:
    <strong>shaleen.201095@gmail.com</strong></p>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


</body>
</html>