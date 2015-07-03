package service;

import java.util.List;

import model.Diary;
import model.Place;
import model.TodayVisit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.DiaryDao;
import dao.PlaceDao;

@Service
public class WmpServiceImpl implements WmpService{
	@Autowired
	private DiaryDao diaryDao;
	@Autowired
	private PlaceDao pd;

	public Place placeOne(String pName) {
		return pd.placeOne(pName);
	}
	public List<TodayVisit> todayVisitList(int dno) {
		return diaryDao.todayVisitList(dno);
	}
	public Place searchPlaceOne(String pName) {
		return pd.searchPlaceOne(pName);
	}
	public int visitInsert(TodayVisit todayVisit) {
		return diaryDao.visitInsert(todayVisit);
	}
	// 장소 분류코드 조회
	public List<Place> getPlaceSubCat2(String ptypeCat1) {
		return pd.getPlaceSubCat2(ptypeCat1);
	}
	public int deleteTV(int dNo) {
		return diaryDao.deleteTV(dNo);
	}
	public int deleteDiary(int dNo) {
		return diaryDao.deleteDiary(dNo);
	}
	
	public List<Diary> myDiaryList(String mEmail) {
		return diaryDao.myDiaryList(mEmail);
	}

	// 새 장소 등록
	public int insertPlace(Place place) {
		return pd.placeInsert(place);
	}
	// 등록되어 있는 장소명인지 조회
	public int isRegistedPlace(String pName) {
		return pd.isRegistedPlace(pName);
	}
	
	public int diaryInsert(Diary diary) {
		return diaryDao.diaryInsert(diary);

	}
	public int searchDNo(String mEmail) {
		return diaryDao.searchDNo(mEmail);
	}

	public int diaryUpdateWrite(Diary diary) {
		return diaryDao.diaryUpdateWrite(diary);
	}

	public Diary thisDiary(Diary diary) {
		return diaryDao.thisDiary(diary);
	}
}
