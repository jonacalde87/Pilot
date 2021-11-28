

<!DOCTYPE HTML>
<%@page language="java" import="java.io.*"
    import="java.net.URL" import="java.sql.*" import="oracle.jdbc.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
	<link rel="stylesheet" href="bootstrap.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">
			<img src="images/Logo.jpeg" width="150" height="100" alt="">
		  </a>
  
		  <a class="navbar-brand" href="index.html">Home</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		  <span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
		  <ul class="navbar-nav">
			<li class="nav-item ">
  
			  <a class="nav-link" href="login.html">Sign-In<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
			  <a class="nav-link " href="cart.html">Cart</a>
			</li>            
			<li class="nav-item">
			  <a class="nav-link" href="register.jsp">Register</a>
			</li>
            <li>
                <a class="nav-link active" href="admin.jsp">Admin</a>
            </li>
		  </ul>
		</div>
	  </nav>
<%
if(request.getMethod().equals("GET")){
%>
<h2>Admin</h2>
<form method='post' action='http://localhost:7070/Pilot/admin.jsp'>
            <button type='submit'>Retrieve user database</button>
</form>
<%
}
if(request.getMethod().equals("POST")){        
        Class.forName("oracle.jdbc.driver.OracleDriver");
  
        //Connect to the URL
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521", "java","java");		
		
		Statement stmtSelect = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                      ResultSet.CONCUR_UPDATABLE);
        ResultSet cust = stmtSelect.executeQuery("SELECT * FROM TRAIN_CUSTOMER");
		
		%>
			<table class="table">
			
			<thead>
				<tr>
					<th>Last Name</th>
					<th>First Name</th>
					<th>Email</th>
					<th>Username</th>
					<th>Password</th>
					<th>Card Number</th>
				</tr>
			</thead>
		<%
		while(cust.next())
		{
			
		
			out.println("<tr>");
				out.println("<td>" + cust.getString(1) + "</td>");
				out.println("<td>" + cust.getString(2) + "</td>");
				out.println("<td>" + cust.getString(3)+ "</td>");
				out.println("<td>" + cust.getString(4)+ "</td>");
				out.println("<td>" + cust.getString(5)+ "</td>");
				out.println("<td>" + cust.getString(6)+ "</td>");
			out.println("</tr>");
			
		}
		
		out.println("</table>");
		
		
}
%>
<footer id="footer" class="text-success text-center">Created by Jonathan Calderon, Thane Cutler & ShiQuise Moore</footer>

<script src="bootstrap.js"></script>
</body>
<html>