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

	@Override
	public List<Place> getPlaceSubCat2(String ptypeCat1) {
		System.out.println("    PlaceDao, getPlaceSubCat2 :" + ptypeCat1);
		String pCat1Code = ptypeCat1;
		return  session.selectList("Place.getSubCat2", pCat1Code);
	}
	
	
}
