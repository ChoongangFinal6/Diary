package service;

import java.util.List;

import model.Food;

public interface kcalBookService {

	int insertFood(Food foodDto);
	List<Food> Foodlist(int kindCode);

}
