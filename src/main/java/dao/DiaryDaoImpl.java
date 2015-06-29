package dao;

import java.util.List;

import model.Place;
import model.TodayVisit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiaryDaoImpl implements DiaryDao{
	@Autowired
	private SqlSession session;
	
	public List<Place> placeList(){
		
		return null;
	}
	public TodayVisit todayVisit(int Dno) {
		TodayVisit todayVisit = session.selectOne("", Dno);
		return todayVisit;
	}
}
