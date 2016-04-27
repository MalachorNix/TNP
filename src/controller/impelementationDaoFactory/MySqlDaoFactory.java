package controller.impelementationDaoFactory;

import controller.implementationDaoItem.MySqlArtistDao;
import controller.implementationDaoItem.MySqlGenreDao;
import controller.implementationDaoItem.MySqlTrackDao;
import controller.interfaceDaoItem.ArtistDao;
import controller.interfaceDaoFactory.DaoFactory;
import controller.interfaceDaoItem.GenreDao;
import controller.interfaceDaoItem.TrackDao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class MySqlDaoFactory implements DaoFactory {

    private static Connection connection;
    private static DataSource dataSource;


    public MySqlDaoFactory() {
        try {
            Context ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("jdbc/library");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Connection getConnection() throws SQLException {
        connection = dataSource.getConnection();
        return connection;
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
