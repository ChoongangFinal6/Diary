package dao;

import java.util.List;

import model.Place;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceDaoImpl implements PlaceDao {

	@Autowired
	private SqlSession session;

	// 소분류 지역코드 조회
	public List<Place> getPlaceSubCat2(String pCat1Code) {
		return  session.selectList("Place.getSubCat2", pCat1Code);
	}

	// 새 장소 등록
	public int placeInsert(Place place) {
		System.out.println("Dao: placeInsert");
		return session.insert("Place.insertPlace", place);
	}
	

	public Place placeOne(String pName){
		Place place = session.selectOne("PlaceList", pName); 
		return place;
	}


	public Place searchPlaceOne(String pName) {
		Place searchPlaceOne = session.selectOne("searchPlace", pName);
		return searchPlaceOne;
	}
}
