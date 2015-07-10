package dao;

import java.util.List;

import model.Diary;
import model.TodayVisit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiaryDaoImpl implements DiaryDao{
	@Autowired
	private SqlSession session;
	
	public List<TodayVisit> todayVisitList(TodayVisit todayVisit) {
		List<TodayVisit> todayVisitList = session.selectList("DiaryTodayOne", todayVisit);
		return todayVisitList;
	}
	public int visitInsert(TodayVisit todayVisit) {
		int visitToday = session.insert("visitInsert", todayVisit);
		return visitToday;
	}
	public int diaryInsert(Diary diary) {
		int diaryInsert = session.insert("DiaryInsert", diary);
		return diaryInsert;
	}
	public int searchDNo(String mEmail) {
		int searchDno = session.selectOne("searchDNo", mEmail);
		return searchDno;
	}
	public int deleteTV(int dNo) {
		int delTV = session.delete("deleteTV", dNo);
		return delTV;
	}
	public int deleteDiary(int dNo) {
		int delDiary = session.delete("deleteDiary", dNo);
		return delDiary;
	}
	public int diaryUpdateWrite(Diary diary) {
		int diaryUpWrite = session.update("diaryUpdateWrite", diary);
		return diaryUpWrite;
	}
	public Diary thisDiary(Diary diary) {
		Diary diarySearch = session.selectOne("thisDiary", diary);
		return diarySearch;
	}
	@Override
	public List<Diary> myDiaryList(String mEmail) {
		System.out.println(mEmail);
		List<Diary> myDiarylist = session.selectList("myDiaryList", mEmail);
		return myDiarylist;
	}
	
	// 방문기록 삭제
	public int deleteVisit(TodayVisit todayVisit) {
		System.out.println("	Dao_deleteVisit : "+todayVisit.getpName());
		return session.delete("TodayVisit.deleteVisit", todayVisit);
	}
}
