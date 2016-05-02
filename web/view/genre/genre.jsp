<%@ page import="controller.interfaceDaoFactory.DaoFactory" %>
<%@ page import="controller.impelementationDaoFactory.MySqlDaoFactory" %>
<%@ page import="model.GenreItem" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.interfaceDaoItem.GenreDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../../css/css.css" rel="stylesheet">
    <script src="../js/common.js"></script>
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
            <a href="genreIn.jsp">Добавить новый жанр</a><br><br><br>
            <a href="../index.jsp">На главную</a><br><br><br>
            <a href="../artist/artist.jsp">Показать артистов</a><br><br><br>
            <a href="../track/track.jsp">Показать треки</a><br><br><br>
        <td colspan="2"><p>
            <form name="frm" method="get" action="genre.jsp" style="vertical-align:top" onsubmit="validateSearchForm()">
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
                    List<GenreItem> list = new ArrayList<>();
                    GenreDao dao = null;
                    GenreItem genreItem = null;
                    try (Connection con = daoFactory.getConnection()) {
                        dao = daoFactory.getGenreDao(con);
                        if (request.getParameter("search") == null || request.getParameter("search").trim().length() == 0) {%>

                <%
                    list = dao.getAll();
                %>

                <%
                } else {
                    String genre_name;
                    genre_name = request.getParameter("name");
                    genre_name.trim();
                    GenreItem genre = dao.readByName(genre_name);
                    if (genre == null) { %>
                <script>
                    genreNotFound();
                </script>
                <%
                        } else {
                            list.add(genre);
                        }
                    }
                %>

                <%
                    try {
                        for (int i = 0; i < list.size(); i++) {
                            genreItem = list.get(i);

                %>
                <tr>
                    <td><b><%= genreItem.getName()%>
                    </b></td>

                    <td colspan="2">
                        <form>
                            <a href="genreUp.jsp?genre_id=<%= genreItem.getId()%>&genre_name=<%= genreItem.getName()%>">Изменить</a>
                            <a href="genredelete.jsp?genre_id=<%= genreItem.getId()%>&genre_name=<%= genreItem.getName() %>">Удалить</a>
                        </form>
                    </td>
                </tr>
                <% }
                    daoFactory.closeConnection();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                }
                %>

            </table>
        </td>
    </tr>

</table>
</body>
</html>
