package service;

import java.util.List;

import model.Place;
import model.TodayVisit;


public interface WmpService {
	// Diary
	public Place placeOne(int pcode);
	public List<TodayVisit> todayVisitList(int dno);
	public Place searchPlaceOne(String pName);
	public int visitInsert(TodayVisit todayVisit);

	// Diary_Place
	List<Place> getPlaceSubCat2(String ptypeCat1);
	int insertPlace(Place pDto);
}
