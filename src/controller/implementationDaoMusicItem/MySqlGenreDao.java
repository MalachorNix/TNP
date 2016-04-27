package controller.implementationDaoMusicItem;

import controller.impelementationDaoFactory.MySqlDaoFactory;
import controller.interfaceDaoFactory.DaoFactory;
import controller.interfaceDaoItem.GenreDao;
import model.GenreItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MySqlGenreDao implements GenreDao {

    private final Connection connection;

    public MySqlGenreDao(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void create(String name) throws SQLException {
        String sql = "INSERT INTO library.genre (genre_name) VALUE (?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.executeUpdate();
    }

    @Override
    public GenreItem read(int id) throws SQLException {
        String sql = "SELECT * FROM library.genre WHERE genre_id = ?;";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        resultSet.next();
        GenreItem genreItem = new GenreItem(resultSet.getInt("genre_id"), resultSet.getString("genre_name"));
        return genreItem;
    }

    @Override
    public GenreItem readByName(String genre_name) throws SQLException {
        String sql = "SELECT * FROM library.genre WHERE genre_name = ?;";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, genre_name);
        ResultSet resultSet = statement.executeQuery();
        GenreItem genreItem = null;
        if (resultSet.next()) {
            genreItem = new GenreItem(resultSet.getInt("genre_id"), resultSet.getString("genre_name"));
            return genreItem;
        }
        return genreItem;
    }

    @Override
    public void update(GenreItem genreItem) {
        String sql = "UPDATE library.genre SET genre_name = ? WHERE genre_id = ?";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, genreItem.getName());
            statement.setInt(2, genreItem.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(GenreItem genreItem) {
        String query = "DELETE FROM library.track WHERE track_genre = ?";
        String sql = "DELETE FROM library.genre WHERE genre_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, genreItem.getId());
            statement.executeUpdate();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, genreItem.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<GenreItem> getAll() throws SQLException {
        String sql = "SELECT * FROM library.genre;";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        List<GenreItem> list = new ArrayList<GenreItem>();
        while (resultSet.next()) {
            GenreItem genreItem = new GenreItem(resultSet.getInt("genre_id"), resultSet.getString("genre_name"));
            list.add(genreItem);
        }
        return list;
    }
}
