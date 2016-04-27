package controller.interfaceDaoFactory;

import controller.interfaceDaoItem.ArtistDao;
import controller.interfaceDaoItem.GenreDao;
import controller.interfaceDaoItem.TrackDao;

import java.sql.Connection;
import java.sql.SQLException;

public interface DaoFactory {

    public Connection getConnection() throws SQLException;

    public GenreDao getGenreDao(Connection connection);

    public ArtistDao getArtistDao(Connection connection);

    public TrackDao getTrackDao(Connection connection);
}
