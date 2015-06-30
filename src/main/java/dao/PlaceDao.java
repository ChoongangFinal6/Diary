package dao;

import java.util.List;

import model.Place;

public interface PlaceDao {

	public Place placeOne(int pcode);
	public Place searchPlaceOne(String pName);
	public List<Place> getPlaceSubCat2(String ptypeCat1);
	public int placeInsert(Place place);
}
