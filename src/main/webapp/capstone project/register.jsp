

<!DOCTYPE HTML>
<%@page language="java" import="java.io.*"
    import="java.net.URL" import="java.sql.*" import="oracle.jdbc.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "bostonBakedBeans.UserList"%>
<html>
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
			  <a class="nav-link active" href="register.jsp">Register</a>
			</li>
			<li>
                <a class="nav-link" href="admin.jsp">Admin</a>
            </li>
		  </ul>
		</div>
	  </nav>
<%
if(request.getMethod().equals("GET")){
%>
<h2>Registration</h2>
<h4>Please enter your information:</h4>
<form method='post' action='http://localhost:7070/Pilot/register.jsp'>

            <label for="lname">Last Name: &nbsp;</label>
			<input type="text" name="lname" id="lname"><br/>
            <label for="fname">First Name: &nbsp;</label>
			<input type = "text" name="fname" id="fname"><br/>
            <label for="email">Email: &nbsp;</label>
			<input type = "email" name="email" id="email"><br/>
            <label for="username">Username: &nbsp;</label>
			<input type = "text" name="user" id="username"><br/>
			<label for="password">Password: &nbsp;</label>
			<input type = "password" name="pass" id="password"><br/>
			<label for="credit_card">Credit Card: (if desired) &nbsp;</label>
			<input type = "text" name="card" id="credit_card"><br/>
            <input type='submit' value='Submit'>
</form>
<%
}
if(request.getMethod().equals("POST")){
	out.println("Thank you for registering!");
	out.println("Last Name: " + request.getParameter("lname"));
	out.println("First Name: " + request.getParameter("fname"));
	out.println("Email: " + request.getParameter("email"));
	out.println("Username: " + request.getParameter("user"));
	out.println("Credit Card: " + request.getParameter("card"));
        DriverManager.registerDriver (new oracle.jdbc.OracleDriver());
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
  
        //Connect to the URL
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521", "QUISE1994","Ri45oY422");
		%>
		<jsp:useBean id='eng' class='bostonBakedBeans.UserList' />
		<%
		
        PreparedStatement tc = con.prepareStatement("INSERT INTO TRAIN_CUSTOMER VALUES(?,?,?,?,?,?)");
		eng.setLastName(request.getParameter("lname"));
		eng.setFirstName(request.getParameter("fname"));
		eng.setEmail(request.getParameter("email"));
		eng.setUser(request.getParameter("user"));
		eng.setPass(request.getParameter("pass"));
		eng.setCard(request.getParameter("card"));
		UserList.update(eng, con);	
}
%>
<footer id="footer" class="text-success text-center">Created by Jonathan Calderon, Thane Cutler & ShiQuise Moore</footer>

<script src="bootstrap.js"></script>
</body>
<html>