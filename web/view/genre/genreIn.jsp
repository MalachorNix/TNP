<%@ page import="model.GenreItem" %>
<%@ page import="controller.interfaceDaoFactory.DaoFactory" %>
<%@ page import="controller.impelementationDaoFactory.MySqlDaoFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.interfaceDaoItem.GenreDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
    <link href="../../css/css.css" rel="stylesheet">
    <script src="../js/common.js" defer></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<form id="form" name="inputForm" action="genreIn.jsp" onsubmit="validateEmpty()">
    <table class="cl2" align="center" border="1" bgcolor="white">

        <% if (request.getParameter("genre_name") == null) {%>
        <h1 align="center">Форма добавления нового жанра</h1>
        <tr>
            <td>Введите название:
            </td>
            <td><input id="inputField" type="text" name="genre_name" value=""/>
            </td>
        </tr>
        <td>
            <input type="submit" value="ok" name="ok"/>
        </td>
    </table>
</form>
<% } else { %>
<%! String name;%>
<%
    name = request.getParameter("genre_name");
    if (name.length() != 0) {
        DaoFactory daoFactory = new MySqlDaoFactory();
        Connection con = daoFactory.getConnection();

        GenreDao dao = daoFactory.getGenreDao(con);
        try {
            dao.create(name);
            daoFactory.closeConnection();
        } catch (SQLException e) {
            %>
<script>
    alert('Данный жанр уже существует.');
</script>
<%
        }
    }
    if (true) {
%>
<jsp:forward page="genre.jsp"></jsp:forward>
<%
        }
    }
%>
</body>
</html>
