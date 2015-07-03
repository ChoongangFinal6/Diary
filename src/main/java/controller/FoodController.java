package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
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
	 @RequestMapping(value="FoodKcalBook1")
	 public String menuList(Model model){
		 List<Menu> MenuList1 = ms.menuList1();
		 
		 List<List<Menu>> dlist = new ArrayList<List<Menu>>();
		 
		 for(int i=0; i<MenuList1.size(); i++) {
			 List<Menu> Menu = ms.menuSelectList(MenuList1.get(i).getFoodType());
			 
			 dlist.add(Menu);
		 }
		 
		/* List<Menu> Menu0 = ms.menuSelectList(MenuList1.get(0).getFoodType());
		 List<Menu> Menu1 = ms.menuSelectList(MenuList1.get(1).getFoodType());
		 List<Menu> Menu2 = ms.menuSelectList(MenuList1.get(2).getFoodType());
		 List<Menu> Menu3 = ms.menuSelectList(MenuList1.get(3).getFoodType());
		 List<Menu> Menu4 = ms.menuSelectList(MenuList1.get(4).getFoodType());
		 List<Menu> Menu5 = ms.menuSelectList(MenuList1.get(5).getFoodType());
		 
		 dlist.add(Menu0);
		 dlist.add(Menu1);
		 dlist.add(Menu2);
		 dlist.add(Menu3);
		 dlist.add(Menu4);
		 dlist.add(Menu5);*/
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
		 model.addAttribute("dlist",dlist);
		 
		 /*for (int i = 0; i < Menu1.size(); i++) {
			System.out.println(Menu1.get(i).getFoodKind());
		}*/
	
		 return "food/FoodKcalBook";
	 }
	 
	 
	 //음식메뉴 리스트
		@RequestMapping(value="FoodList",method=RequestMethod.POST)
		public String foodList(int kindCode, Model model, HttpServletResponse rep) throws IOException{
            System.out.println("음식메뉴"+kindCode);
            
            List<Food> foodList = ks.Foodlist(kindCode);
           
            String fileFath= "resources/upload/food/";
            String foodinfo= "";
            String foodstr = "<tr><th>음식명</th><th>이미지</th><th>칼로리</th>"
	        	   		+ "<th>목측량(1개,1인분)</th><th>분량(g)</th></tr>";
            
	        for(Food ff : foodList){
	        	foodinfo += "<tr><td>"+ ff.getFoodName() + "</td>"
	        			+ "<td><img src='" + fileFath+ff.getFoodImage() + "' width='70px' height='50px'></td>"
	        			+ "<td>" + ff.getKcal() + "</td>"
	        			+ "<td>" + ff.getAmount() + "</td>"
	        			+ "<td>" + ff.getGram() + "</td></tr>";
	        	//foodList.get(i).setFoodImage( fileFath+foodList.get(i).getFoodImage() );
	        }
			String foodDetail=null;
			foodDetail=foodstr+foodinfo;
			/*String str ="/1231312.jpg/1231231.jpg/1231232.jpg/1231.jpg";
			
			String[] df 	= str.split("/");
			System.out.println(df[0]);
			System.out.println(df[1]);
			System.out.println(df[2]);*/
			
			System.out.println("푸드리스트 :"+foodList);
	        model.addAttribute("foodList",foodList);
	        
			
	        rep.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = rep.getWriter();
			out.print(foodDetail);
			
		  return null;	
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
			foodDto.setFoodName(req.getParameter("foodName"));
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
	
	@RequestMapping(value="FoodKcalBook2")
	public String FoodKcalBook(){
	System.out.println("Ctrl:FoodWrite");
		return "food/FoodKcalBook";
	}
	
	
	
	
	
	
	
	
	
	
	
}
