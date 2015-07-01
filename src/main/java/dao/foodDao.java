package dao;

import java.util.List;

import model.Food;
import model.Menu;

public interface foodDao {
	  List<Menu> fmenu(int typeCode);
	  int insertFood(Food foodDto);
	  List<Food> Foodlist(int kindCode);
	  List<Menu> menuList1();
	  List<Menu> menuSelectList(String foodType);
}
