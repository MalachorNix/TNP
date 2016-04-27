<%@ page import="model.GenreItem" %>
<%@ page import="controller.interfaceDaoFactory.DaoFactory" %>
<%@ page import="controller.impelementationDaoFactory.MySqlDaoFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.interfaceDaoItem.GenreDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
    <link href="../../css/css.css" rel="stylesheet">
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<form name="inputForm" action="genreUp.jsp">
    <table align="center" border="0" bgcolor="white" style="opacity:0.6">
        <tr>
            <td colspan="2">
                <table class="cl2" border="1">
                    <%
                        if (request.getParameter("name") == null) {%>
                    <h1>Форма редактирования жанра</h1>

                    <tr>
                        <td>
                            <input type="text"  name="genre_id" value="<%=request.getParameter("genre_id")%>"/>
                        </td>
                    </tr>

                    <tr>
                        Введите другое название:
                        <td>
                            <input type="text" name="name" value="<%=request.getParameter("genre_name")%>"/>
                        </td>
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
        id = new Integer(request.getParameter("genre_id"));
        name = request.getParameter("name");
        GenreItem genre = new GenreItem(id, name);

        DaoFactory daoFactory = new MySqlDaoFactory();
        Connection con = daoFactory.getConnection();

        GenreDao dao = daoFactory.getGenreDao(con);
        dao.update(genre);
        daoFactory.closeConnection();
    %>
    <jsp:forward page="genre.jsp"></jsp:forward>
</form>
<%
    }

%>

</body>
</html>
