<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
       
        String id=request.getParameter("id");
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenttable?useTimezone=true&serverTimezone=UTC", "root", "!d1m1994ts1k0s");
        pst = conn.prepareStatement("delete from records where id=?");
        pst.setString(1, id);

        pst.executeUpdate();

%>
<script>
    alert("record deleted");
</script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete pg</title>
        <style>
            #background-pic {   
                background-image: url('https://www.kcl.ac.uk/newimages/sspp/policy-institute/news/student-freedom-of-expression.xe305a51e.png'); 
                height: 100%;    
                background-position: center;    
                background-repeat: no-repeat;   
                background-size: cover;         
            }
        </style>
    </head>
    <body id="background-pic">
    <center>
        <h1><a href="index.jsp">Back to main page</a></h1>
    </center>
    </body>
</html>
