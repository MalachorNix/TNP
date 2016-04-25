<%@ page import="controller.ArtistDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.MySqlDaoFactory" %>
<%@ page import="controller.DaoFactory" %>
<%@ page import="model.ArtistItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
</head>
<body>
<form name="inputForm" action="artistIn.jsp">
    <table class="cl2" align="center" border="1" bgcolor="white">

        <% if (request.getParameter("artist_name")
                == null && request.getParameter("artist_id")
                == null) {%>
        <h1 align="center">Форма добавления нового артиста</h1>

        <tr>
            <td>Введите id:</td>
            <td><input type="text" name="artist_id" value=""/></td>
        </tr>
        <tr>
            <td>Введите имя:
            </td>
            <td><input type="text" name="artist_name" value=""/>
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
    name = request.getParameter("artist_name");
    id = new Integer(request.getParameter("artist_id"));
    ArtistItem artist = new ArtistItem(id, name);
    DaoFactory daoFactory = new MySqlDaoFactory();
    Connection con = daoFactory.getConnection();

    ArtistDao dao = daoFactory.getArtistDao(con);
    dao.create(request.getParameter("artist_name"));
    if (true) {
%>
<jsp:forward page="artist.jsp"></jsp:forward>
<%
        }
    }
%>
</body>
</html>
