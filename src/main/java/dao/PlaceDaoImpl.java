package dao;

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
		System.out.println("    Dao: placeInsert");
		return session.insert("Place.insertPlace", place);
	}
	

<<<<<<< HEAD
	public Place placeOne(int pcode){
		Place place = session.selectOne("PlaceList", pcode); 
		return place;
	}


	@Override
	public Place searchPlaceOne(String pName) {
		Place searchPlaceOne = session.selectOne("searchPlace", pName);
		return searchPlaceOne;
	}
=======
>>>>>>> ecc13185c2fb306db1d57277a1a24a2a2c60f7c7
}
