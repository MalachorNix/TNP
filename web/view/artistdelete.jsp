<%@ page import="model.ArtistItem" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.ArtistDao" %>
<%@ page import="controller.MySqlDaoFactory" %>
<%@ page import="controller.DaoFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
    <link href="../css/css.css" rel="stylesheet">
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%
    if (request.getParameter("artist_id") != null && request.getParameter("artist_name") != null) {
        int id = new Integer(request.getParameter("artist_id"));
        DaoFactory daoFactory = new MySqlDaoFactory();
        ArtistDao dao = null;
        Connection con = daoFactory.getConnection();
        dao = daoFactory.getArtistDao(con);
        dao.delete(new ArtistItem(id, request.getParameter("artist_name")));
    }
%>
<jsp:forward page="artist.jsp"></jsp:forward>
</body>
</html>
