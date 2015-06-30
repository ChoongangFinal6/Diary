package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Menu;
@Repository
public class foodDaoImpl implements foodDao {
    @Autowired
    private SqlSession session;
    
    //메뉴 중간 분류
	public List<Menu> fmenu(int typeCode) {
	/*	System.out.println("DAO  fmenu : " + typeCode);*/
		return session.selectList("Menu.mSelect", typeCode); 
	}

}
