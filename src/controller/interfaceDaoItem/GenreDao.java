package controller.interfaceDaoItem;

import model.GenreItem;

import java.sql.SQLException;
import java.util.List;

public interface GenreDao {

    void create(String name) throws SQLException;

    GenreItem read(int id) throws SQLException;

    GenreItem readByName(String genre_name) throws SQLException;

    void update(GenreItem genreItem);

    void delete(GenreItem genreItem);

    List<GenreItem> getAll() throws SQLException;
}
