package dao;

import java.util.List;

import model.Place;
import model.TodayVisit;

import org.apache.ibatis.session.SqlSession;

public interface DiaryDao {
	public List<Place> placeList();
	public TodayVisit todayVisit(int Dno);
}
