package controller;

import model.TrackItem;

import java.sql.SQLException;
import java.util.List;

public interface TrackDao {

    public void create(String name, int genre_id, int artist_id) throws SQLException;

    public TrackItem read(int id) throws SQLException;

    public List<TrackItem> readByGenre(int genre_id) throws SQLException;

    public List<TrackItem> readByArtist(int artist_id) throws SQLException;

    public List<TrackItem> readByName(String name) throws SQLException;

    public List<TrackItem> readByArtistInGenre(int artist_id, int genre_id) throws SQLException;


    public void update(TrackItem trackItem);

    public void delete(TrackItem trackItem);

    public List<TrackItem> getAll() throws SQLException;
}
