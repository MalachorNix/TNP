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
<form name="inputForm" action="artistUp.jsp">
    <table align="center" border="0" bgcolor="white" style="opacity:0.6">
        <tr>
            <td colspan="2">
                <table class="cl2" border="1">
                    <%
                        if (request.getParameter("name") == null) {%>
                    <h1>Форма редактирования жанра</h1>

                    <tr>
                        <td>
                            <input type="text" name="artist_id" value="<%=request.getParameter("artist_id")%>"/>
                        </td>
                    </tr>

                    <tr>
                        Введите другое название:
                        <td>
                            <input type="text" name="name" value="<%=request.getParameter("artist_name")%>"/>
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
        id = new Integer(request.getParameter("artist_id"));
        name = request.getParameter("name");
        ArtistItem artist = new ArtistItem(id, name);

        DaoFactory daoFactory = new MySqlDaoFactory();
        Connection con = daoFactory.getConnection();

        ArtistDao dao = daoFactory.getArtistDao(con);
        dao.update(artist);
    %>
    <jsp:forward page="artist.jsp"></jsp:forward>
</form>
<%
    }

%>
</body>
</html>
