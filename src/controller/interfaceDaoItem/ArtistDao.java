package controller.interfaceDaoItem;

import model.ArtistItem;

import java.sql.SQLException;
import java.util.List;

public interface ArtistDao {

    void create(String name) throws SQLException;

    ArtistItem read(int id) throws SQLException;

    ArtistItem readByName(String name) throws SQLException;

    void update(ArtistItem artistItem);

    void delete(ArtistItem artistItem);

    List<ArtistItem> getAll() throws SQLException;
}
