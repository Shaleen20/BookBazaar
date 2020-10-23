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
    <title>Your Donations</title>
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
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	try
	{
		int count=0;
		Connection con=connectionprovider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select book,class from donor where email='"+email+"'");
		while(rs.next())
		{
			count=count+1;
%>
<div class="container my-4">
	<center>
	<div class="card shadow p-3 mb-5 bg-white rounded" style="width: 60rem;">
  <div class="card-body">
<p class="card-text">
<centre>
<table class="table table-borderless">
<tr class="bg-danger text-light"><td>
<h2><strong><center>BOOK BAZAAR</center></strong></h2><br>
</td></tr>
</table>
<h3 class="text-success"><strong>"CONGRATULATIONS!!!"</strong></h3><br>
<p><strong>This certificate is being awarded to <i class="text-secondary"><%= name %></i> ,having email ID <i class="text-secondary"><%=email %></i> for a nobel cause like<br> donating
books to poor,needy and financially unstable children for their well being and better future development.<br>
</strong></p>
<p><strong>Below is your donation details..</strong></p><br>
<table class="table table-borderless" border=1 width=100%>
<thead class="thead-dark">
	<tr class="table-active">
		<td><strong>Book Name</strong></td>
		<td><strong>Book Class</strong></td>
	</tr>
</thead>
<tr>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>	
</tr>

<% 
	}
		
	%>
	</table>
	<center><img src="bookbazaarlogo.png" style="width:200px;height:200px;"></center>
<% 	if(count>4)
		{ %>
			<a title="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;"><center><button type="button" class="btn btn-light">Print</button></center></a>
	<% 	}
		%>
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
