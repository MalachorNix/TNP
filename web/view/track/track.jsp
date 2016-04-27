<%@ page import="model.TrackItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.*" %>
<%@ page import="model.ArtistItem" %>
<%@ page import="model.GenreItem" %>
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
    <script src="../js/common.js"></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<table align="center" border="0" bgcolor="white" width="100%" style="opacity:0.6">
    <tr>
        <td colspan="2"><h1>Приветствуем Вас<br>на музыкальном портале №1</h1></td>
    </tr>
    <tr>
        <td class="cl1"></td>
        <td colspan="2"><h2>Библиотека треков</h2></td>
    </tr>
    <tr>
        <td align="left" style="padding: 20px;">
            <a href="trackIn.jsp">Добавить новый трек</a><br><br><br>
            <a href="../index.jsp">На главную</a><br><br><br>
            <a href="../artist/artist.jsp">Показать артистов</a><br><br><br>
            <a href="../genre/genre.jsp">Показать жанры</a><br><br><br>
        <td colspan="2"><p>
            <form name="frm" method="get" action="track.jsp" style="vertical-align:top" onsubmit="return validateSearchForm()">
                <input type="text" name="name" value=""/>
                <input type="submit" value="Поиск" name="search"/>
            </form>
            <br>
            <table border="1" style="height:300px; width:800px; padding: 10px;">
                <tr>
                    <th>Название</th>
                    <th>Артист</th>
                    <th>Жанр</th>
                    <th>Опции</th>
                </tr>
                <%
                    DaoFactory daoFactory = new MySqlDaoFactory();
                    List<TrackItem> list = new ArrayList<>();
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
                    if (request.getParameter("search") == null || request.getParameter("search").trim().length() == 0) {%>
                <%
                    list = trackDao.getAll();
                    for (int i = 0; i < list.size(); i++) {
                        trackItem = list.get(i);
                %>
                <tr>
                    <td><b><%= trackItem.getName()%>
                    </b></td>
                    <%
                        artistItem = artistDao.read(trackItem.getTrack_artist());
                    %>
                    <td><b><%= artistItem.getName()%>
                    </b></td>
                    <%
                        genreItem = genreDao.read(trackItem.getTrack_genre());
                    %>
                    <td><b><%= genreItem.getName()%>
                    </b></td>
                    <td colspan="2">
                        <form>
                            <a href="trackUp.jsp?track_id=<%=trackItem.getId()%>&track_name=<%=trackItem.getName()%>&genre_id=<%= genreItem.getId()%>&genre_name=<%= genreItem.getName()%>&artist_id=<%=artistItem.getId()%>&artist_name=<%=artistItem.getName()%>">Изменить</a>
                            <a href="trackdelete.jsp?track_id=<%= trackItem.getId()%>&">Удалить</a>
                        </form>
                    </td>
                </tr>
                <% }
                }
                else {
                    String name;
                    name = request.getParameter("name");
                    list = trackDao.readByName(name);
                    if (list.size() == 0) { %>
                <script>
                    trackNotFound();
                </script>
                    <%}
                    for (int i = 0; i < list.size(); i++) {
                        trackItem = list.get(i);
                %>
                <tr>
                    <td><b><%= trackItem.getName()%>
                    </b></td>
                    <%
                        artistItem = artistDao.read(trackItem.getTrack_artist());
                    %>
                    <td><b><%= artistItem.getName()%>
                    </b></td>
                    <%
                        genreItem = genreDao.read(trackItem.getTrack_genre());
                    %>
                    <td><b><%= genreItem.getName()%>
                    </b></td>

                    <td colspan="2">
                        <form>
                            <a href="trackUp.jsp?track_id=<%=trackItem.getId()%>&track_name=<%=trackItem.getName()%>&genre_id=<%= genreItem.getId()%>&genre_name=<%= genreItem.getName()%>&artist_id=<%=artistItem.getId()%>&artist_name=<%=artistItem.getName()%>">Изменить</a>
                            <a href="trackdelete.jsp?track_id=<%= trackItem.getId()%>&">Удалить</a>
                        </form>
                    </td>
                </tr>
                <% }

                }
                    daoFactory.closeConnection();
                %>

            </table>
        </td>
    </tr>
</table>
</body>
</html>
