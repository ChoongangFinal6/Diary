package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlaceController {

	
	// 새 장소 등록 요청
	@RequestMapping(value="placeInsertForm")
	public String insertNewPlace(){
		System.out.println("ReqMap: placeInsertForm");
		return "placeInsertForm";
	}
	
	// 새 장소 등록
	@RequestMapping(value="placeInsert")
	public String placeInsert(Model model){
		
		return "";
	}
	
	
	@RequestMapping(value="getCat2")
	public String getCat2(Model model){
		
		return "";
	}
	
	
}
