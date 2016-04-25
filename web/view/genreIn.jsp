<%@ page import="model.GenreItem" %>
<%@ page import="controller.DaoFactory" %>
<%@ page import="controller.MySqlDaoFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.GenreDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
</head>
<body>
<form name="inputForm" action="genreIn.jsp">
    <table class="cl2" align="center" border="1" bgcolor="white">

        <% if (request.getParameter("genre_name")
                == null && request.getParameter("genre_id")
                == null) {%>
        <h1 align="center">Форма добавления нового жанра</h1>

        <tr>
            <td>Введите id:</td>
            <td><input type="text" name="genre_id" value=""/></td>
        </tr>
        <tr>
            <td>Введите название:
            </td>
            <td><input type="text" name="genre_name" value=""/>
            </td>
        </tr>
        <td>
            <input type="submit" value="ok" name="ok"/>
        </td>
    </table>
</form>
<% } else { %>
<%! String name;
    int id;%>
<%
    name = request.getParameter("genre_name");
    id = new Integer(request.getParameter("genre_id"));
    GenreItem genre = new GenreItem(id, name);
    DaoFactory daoFactory = new MySqlDaoFactory();
    Connection con = daoFactory.getConnection();

    GenreDao dao = daoFactory.getGenreDao(con);
    dao.create(request.getParameter("genre_name"));
    if (true) {
%>
<jsp:forward page="genre.jsp"></jsp:forward>
<%
        }
    }
%>
</body>
</html>
