package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.foodDao;
import model.Menu;

@Service
public class menuServiceImpl implements menuService{
    @Autowired
    private foodDao fd;

	public List<Menu> fmenu(int typeCode) {
		
		return fd.fmenu(typeCode);
	}

}
