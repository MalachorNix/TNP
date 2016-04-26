<%@ page import="controller.DaoFactory" %>
<%@ page import="controller.MySqlDaoFactory" %>
<%@ page import="controller.TrackDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.TrackItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%
    if (request.getParameter("track_id") != null) {
        int id = new Integer(request.getParameter("track_id"));
        DaoFactory daoFactory = new MySqlDaoFactory();
        TrackDao dao = null;
        Connection con = daoFactory.getConnection();
        dao = daoFactory.getTrackDao(con);
        dao.delete(dao.read(id));
    }
%>
<jsp:forward page="track.jsp"></jsp:forward>
</body>
</html>
