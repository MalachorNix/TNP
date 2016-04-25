package controller;

import model.GenreItem;

import java.sql.SQLException;
import java.util.List;

public interface GenreDao {

    public void create(String name) throws SQLException;

    public GenreItem read(int id) throws SQLException;

    public GenreItem readByName(String genre_name) throws SQLException;

    public void update(GenreItem genreItem);

    public void delete(GenreItem genreItem);

    public List<GenreItem> getAll() throws SQLException;
}
