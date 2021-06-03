

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--IMPORT TAGS-->
<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenttable?useTimezone=true&serverTimezone=UTC", "root", "****");
        pst = conn.prepareStatement("insert into records(stname,course,fee)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();

%>
<script>
    alert("record added");
</script>
<%            }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            #tbl-student{
                color: white;
            }
            #underline{
                border-bottom: 2px solid black;
            }
        </style>
    </head>
    <body id="background-pic">
        <div id="underline">
            <h1>Registration Form</h1>
        </div><br>
        <div class="row">
            <!--FORM-->
            <div class="col-md-12">
                <form method="POST" action="#">

                    <div>
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student name" name="sname" id="sname" pattern="[a-zA-Z]+" 
                               title="Invalid input. Use only characters (a-zA-Z)" required>                         
                    </div>
                    <div>
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" pattern="[a-zA-Z]+" 
                               title="Invalid input. Use only characters (a-zA-Z)"  id="course" required>                         
                    </div>

                    <div>
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" min="0" max="100"pattern="[0-9]+" 
                               title="Invalid input. Use only numbers (0-9)" required>                         
                    </div><br>

                    <div alight="right">
                        <input type="submit" class="btn btn-success" id="submit" value="submit" name="submit"> 
                        <input type="reset" class="btn btn-warning" id="reset" value="reset" name="reset">
                    </div><br><br>

                </form>
            </div>
        </div>
        <div id="underline">
            <h1>Schools Database</h1>
        </div><br>
        <div class="row">
            <!--TABLE-->
            <div class="col-md-12">

                <div class="panel-body">
                    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thred>
                            <tr>
                                <th>Students Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            <!--HERE WE DISPLAY THE RECORDS FROM DB-->
                            <%                                Connection conn;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenttable?useTimezone=true&serverTimezone=UTC", "root", "!d1m1994ts1k0s");

                                String selectQuery = "select * from records";
                                Statement st = conn.createStatement();
                                rs = st.executeQuery(selectQuery);

                                while (rs.next()) {
                                    String id = rs.getString("id");
                            %>
                            <tr>
                                <td><%=rs.getString("stname")%></td>
                                <td><%=rs.getString("course")%></td>
                                <td><%=rs.getString("fee")%></td>
                                <td><a href="update.jsp?id=<%=id%>">Edit</a></td><!--<?ID> TO PASS THE ID TO THE OTHER PAGE (IS LIKE SESSION BUT REWRITED VIA URL-->
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                            </tr>
                            <%
                                }
                            %>
                        </thred>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
