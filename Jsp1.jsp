<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("eid"));
String name=request.getParameter("name");
double salary=Double.parseDouble(request.getParameter("sal"));
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdht","root", "Abhiram@17?45");
	String s="insert into emp values(?,?,?)";
	PreparedStatement ps=con.prepareStatement(s);
	ps.setInt(1,id);
	ps.setString(2,name);
	ps.setDouble(3,salary);
	ps.executeUpdate();
	out.println("row sucessfully inserted <br>");
	
	out.println("Click next for next or for going to back clicK back");
	
}
catch(Exception e) {
	e.printStackTrace();
}
%>
<form action="Servjsp" method="post">
Enter the table name:<input type="text" name="name"><br></br>
<input type="submit" value="submit">
</form>
</body>
</html>