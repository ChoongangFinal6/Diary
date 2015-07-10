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
	
	// 생성된 다이어리에서 입력된 데이터로 수정하는 부분
	public int diaryUpdateWrite(Diary diary);
	
	public Diary thisDiary(Diary diary);
	
	public List<Diary> myDiaryList(String mEmail);
	
	// Diary_Place
	List<Place> getPlaceSubCat2(String ptypeCat1);
	int insertPlace(Place pDto);
	public int isRegistedPlace(String pName);
	public List<Place> listPlace(int pageNum);
	public int deleteVisit(TodayVisit todayVisit);
	public int cntAllPlace();
}
