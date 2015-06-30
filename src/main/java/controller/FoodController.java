package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.menuService;

@Controller
public class FoodController {
	 @Autowired 
	 menuService ms;
	 
	//음식 중간 분류 과정 - ajax를 사용
	@RequestMapping(value="menu")
	public String mlist(int typeCode, Model mode, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		System.out.println("menu--------------------");
		System.out.println("typeCode: "+typeCode);
		List<Menu> menuList = ms.fmenu(typeCode);
		

		String selectOp ="<option value=''>선택</option>";
		for (Menu menu : menuList) {
			selectOp += "<option value='" + menu.getKindCode() + "'>"
		+menu.getFoodKind()+"</option>\n";
									
		}
		System.out.println("selectOp :"+selectOp);
		rep.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = rep.getWriter();
		out.print(selectOp);
		
	  return null;				
	}
	
	@RequestMapping(value="FoodWrite")
	public String Foodwrite(){
	System.out.println("Ctrl:FoodWrite");
		return "food/FoodWrite";
	}
	
	
}
