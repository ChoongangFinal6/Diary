package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("getPtypeCat2 of " + ptypeCat1);
		ws.getPlaceSubCat2(ptypeCat1);
/*		String str = "{\"pdto\" : [";
		str += "{\"pcode\" : " + pdto.getPcode() + ", ";
		str += "\"ptype\" : \"" + pdto.getPtype() + "\", ";
		str += "\"pname\" : \"" + pdto.getPname() + "\", ";
		str += "\"pimg\" : \"" + pdto.getPimg() + "\", ";
		str += "\"pmapx\" : \"" + pdto.getPmapx() + "\", ";
		str += "\"pmapy\" : \"" + pdto.getPmapy() + "\"}";
	str += "]}";*/
		
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();		
//		out.print(str);
		
		return null;
	}
	
	
}
