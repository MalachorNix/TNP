<%@ page import="controller.DaoFactory" %>
<%@ page import="controller.MySqlDaoFactory" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.ArtistItem" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.ArtistDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<table align="center" border="0" bgcolor="white" width="100%" style="opacity:0.6">
    <tr>
        <td align="center" colspan="2"><h1>Приветствуем Вас<br>на музыкальной библиотеке!</h1></td>
    </tr>
    <tr>
        <td align="center" colspan="2"><h2>Все жанры</h2></td>
    </tr>

    <tr>
        <td align="left" style="padding: 20px;">
            <a href="artistIn.jsp">Добавить нового артиста</a><br><br><br>
            <a href="index.jsp">На главную</a><br><br><br>
            <a href="genre.jsp">Показать жанры</a><br><br><br>
            <a href="track.jsp">Показать треки</a><br><br><br>
        <td colspan="2"><p>
            <form method="get" action="artist.jsp" style="vertical-align:top">
                <input type="text" name="name" value=""/>
                <input type="submit" value="Поиск" name="search"/>
            </form>
            <br>
            <table border="1" style="height:300px; width:800px; padding: 10px;">
                <tr>
                    <th>Название</th>
                    <th>Опции</th>
                </tr>
                <%
                    DaoFactory daoFactory = new MySqlDaoFactory();
                    List<ArtistItem> list = new ArrayList<>();
                    ArtistDao dao = null;
                    ArtistItem artistItem = null;
                    Connection con = daoFactory.getConnection();

                    dao = daoFactory.getArtistDao(con);
                    if (request.getParameter("search") == null || request.getParameter("search").trim().length() == 0) {%>

                <%
                    list = dao.getAll();
                %>

                <%
                    } else {
                        String artist_name;
                        artist_name = request.getParameter("name");
                        artist_name.trim();
                        list.add(dao.readByName(artist_name));
                    }
                %>

                <%
                    try {
                        for (int i = 0; i < list.size(); i++) {
                            artistItem = list.get(i);

                %>
                <tr>
                    <td><b><%= artistItem.getName()%>
                    </b></td>

                    <td colspan="2">
                        <form>
                            <a href="artistUp.jsp?artist_id=<%= artistItem.getId()%>&artist_name=<%= artistItem.getName()%>">Изменить</a>
                            <a href="artistdelete.jsp?artist_id=<%= artistItem.getId()%>&artist_name=<%= artistItem.getName() %>">Удалить</a>
                        </form>
                    </td>
                </tr>
                <% }
                } catch (Exception e) {
                    e.printStackTrace();

                }
                %>

            </table>
        </td>
    </tr>

</table>
</body>
</html>
