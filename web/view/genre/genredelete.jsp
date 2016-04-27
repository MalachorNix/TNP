<%@ page import="controller.interfaceDaoFactory.DaoFactory" %>
<%@ page import="controller.impelementationDaoFactory.MySqlDaoFactory" %>
<%@ page import="controller.interfaceDaoItem.GenreDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.GenreItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
    <link href="../../css/css.css" rel="stylesheet">
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%
    if (request.getParameter("genre_id") != null && request.getParameter("genre_name") != null) {
        int id = new Integer(request.getParameter("genre_id"));
        DaoFactory daoFactory = new MySqlDaoFactory();
        GenreDao dao = null;
        Connection con = daoFactory.getConnection();
        dao = daoFactory.getGenreDao(con);
        dao.delete(new GenreItem(id, request.getParameter("genre_name")));
        daoFactory.closeConnection();
    }
%>
<jsp:forward page="genre.jsp"></jsp:forward>
</body>
</html>
