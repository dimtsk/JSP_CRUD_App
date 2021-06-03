
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit") != null) {
        String id=request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenttable?useTimezone=true&serverTimezone=UTC", "root", "!d1m1994ts1k0s");
        pst = conn.prepareStatement("update records set stname=?, course=?, fee=? where id=?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();

%>
<script>
    alert("record updated");
</script>
<%            }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update pg</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body{                   
                width: 50%;
                margin-left : 25%    
            }
            #background-pic {   
                background-image: url('https://www.kcl.ac.uk/newimages/sspp/policy-institute/news/student-freedom-of-expression.xe305a51e.png'); 
                height: 100%;    
                background-position: center;    
                background-repeat: no-repeat;   
                background-size: cover;         
            }
            #underline{
                border-bottom: 2px solid black;
            }
        </style>
    </head>
    <body id="background-pic">
        <div id="underline">
            <h1>Student update</h1>           
        </div>
        <div class="row">
            <!--FORM-->
            <div class="col-md-12">
                <form method="POST" action="#">

                    <% 
                        Connection conn;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenttable?useTimezone=true&serverTimezone=UTC", "root", "!d1m1994ts1k0s");
                        String id= request.getParameter("id");
                        pst = conn.prepareStatement("select * from records where id=?");
                        pst.setString(1, id);
                        rs=pst.executeQuery();
                        
                        while(rs.next()){
                            
                        
                    %>
                    
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student name" value="<%=rs.getString("stname") %>" name="sname" id="sname" required>                         
                    </div>
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" value="<%=rs.getString("course") %>" name="course" id="course" required>                         
                    </div>

                    <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%=rs.getString("fee") %>" name="fee" id="fee" required>                         
                    </div><br>
                    <% 
                    }
                    %>
                   
                    <div alight="right">
                        <input type="submit" class="btn btn-info" id="submit" value="submit" name="submit"> 
                        <input type="reset" class="btn btn-warning" id="reset" value="reset" name="reset">
                    </div>
                    
                    <div align="right">
                        <p><a href="index.jsp">Click Back</a></p>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
