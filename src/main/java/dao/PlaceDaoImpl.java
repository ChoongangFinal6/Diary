package dao;

import model.Place;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceDaoImpl implements PlaceDao {

	@Autowired
	private SqlSession session;
	

	public Place placeOne(int pcode){
		Place place = session.selectOne("PlaceList", pcode); 
		return place;
	}


	@Override
	public Place searchPlaceOne(String pName) {
		Place searchPlaceOne = session.selectOne("searchPlace", pName);
		return searchPlaceOne;
	}
}
