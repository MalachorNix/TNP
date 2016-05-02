package controller.interfaceDaoItem;

import model.TrackItem;

import java.sql.SQLException;
import java.util.List;

public interface TrackDao {

    void create(String name, int genre_id, int artist_id) throws SQLException;

    TrackItem read(int id) throws SQLException;

    List<TrackItem> readByGenre(int genre_id) throws SQLException;

    List<TrackItem> readByArtist(int artist_id) throws SQLException;

    List<TrackItem> readByName(String name) throws SQLException;

    List<TrackItem> readByArtistInGenre(int artist_id, int genre_id) throws SQLException;

    void update(TrackItem trackItem);

    void delete(TrackItem trackItem);

    List<TrackItem> getAll() throws SQLException;
}
