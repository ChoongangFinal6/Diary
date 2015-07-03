package dao;

import java.util.List;

import model.Diary;
import model.TodayVisit;

public interface DiaryDao {
	public List<TodayVisit> todayVisitList(TodayVisit todayVisit);
	public int visitInsert(TodayVisit todayVisit);
	public int diaryInsert(Diary diary);
	public int searchDNo(String mEmail);
	public int deleteTV(int dNo);
	public int deleteDiary(int dNo);
}
