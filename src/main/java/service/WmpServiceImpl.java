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

	public List<Place> getPlaceSubCat2(String ptypeCat1) {
		return pd.getPlaceSubCat2(ptypeCat1);
	}

	// 새 장소 등록
	public int insertPlace(Place place) {
		return pd.placeInsert(place);
	}
	
	public int diaryInsert(Diary diary) {
		return diaryDao.diaryInsert(diary);
	}
	public int searchDNo(String mEmail) {
		return diaryDao.searchDNo(mEmail);
	}
}
