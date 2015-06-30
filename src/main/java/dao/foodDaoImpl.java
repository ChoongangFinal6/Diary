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
    
	public List<Menu> fmenu(int typeCode) {
		
		return session.selectList("mSelect", typeCode);
	}

}
