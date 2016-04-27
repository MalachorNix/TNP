<%@ page import="controller.*" %>
<%@ page import="model.ArtistItem" %>
<%@ page import="model.TrackItem" %>
<%@ page import="model.GenreItem" %>
<%@ page import="java.sql.Connection" %>
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
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<form name="inputForm" action="trackUp.jsp">
    <table align="center" border="0" bgcolor="white" style="opacity:0.6">
        <tr>
            <td colspan="2">
                <table class="cl2" border="1">
                    <%
                        if (request.getParameter("name") == null && request.getParameter("track_id_form") == null
                                && request.getParameter("genre_name_form") == null && request.getParameter("artist_name_form") == null) {%>
                    <h1>Форма редактирования трека</h1>

                    <tr>
                        <td>Введите другой id:</td>
                        <td><input type="text"  name="track_id_form" value="<%=request.getParameter("track_id")%>"/></td>
                    </tr>

                    <tr>
                        <td>Введите другое название:</td>
                        <td><input type="text" name="name" value="<%=request.getParameter("track_name")%>"/></td>
                    </tr>

                    <tr>
                        <td>Введите другой жанр:</td>
                        <td><input type="text" name="genre_name_form" value="<%= request.getParameter("genre_name")%>"/></td>
                    </tr>

                    <tr>
                        <td>Введите другого артиста:</td>
                        <td><input type="text" name="artist_name_form" value="<%= request.getParameter("artist_name")%>"/></td>
                    </tr>
                    <td><input type="submit" value="Ok" name="ok"/></td>
                </table>
        </tr>
    </table>
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
        Connection con = daoFactory.getConnection();

        trackDao = daoFactory.getTrackDao(con);
        genreDao = daoFactory.getGenreDao(con);
        artistDao = daoFactory.getArtistDao(con);

        name = request.getParameter("name");
        id = new Integer(request.getParameter("track_id_form"));
        genre_id = genreDao.readByName(request.getParameter("genre_name_form")).getId();
        artist_id = artistDao.readByName(request.getParameter("artist_name_form")).getId();



        trackItem = new TrackItem(id, name, genre_id, artist_id);

        trackDao = daoFactory.getTrackDao(con);
        trackDao.update(trackItem);
        daoFactory.closeConnection();
    %>
    <jsp:forward page="track.jsp"></jsp:forward>
</form>
<%
    }

%>
</body>
</html>
