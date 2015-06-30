package service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PlaceDao;

@Service
public class WmpServiceImpl implements WmpService {

	@Autowired
	PlaceDao pd;
}
