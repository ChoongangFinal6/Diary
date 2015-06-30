package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place;

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
	@RequestMapping(value="getPtypeCat2")
	public String getSubCat2(String ptypeCat1, Model model, HttpServletRequest req, HttpServletResponse rep)
			throws IOException {
		System.out.println("Ctrl : getPtypeCat2");
		List<Place> cat2List = ws.getPlaceSubCat2(ptypeCat1);
		String optionList ="";
		
		for(Place place : cat2List){
			optionList += "<option value='"+place.getpCat2Code()+"'>"+place.getpCat2Name()+"</option>\n";
		}
		
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();		
		out.print(optionList);
		
		return null;
	}
	
	
}
