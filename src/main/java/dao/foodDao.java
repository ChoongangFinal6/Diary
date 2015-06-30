package dao;

import java.util.List;

import model.Menu;

public interface foodDao {
	  List<Menu> fmenu(int typeCode);
}
