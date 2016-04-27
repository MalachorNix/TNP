package model;

public class TrackItem extends MusicItem {

    private int track_genre;

    public int getTrack_artist() {
        return track_artist;
    }

    public int getTrack_genre() {
        return track_genre;
    }

    private int track_artist;

    /*public TrackItem(String name) {
        super(name);
    }*/

    public TrackItem(int id, String name, int genre, int artist) {
        super(id, name);
        this.track_genre = genre;
        this.track_artist = artist;
    }

    public TrackItem(String name, int genre, int artist) {
        super(name);
        this.track_genre = genre;
        this.track_artist = artist;
    }

    @Override
    public String toString() {
        return "TrackItem{" +
                "track_genre=" + track_genre +
                ", track_artist=" + track_artist +
                '}';
    }
}
