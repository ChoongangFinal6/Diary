package service;

import java.util.List;

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
	private PlaceDao placeDao;

	public Place placeOne(int pcode) {
		return placeDao.placeOne(pcode);
	}
	public List<TodayVisit> todayVisitList(int dno) {
		return diaryDao.todayVisitList(dno);
	}
	public Place searchPlaceOne(String pName) {
		return placeDao.searchPlaceOne(pName);
	}
	public int visitInsert(TodayVisit todayVisit) {
		return diaryDao.visitInsert(todayVisit);
	}
}
