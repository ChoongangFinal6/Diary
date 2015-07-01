package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Food;
import model.Menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import service.kcalBookService;
import service.menuService;

@Controller
public class FoodController {
	 @Autowired 
	 menuService ms;
	 @Autowired 
	 kcalBookService ks;
	
	 @RequestMapping(value="diaryFoodInsert", method=RequestMethod.POST)
		public String placeWriteOk(MultipartHttpServletRequest req, Model model) {		    
		    Food foodDto = new Food();
			System.out.println("control diaryFoodInsert");
			try {
				MultipartFile fimg = req.getFile("foodImage");

				if(fimg.getSize() > 0) { // 배열 형태이기 때문에 
					String path = req.getSession().getServletContext().getRealPath("/");
					
					File file = new File(path + "resources/upload/food/" + fimg.getOriginalFilename());
					fimg.transferTo(file);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			System.out.println("file inserted");
			System.out.println("ddd" + req.getFile("foodImage").getOriginalFilename());
			
			foodDto.setTypeCode(Integer.parseInt(req.getParameter("typeCode")));
			foodDto.setKindCode(Integer.parseInt(req.getParameter("kindCode")));
			foodDto.setKcal(Integer.parseInt(req.getParameter("kcal")));
			foodDto.setFoodName("foodName");
			foodDto.setGram(Integer.parseInt(req.getParameter("gram")));
			foodDto.setAmount(req.getParameter("amount"));
			foodDto.setFoodImage(req.getFile("foodImage").getOriginalFilename());		
			int result = ks.insertFood(foodDto);
			
			System.out.println(result);
			
		//	model.addAttribute("viewName", "diary/placeWriteOk.jsp");
			
			return "/index";
		} 
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
