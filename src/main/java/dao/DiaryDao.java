package dao;

import java.util.List;

import model.Diary;
import model.TodayVisit;

public interface DiaryDao {
	public List<TodayVisit> todayVisitList(int dno);
	public int visitInsert(TodayVisit todayVisit);
	public int diaryInsert(Diary diary);
	public int searchDNo(String mEmail);
}
