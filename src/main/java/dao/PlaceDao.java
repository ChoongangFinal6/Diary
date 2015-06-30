package dao;

import java.util.List;
import java.util.Map;

import model.Place;

public interface PlaceDao {

	public List<Place>  getPlaceSubCat2(String ptypeCat1);	// 장소 소분류 조회

	public int placeInsert(Place place);
	
}
