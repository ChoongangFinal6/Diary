package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.foodDao;
import model.Food;
@Service
public class kcalBookServiceImpl implements kcalBookService{
    
	@Autowired
	foodDao fd;

	public int insertFood(Food foodDto) {

		return fd.insertFood(foodDto);
	}

}
