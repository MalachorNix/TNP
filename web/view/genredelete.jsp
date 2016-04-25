<%@ page import="controller.DaoFactory" %>
<%@ page import="controller.MySqlDaoFactory" %>
<%@ page import="controller.GenreDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.GenreItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
</head>
<body>
<%
    if (request.getParameter("genre_id") != null && request.getParameter("genre_name") != null) {
        int id = new Integer(request.getParameter("genre_id"));
        DaoFactory daoFactory = new MySqlDaoFactory();
        GenreDao dao = null;
        Connection con = daoFactory.getConnection();
        dao = daoFactory.getGenreDao(con);
        dao.delete(new GenreItem(id, request.getParameter("genre_name")));
    }
%>
<jsp:forward page="genre.jsp"></jsp:forward>
</body>
</html>
