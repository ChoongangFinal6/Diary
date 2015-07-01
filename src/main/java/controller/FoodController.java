package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.sun.scenario.effect.Blend.Mode;

import service.kcalBookService;
import service.menuService;

@Controller
public class FoodController {
	 @Autowired 
	 menuService ms;
	 @Autowired 
	 kcalBookService ks;
	 
	 
	 //음식 중간 분류 가져오기
	 @RequestMapping(value="MenuList")
	 public String menuList(Model model){
		 List<Menu> MenuList1 = ms.menuList1();
		 
		 List<Menu> Menu0 = ms.menuSelectList(MenuList1.get(0).getFoodType());
		 List<Menu> Menu1 = ms.menuSelectList(MenuList1.get(1).getFoodType());
		 List<Menu> Menu2 = ms.menuSelectList(MenuList1.get(2).getFoodType());
		 List<Menu> Menu3 = ms.menuSelectList(MenuList1.get(3).getFoodType());
		 List<Menu> Menu4 = ms.menuSelectList(MenuList1.get(4).getFoodType());
		 List<Menu> Menu5 = ms.menuSelectList(MenuList1.get(5).getFoodType());
		 List<List<Menu>> dlist = new ArrayList<List<Menu>>();
		 dlist.add(Menu0);
		 dlist.add(Menu1);
		 dlist.add(Menu2);
		 dlist.add(Menu3);
		 dlist.add(Menu4);
		 dlist.add(Menu5);
   //      System.out.println("Menu0 :"+Menu0);
   //      System.out.println("Menu1 :"+Menu1);
   //      System.out.println("MenuList1.get(1).getFoodType() :"+MenuList1.get(1).getFoodType());
		System.out.println("---------------------");	 
         for(List<Menu> list1 : dlist){
        	// for(List list2 : list1){
        		 System.out.println("list : " + list1);
        	// }
         }
		 model.addAttribute("MenuList1",MenuList1);
		 model.addAttribute("Menu0",Menu0);
		 model.addAttribute("Menu1",Menu1);
		 model.addAttribute("Menu2",Menu2);
		 model.addAttribute("Menu3",Menu3);
		 model.addAttribute("Menu4",Menu4);
		 model.addAttribute("Menu5",Menu5);
		 model.addAttribute("dlist",dlist);
		 
		 for (int i = 0; i < Menu1.size(); i++) {
			System.out.println(Menu1.get(i).getFoodKind());
		}
		 model.addAttribute("MenuList1",MenuList1);
		 model.addAttribute("MenuList1",MenuList1);
		 return "food/FoodKcalBook";
	 }
	 
	 
	 //음식메뉴 리스트
		@RequestMapping(value="FoodList")
		public String FoodList(int kindCode, Model model){

			List<Food> foodList = ks.Foodlist(kindCode);
	        model.addAttribute("foodlist",foodList);
			
			return "food/FoodList";
		}
	 
	 //음식메뉴 추가
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
	
	@RequestMapping(value="FoodKcalBook")
	public String FoodKcalBook(){
	System.out.println("Ctrl:FoodWrite");
		return "food/FoodKcalBook";
	}
	
	
	
	
	
	
	
	
	
	
	
}
