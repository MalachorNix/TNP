package controller.implementationDaoMusicItem;

import controller.interfaceDaoItem.ArtistDao;
import model.ArtistItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySqlArtistDao implements ArtistDao {

    private final Connection connection;

    public MySqlArtistDao(Connection connection) {
        this.connection = connection;
    }


    @Override
    public void create(String name) throws SQLException {
        String sql = "INSERT INTO library.artist (artist_name) VALUE (?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.executeUpdate();
    }

    @Override
    public ArtistItem read(int id) throws SQLException {
        String sql = "SELECT * FROM library.artist WHERE artist_id = ?;";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        resultSet.next();
        int resultId = resultSet.getInt("artist_id");
        String resultName = resultSet.getString("artist_name");
        return new ArtistItem(resultId, resultName);
    }

    @Override
    public ArtistItem readByName(String name) throws SQLException {
        String sql = "SELECT * FROM library.artist WHERE artist_name = ?;";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        ResultSet resultSet = statement.executeQuery();
        ArtistItem artistItem = null;
        if (resultSet.next()) {
            artistItem = new ArtistItem(resultSet.getInt("artist_id"), resultSet.getString("artist_name"));
            return artistItem;
        }
        return artistItem;
    }

    @Override
    public void update(ArtistItem artistItem) {
        String sql = "UPDATE library.artist SET artist_name = ? WHERE artist_id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, artistItem.getName());
            statement.setInt(2, artistItem.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(ArtistItem artistItem) {
        String query = "DELETE FROM library.track WHERE track_artist = ?";
        String sql = "DELETE FROM library.artist WHERE artist_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, artistItem.getId());
            statement.executeUpdate();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, artistItem.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<ArtistItem> getAll() throws SQLException {
        String sql = "SELECT * FROM library.artist;";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        List<ArtistItem> list = new ArrayList<>();
        while (resultSet.next()) {
            ArtistItem artistItem = new ArtistItem(resultSet.getInt("artist_id"), resultSet.getString("artist_name"));
            list.add(artistItem);
        }
        return list;
    }

}
