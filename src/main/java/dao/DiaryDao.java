package dao;

import java.util.List;

import model.Place;
import model.TodayVisit;

public interface DiaryDao {
	public List<TodayVisit> todayVisitList(int dno);
	public int visitInsert(TodayVisit todayVisit);
}
