package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	
	@RequestMapping(value="DiaryWrite")
	public String DiaryWrite(){
		System.out.println("나오나");
		return "Diary";
	}
}
