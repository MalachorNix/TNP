package controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlDaoFactory implements DaoFactory{

    private String user = "root";
    private String password = "root";
    private String url = "jdbc:mysql://localhost:3306/mysql?useSSL=false";
    private String driver = "com.mysql.jdbc.Driver";
    private static Connection connection;
    private static DataSource dataSource;


    public MySqlDaoFactory() {
        try {
            // Class.forName(driver);
            Context ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("jdbc/library");
        } catch (NamingException e) {
            e.printStackTrace();
        // } catch (ClassNotFoundException e) {
        //     e.printStackTrace();
        }
    }

    @Override
    public Connection getConnection() throws SQLException {
        connection = dataSource.getConnection();
        return connection;
        // return DriverManager.getConnection(url, user, password);
    }

    @Override
    public GenreDao getGenreDao(Connection connection) {
        return new MySqlGenreDao(connection);
    }

    @Override
    public ArtistDao getArtistDao(Connection connection) {
        return new MySqlArtistDao(connection);
    }

    @Override
    public TrackDao getTrackDao(Connection connection) {
        return new MySqlTrackDao(connection);
    }
}
