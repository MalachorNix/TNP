package controller.interfaceDaoFactory;

import controller.interfaceDaoItem.ArtistDao;
import controller.interfaceDaoItem.GenreDao;
import controller.interfaceDaoItem.TrackDao;

import java.sql.Connection;
import java.sql.SQLException;

public interface DaoFactory {

    Connection getConnection() throws SQLException;

    void closeConnection() throws SQLException;

    GenreDao getGenreDao(Connection connection);

    ArtistDao getArtistDao(Connection connection);

    TrackDao getTrackDao(Connection connection);
}
