package service;

import java.util.List;

import model.Menu;

public interface menuService {
    List<Menu> menuList1();

	List<Menu> fmenu(int typeCode);

	List<Menu> menuSelectList(String foodType);
 }
