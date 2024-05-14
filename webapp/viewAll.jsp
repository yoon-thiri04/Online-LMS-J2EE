<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Show</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM lectures";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int lectureId = rs.getInt("lectureId");
                    String name = rs.getString("name");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String qualification = rs.getString("qualification");
                    String filename = rs.getString("filename");
                    String path = rs.getString("path");
        %>

        <table style="width:100%" border="2">
            <tr>
              	<th>Id</th>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Qualification</th>
                <th>Image</th>
            </tr>
            
            <tr>
                <td><%=lectureId %>
                <td><%=name%></td>
                <td><%=password%></td>
                <td><%=email%></td>
                <td><%=qualification%></td>
                <td><image src="<%=filename%>" width="150" height="200"/></td>
              
            </tr>
        </table>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>