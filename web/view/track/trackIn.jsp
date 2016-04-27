<%@ page import="model.TrackItem" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.*" %>
<%@ page import="model.ArtistItem" %>
<%@ page import="model.GenreItem" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="controller.interfaceDaoItem.ArtistDao" %>
<%@ page import="controller.interfaceDaoFactory.DaoFactory" %>
<%@ page import="controller.interfaceDaoItem.GenreDao" %>
<%@ page import="controller.interfaceDaoItem.TrackDao" %>
<%@ page import="controller.impelementationDaoFactory.MySqlDaoFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
    <link href="../../css/css.css" rel="stylesheet">
    <script src="../js/common.js" defer></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<form id="form" name="inputForm" action="trackIn.jsp" onsubmit="validateTrackInForm()">
    <table class="cl2" align="center" border="1" bgcolor="white">

        <% if (request.getParameter("track_name") == null
                && request.getParameter("genre_id") == null
                && request.getParameter("artist_id") == null) {%>
        <h1 align="center">Форма добавления нового трека</h1>
        <tr>
            <td>Введите название:</td>
            <td><input id="track_name" type="text" name="track_name" value=""/></td>
        </tr>
        <tr>
            <td>Введите жанр:</td>
            <td><input id="track_genre" type="text" name="genre_name" value=""/></td>
        </tr>
        <tr>
            <td>Введите артиста:</td>
            <td><input id="track_artist" type="text" name="artist_name" value=""/></td>
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
    String genre_name;
    String artist_name;
%>
<%


    DaoFactory daoFactory = new MySqlDaoFactory();
    TrackDao trackDao = null;
    GenreDao genreDao = null;
    ArtistDao artistDao = null;
    Connection con = daoFactory.getConnection();

    trackDao = daoFactory.getTrackDao(con);
    genreDao = daoFactory.getGenreDao(con);
    artistDao = daoFactory.getArtistDao(con);


    name = request.getParameter("track_name");
    genre_name = request.getParameter("genre_name");
    artist_name = request.getParameter("artist_name");

    if (name.length() != 0 && genre_name.length() != 0 && artist_name.length() != 0) {
        genre_id = genreDao.readByName(genre_name).getId();
        artist_id = artistDao.readByName(artist_name).getId();
        try {
            trackDao.create(name, genre_id, artist_id);
            daoFactory.closeConnection();
        } catch (SQLException e) {
            %>
<script>
    alert('Нет такого жанра или исполнителя');
</script>
<%
        }

    }
    if (true) {
%>
<jsp:forward page="track.jsp"></jsp:forward>
<%
        }
    }
%>
</body>
</html>
