package controller;

import model.ArtistItem;

import java.sql.SQLException;
import java.util.List;

public interface ArtistDao {

    public void create(String name) throws SQLException;

    public ArtistItem read(int id) throws SQLException;

    public ArtistItem readByName(String name) throws SQLException;

    public void update(ArtistItem artistItem);

    public void delete(ArtistItem artistItem);

    public List<ArtistItem> getAll() throws SQLException;
}
