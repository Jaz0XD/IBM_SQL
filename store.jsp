<%@ page import="java.sql.*"%>

<%

String name = request.getParameter("name");
String location = request.getParameter("location");
String slots = request.getParameter("slots");
Boolean status = request.getParameter("status");


try {
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "username", "password");
    PreparedStatement ps = conn.prepareStatement("insert into users(name, location, slots, status) values(?,?,?,?)");
    ps.setString(1, name);
    ps.setString(2, location);
    ps.setString(3, slots);
    ps.setBoolean(4, status);

    int x=ps.executeUpdate();
    if(x!=0) {
        out.print("User registered successfully");
    } else {
        out.print("Something went wrong...");
    }

} catch (Exception e) {
    out.print(e);
}
%>
