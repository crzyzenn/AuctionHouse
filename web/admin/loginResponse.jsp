<%@page import="sun.invoke.empty.Empty"%>
<%@ page import = "java.sql.*,Help.Connect" %>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");	

	Connect con = new Connect();
	Statement stm = con.getStatement();
	
	
	
	try{
		ResultSet rs = stm.executeQuery("SELECT * FROM admin WHERE username = '" + username + "' AND password = '" + password + "'");
		
		// If no user is found
		if(rs.next()){
	out.println("Username = " + rs.getString(2) + ", Password = " + rs.getString(3));	
	
	// Set session for the admin
	session.setAttribute("user", username); 
		}
		else{
	out.print("No"); 
		}
		con.closeConnection(); 
	}
	catch(Exception e){
		System.out.println(e.getMessage()); 
		con.closeConnection(); 
	}
%>

