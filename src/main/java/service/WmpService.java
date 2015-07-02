package service;

import java.util.List;

import model.Diary;
import model.Place;
import model.TodayVisit;


public interface WmpService {
	// Diary
	public Place placeOne(String pName);
	public List<TodayVisit> todayVisitList(int dno);
	public Place searchPlaceOne(String pName);
	public int visitInsert(TodayVisit todayVisit);
	public int diaryInsert(Diary diary);
	
	// Diary_Place
	List<Place> getPlaceSubCat2(String ptypeCat1);
	int insertPlace(Place pDto);
}
