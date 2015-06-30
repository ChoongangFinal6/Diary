package dao;

import java.util.List;

import model.TodayVisit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiaryDaoImpl implements DiaryDao{
	@Autowired
	private SqlSession session;
	
	public List<TodayVisit> todayVisitList(int dno) {
		List<TodayVisit> todayVisit = session.selectList("DiaryTodayOne", dno);
		return todayVisit;
	}
	public int visitInsert(TodayVisit todayVisit) {
		int visitToday = session.insert("visitInsert", todayVisit);
		return visitToday;
	}
}
