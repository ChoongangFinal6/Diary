package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodController {
	
	@RequestMapping(value="FoodWrite")
	public String DiaryWrite(){
		System.out.println("나오나");
		return "food/FoodWrite";
	}
}
