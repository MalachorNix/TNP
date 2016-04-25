package model;

import java.io.Serializable;

public class MusicItem implements Serializable{
    private int id;
    private String name;

    public MusicItem(String name) {
        this.name = name;
    }

    public MusicItem(int id, String name) {
        this.name = name;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
