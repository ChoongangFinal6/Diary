package service;

import java.util.List;

import model.Diary;
import model.Place;
import model.TodayVisit;


public interface WmpService {
	// Diary
	public Place placeOne(String pName);
	public List<TodayVisit> todayVisitList(TodayVisit todayVisit);
	public Place searchPlaceOne(String pName);
	public int visitInsert(TodayVisit todayVisit);
	public int diaryInsert(Diary diary);
	public int searchDNo(String mEmail);
	public int deleteTV(int dNo);
	public int deleteDiary(int dNo);
	
	// Diary_Place
	List<Place> getPlaceSubCat2(String ptypeCat1);
	int insertPlace(Place pDto);
	public int isRegistedPlace(String pName);
}
