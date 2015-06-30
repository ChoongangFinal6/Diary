package controller;

import java.util.List;

import model.Menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.menuService;

@Controller
public class FoodController {
	 @Autowired 
	 menuService ms;
	 
	@RequestMapping(value="menu")
	public String mlist(int typeCode){
		List<Menu> menu = ms.fmenu(typeCode);
	    System.out.println(menu);
		String str ="";
		/*for(){
			str = "<option value=" + catList.get(0).gettypCode + ">"
				+ "+catList.get(0).gettypName +</option>";
		}*/
					
		
	  return null;				
	}
	
	@RequestMapping(value="FoodWrite")
	public String Foodwrite(){		
		return "food/FoodWirte";
	}
	
	
}
