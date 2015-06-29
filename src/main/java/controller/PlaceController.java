package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.WmpService;

@Controller
public class PlaceController {

	@Autowired
	WmpService ws;
	
	// 새 장소 등록 요청
	@RequestMapping(value="placeInsertForm")
	public String placeInsertForm(){
		System.out.println("ReqMap: placeInsertForm");
		return "Diary/place/placeInsertForm";
	}
	
	// 새 장소 등록
	@RequestMapping(value="placeInsert")
	public String placeInsert(Model model){
		
		return "";
	}
	
	// 소분류읽어오기(ajax)
	@RequestMapping(value="getCat2")
	public String getCat2(Model model){
	//	ws.getCat2()
		return "";
	}
	
	
}
