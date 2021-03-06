package dao;

import java.util.List;

import model.Place;

public interface PlaceDao {

	public Place placeOne(String pName);
	public Place searchPlaceOne(String pName);
	public List<Place> getPlaceSubCat2(String ptypeCat1);
	public int placeInsert(Place place);
	public int isRegistedPlace(String pName);
	public List<Place> listPlace(int pageNum);
	public int cntAllPlace();
}
