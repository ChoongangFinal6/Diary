package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	
	@RequestMapping(value="DiaryContent")
	public String DiaryContent(){
		
		return "Diary/Diarycontent";
	}
	@RequestMapping(value="DiaryWrite")
	public String DiaryWrite(){
		
		return "Diary/DiaryWrite";
	}
		
	
}
