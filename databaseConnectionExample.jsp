<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDCB Connection example</title>
</head>
<body>
<h1>JDCB Connection example</h1>
<%
	String db = request.getParameter("cs157a");
	String[] employees = new String[3];
	try{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a","root","testPassword");
		out.println(db + "database successfully opened.");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from emp");
		int i = 0;
		while(rs.next())
		{
			employees[i] = rs.getInt(1)+" "+rs.getString(2)+" "+rs.getInt(3);
			i++;
		}
	}
	catch(SQLException e){
		out.println("SQLException caught: " +e.getMessage());
	}
%>
<p><%out.println(employees[0]);%> </p>
<p><%out.println(employees[1]);%> </p>
<p><%out.println(employees[2]);%> </p>
</body>
</html>