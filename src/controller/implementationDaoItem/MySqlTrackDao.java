package controller.implementationDaoItem;

import controller.interfaceDaoItem.TrackDao;
import model.TrackItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySqlTrackDao implements TrackDao {

    private final Connection connection;

    public MySqlTrackDao(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void create(String name, int genre_id, int artist_id) throws SQLException {
        String sql = "INSERT INTO library.track (track_name, track_genre, track_artist) VALUES (?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setInt(2, genre_id);
        statement.setInt(3, artist_id);
        statement.executeUpdate();
    }

    @Override
    public TrackItem read(int id) throws SQLException {
        String sql = "SELECT * FROM library.track WHERE track_id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        TrackItem trackItem = null;
        while (resultSet.next()) {
            trackItem = new TrackItem(resultSet.getInt("track_id"),
                    resultSet.getString("track_name"), resultSet.getInt("track_genre"),
                    resultSet.getInt("track_artist"));
        }
        return trackItem;
    }

    @Override
    public List<TrackItem> readByGenre(int genre_id) throws SQLException {
        String sql = "SELECT * FROM library.track WHERE track_genre = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, genre_id);
        ResultSet resultSet = statement.executeQuery();
        TrackItem trackItem = null;
        List<TrackItem> list = new ArrayList<>();
        while (resultSet.next()) {
            trackItem = new TrackItem(resultSet.getInt("track_id"),
                    resultSet.getString("track_name"), resultSet.getInt("track_genre"),
                    resultSet.getInt("track_artist"));
            list.add(trackItem);
        }
        return list;
    }

    @Override
    public List<TrackItem> readByArtist(int artist_id) throws SQLException {
        String sql = "SELECT * FROM library.track WHERE track_artist = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, artist_id);
        ResultSet resultSet = statement.executeQuery();
        TrackItem trackItem = null;
        List<TrackItem> list = new ArrayList<>();
        while (resultSet.next()) {
            trackItem = new TrackItem(resultSet.getInt("track_id"),
                    resultSet.getString("track_name"), resultSet.getInt("track_genre"),
                    resultSet.getInt("track_artist"));
            list.add(trackItem);
        }
        return list;
    }

    @Override
    public List<TrackItem> readByName(String name) throws SQLException {
        String sql = "SELECT * FROM library.track WHERE track_name = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        ResultSet resultSet = statement.executeQuery();
        TrackItem trackItem = null;
        List<TrackItem> list = new ArrayList<>();
        while (resultSet.next()) {
            trackItem = new TrackItem(resultSet.getInt("track_id"),
                    resultSet.getString("track_name"), resultSet.getInt("track_genre"),
                    resultSet.getInt("track_artist"));
            list.add(trackItem);
        }
        return list;
    }

    @Override
    public List<TrackItem> readByArtistInGenre(int artist_id, int genre_id) throws SQLException {
        String sql = "SELECT * FROM library.track WHERE track_artist = ? AND track_genre = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, artist_id);
        statement.setInt(2, genre_id);
        ResultSet resultSet = statement.executeQuery();
        TrackItem trackItem = null;
        List<TrackItem> list = new ArrayList<>();
        while (resultSet.next()) {
            trackItem = new TrackItem(resultSet.getInt("track_id"),
                    resultSet.getString("track_name"), resultSet.getInt("track_genre"),
                    resultSet.getInt("track_artist"));
            list.add(trackItem);
        }
        return list;
    }

    @Override
    public void update(TrackItem trackItem) {
        String sql = "UPDATE library.track SET track_name = ? , track_genre = ?, track_artist = ? WHERE track_id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, trackItem.getName());
            statement.setInt(2, trackItem.getTrack_genre());
            statement.setInt(3, trackItem.getTrack_artist());
            statement.setInt(4, trackItem.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(TrackItem trackItem) {
        String query = "DELETE FROM library.track WHERE track_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, trackItem.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<TrackItem> getAll() throws SQLException {
        String sql = "SELECT * FROM library.track;";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        List<TrackItem> list = new ArrayList<TrackItem>();
        while (resultSet.next()) {
            int genre_id = resultSet.getInt("track_genre");
            int artist_id = resultSet.getInt("track_artist");
            TrackItem trackItem = new TrackItem(resultSet.getInt("track_id"),
                    resultSet.getString("track_name"), genre_id,
                    artist_id);
            list.add(trackItem);
        }
        return list;
    }

}
