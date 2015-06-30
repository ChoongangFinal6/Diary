package service;


import java.util.List;
import java.util.Map;

import model.Place;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PlaceDao;

@Service
public class WmpServiceImpl implements WmpService {

	@Autowired
	PlaceDao pd;

	
	//************************ Diary - Place ****************************
	// 장소 소분류 조회
	public List<Place> getPlaceSubCat2(String ptypeCat1) {
		return pd.getPlaceSubCat2(ptypeCat1);
	}
}
