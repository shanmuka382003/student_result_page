<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<html>
<head>
    <title>User Details</title>
    <style>
        h1{
            font-family: cursive;
        }
        table, th, td {
            border: 1px solid rgb(149, 148, 148);
            border-collapse: collapse;
        }
        td,th{
            color: #006699;
            display: table-cell;
            padding: 8px;
        }
        tr:nth-of-type(odd){
            background-color:rgba(210, 209, 209, 0.231)
        }
        tr:hover{
            background-color:rgba(226, 223, 223, 0.231)
        }
        label{
            font-family:cursive;
        }
        select,input{
            padding: 4px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        select,input:hover{
            border-color: black;
        }
    </style>
</head>
<body>
    <center>
        <b><h1>Prasad V. Potluri Siddhartha Institute of Technology</h1></b>
        <br><br>
        <form method="post" action="getDetails">
            <label for="regId"><b>Enter Registered number:</b></label>
            <input type="text" name="regId" value="<%= request.getParameter("regId") %>">
            <br><br>
            <label for="semester"><b>Choose Semester:</b></label>
            <select name="semester" id="semester">
                <option value="0">--select semester--</option>
                <option value="sem1" <%= "sem1".equals(request.getParameter("semester")) ? "selected" : "" %>>SEMESTER-1</option>
                <option value="sem2" <%= "sem2".equals(request.getParameter("semester")) ? "selected" : "" %>>SEMESTER-2</option>
                <option value="sem3" <%= "sem3".equals(request.getParameter("semester")) ? "selected" : "" %>>SEMESTER-3</option>
                <option value="sem4" <%= "sem4".equals(request.getParameter("semester")) ? "selected" : "" %>>SEMESTER-4</option>
            </select>
            <br><br>
            <input type="submit" value="Get Details">
        </form>
    </center>
    <%
        String userId = request.getParameter("regId");
        String sem=request.getParameter("semester");
        if(sem.equals("0")){
            out.println("<center><h1>Please select semester</h1></center>");
        }
        else{
        out.println("<center>");
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            //Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/grades?characterEncoding=utf8","root","Shannu@2003");
            PreparedStatement st = connection.prepareStatement("select * from student_details where roll_number = ?");
            st.setString(1,userId);
            ResultSet rs1=st.executeQuery();
            out.println("<br><center><table border=0 ><tr style=text-align:left><th colspan=3 style=color:#999999>Student Details</th></tr><tr><b><th>Registered Number</th><th>Student Name</th><th>Proctor Name</th></b></tr>");
            while(rs1.next()){
                out.println("<tr><td>"+rs1.getString("roll_number")+"</td><td>"+rs1.getString("name")+"</td><td>"+rs1.getString("proctor")+"</td></tr>");
            }
            out.println("</table></center>");
            PreparedStatement preparedStatement = connection.prepareStatement("select * from "+sem+" where roll_number = ?");
            preparedStatement.setString(1,userId);
            ResultSet rs = preparedStatement.executeQuery();
            out.println("<br><br><table border=0 ><tr><th align=center>S. No</th><th>Course Code</th><th>Course Name</th><th>Internal</th><th>External</th><th>Total</th><th>Status</th><th>Credits</th><th>Grade</th></tr>");
            while (rs.next()) {
                out.println("<tr><td align=center>"+rs.getString("s_no")+"</td><td align=center>"+rs.getString("course_code")+"</td><td align=center>"+rs.getString("course_name")+"</td><td align=center>"+rs.getString("internal")+"</td><td align=center>"+rs.getString("external")+"</td><td align=center>"+rs.getString("total")+"</td><td align=center>"+rs.getString("status")+"</td><td align=center>"+rs.getString("credits")+"</td><td align=center>"+rs.getString("grade")+"</td></tr>");
            }
            out.println("</table></center>");
            rs.close();
            preparedStatement.close();
            connection.close();
        }
        catch (Exception e) {
            out.println(e);
        }
    }
    %>
</body>
</html>