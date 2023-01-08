<%@ page import="java.sql.*" %>
<%! Connection con;
public void jspInit()
{
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","Deepak@2003");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
public void jspDestroy()
{
	try
	{
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%>
<%
String roll=request.getParameter("roll");

String page1=(String)session.getAttribute("page");
try
{
	PreparedStatement st=con.prepareStatement("select * from student where roll=?");
	st.setString(1,roll);
	ResultSet rs=st.executeQuery();
	if(!rs.next())
	{
		out.println("Invalid Registration Number");
	}
	else
	{
		
		%>
		<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #D6EEEE;
}
</style>
</head>
<center>
<body>
<h1>STUDENT DETAILS</h1><br><br>

<table>
  <tr>
   <th>Name</th>
  <td><%=rs.getString("name") %></td>
  </tr>
  <tr>
  <th>Registration Number</th>
  <td><%=rs.getString("roll")%></td>
  </tr>
  <tr>
  <th>Department</th>
  <td><%=rs.getString("dept") %></td>
  </tr>
  <tr>
  <th>Year of Study</th>
  <td><%=rs.getString("year") %></td>
  </tr>
  <tr>
  <th>Contact No.</th>
  <td><%=rs.getString("cno") %></td>
  </tr>
  <tr>
  <th>Gender</th>
  <td><%=rs.getString("gender") %></td>
  </tr>
  <tr>
  <th>Type of Admission</th>
  <td><%=rs.getString("seat") %></td>
  </tr>
  <tr>
  <th>Residence</th>
  <td><%=rs.getString("type") %></td>
  </tr>
</table><br><br><br>

</body>
</html>

<%if(page1.equals("admin"))
{%>
<a href="AdminPage.html">Click here for Home page</a></center> 
	<%}
if(page1.equals("faculty"))
{%>
<a href="Facultypage.html">Click here for Home page</a></center> 
	<%}
	}
}

	catch(Exception e)
	{
	out.println(e);
	}
	%>