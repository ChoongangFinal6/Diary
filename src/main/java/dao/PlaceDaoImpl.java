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
		System.out.println("	Dao_getPCat2 : "+pCat1Code);
		return  session.selectList("Place.getSubCat2", pCat1Code);
	}

	// 새 장소 등록
	public int placeInsert(Place place) {
		System.out.println("	Dao_placeInsert");
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

	// 이미 등록되어 있는 장소명인지 조회
	public int isRegistedPlace(String pName) {
		System.out.println(	"	Dao_isRegistedPlace : " +pName);		
		return session.selectOne("Place.isRegistedPlace", pName);
	}

	// 등록된 장소명 목록 조회
	public List<Place> listPlace(int pageNum) {
		System.out.println(	"	Dao_listPlace");
		return session.selectList("Place.listPlace", pageNum);
	}

	// 총 장소 갯수
	public int cntAllPlace() {
		System.out.println(	"	Dao_cntAllPlace");
		return session.selectOne("Place.cntAllPlace");
	}
}
