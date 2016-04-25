<%@ page import="controller.*" %>
<%@ page import="model.ArtistItem" %>
<%@ page import="model.TrackItem" %>
<%@ page import="model.GenreItem" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
</head>
<body>
<form name="inputForm" action="trackUp.jsp">
    <table align="center" border="0" bgcolor="white" style="opacity:0.6">
        <tr>
            <td colspan="2">
                <table class="cl2" border="1">
                    <%
                        if (request.getParameter("name") == null) {%>
                    <h1>Форма редактирования трека</h1>

                    <tr>
                        <td><input type="text" disabled name="track_id" value="<%=request.getParameter("track_id")%>"/></td>
                    </tr>

                    <tr>
                        Введите другое название:
                        <td><input type="text" name="name" value="<%=request.getParameter("track_name")%>"/></td>
                    </tr>

                    <tr>
                        <td>Введите другой жанр:</td>
                        <td><input type="text" name="genre_name" value="<%= request.getParameter("genre_name")%>"/></td>
                    </tr>

                    <tr>
                        <td>Введите другого артиста:</td>
                        <td><input type="text" name="artist_name" value="<%= request.getParameter("artist_name")%>"/></td>
                    </tr>
                    <td><input type="submit" value="Ok" name="ok"/></td>
                </table>
        </tr>
    </table>
    <% } else { %>
    <%! String name;
        int id;
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



        id = new Integer(request.getParameter("track_id"));
        name = request.getParameter("name");
        TrackItem track = new TrackItem(id, name);

        DaoFactory daoFactory = new MySqlDaoFactory();
        Connection con = daoFactory.getConnection();

        TrackDao dao = daoFactory.getTrackDao(con);
        dao.update(track);
    %>
    <jsp:forward page="track.jsp"></jsp:forward>
</form>
<%
    }

%>
</body>
</html>
