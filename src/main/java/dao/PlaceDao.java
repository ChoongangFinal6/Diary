package dao;

import model.Place;

public interface PlaceDao {

	public Place placeOne(int pcode);
	public Place searchPlaceOne(String pName);
}
