<%@ page import="model.TrackItem" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.*" %>
<%@ page import="model.ArtistItem" %>
<%@ page import="model.GenreItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<form name="inputForm" action="trackIn.jsp">
    <table class="cl2" align="center" border="1" bgcolor="white">

        <% if (request.getParameter("track_name")
                == null && request.getParameter("track_id")
                == null && request.getParameter("genre_id") == null && request.getParameter("artist_id") == null) {%>
        <h1 align="center">Форма добавления нового трека</h1>

        <tr>
            <td>Введите id:</td>
            <td><input type="text" name="track_id" value=""/></td>
        </tr>
        <tr>
            <td>Введите название:</td>
            <td><input type="text" name="track_name" value=""/></td>
        </tr>
        <tr>
            <td>Введите жанр:</td>
            <td><input type="text" name="genre_name" value=""/></td>
        </tr>
        <tr>
            <td>Введите артиста:</td>
            <td><input type="text" name="artist_name" value=""/></td>
        </tr>
        <td>
            <input type="submit" value="ok" name="ok"/>
        </td>
    </table>
</form>
<% } else { %>
<%! String name;
    int id;
    int genre_id;
    int artist_id;
%>
<%


    DaoFactory daoFactory = new MySqlDaoFactory();
    TrackDao trackDao = null;
    GenreDao genreDao = null;
    ArtistDao artistDao = null;
    TrackItem trackItem = null;
    ArtistItem artistItem = null;
    GenreItem genreItem = null;
    Connection con = daoFactory.getConnection();

    trackDao = daoFactory.getTrackDao(con);
    genreDao = daoFactory.getGenreDao(con);
    artistDao = daoFactory.getArtistDao(con);

    name = request.getParameter("track_name");
    id = new Integer(request.getParameter("track_id"));
    genre_id = genreDao.readByName(request.getParameter("genre_name")).getId();
    artist_id = artistDao.readByName(request.getParameter("artist_name")).getId();


    trackDao.create(name, genre_id, artist_id);
    if (true) {
%>
<jsp:forward page="track.jsp"></jsp:forward>
<%
        }
    }
%>
</body>
</html>
