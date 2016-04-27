<%@ page import="controller.interfaceDaoItem.ArtistDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="controller.impelementationDaoFactory.MySqlDaoFactory" %>
<%@ page import="controller.interfaceDaoFactory.DaoFactory" %>
<%@ page import="model.ArtistItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Музыкальная библиотека</title>
    <link href="../../css/css.css" rel="stylesheet">
    <script src="../js/common.js" defer></script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<form name="inputForm" action="artistIn.jsp" onsubmit="validateEmpty()">
    <table class="cl2" align="center" border="1" bgcolor="white">

        <% if (request.getParameter("artist_name") == null) {%>
        <h1 align="center">Форма добавления нового артиста</h1>

        <tr>
            <td>Введите имя:
            </td>
            <td><input id="inputField" type="text" name="artist_name" value=""/>
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
    if (name.length() != 0) {
        DaoFactory daoFactory = new MySqlDaoFactory();
        Connection con = daoFactory.getConnection();

        ArtistDao dao = daoFactory.getArtistDao(con);
        dao.create(request.getParameter(name));
        daoFactory.closeConnection();
    }
    if (true) {
%>
<jsp:forward page="artist.jsp"></jsp:forward>
<%
        }
    }
%>
</body>
</html>
