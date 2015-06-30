package service;

import java.util.List;
import java.util.Map;

import model.Place;

public interface WmpService {

	// Diary_Place
	List<Place> getPlaceSubCat2(String ptypeCat1);
	int insertPlace(Place pDto);
}
