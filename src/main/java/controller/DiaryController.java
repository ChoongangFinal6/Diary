package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place;
import model.TodayVisit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.WmpService;

@Controller
public class DiaryController {
	@Autowired
	private WmpService wmpService;
	
	@RequestMapping(value="searchPlace", method=RequestMethod.GET)
	public String searchPlace(HttpServletRequest req, HttpServletResponse rep, Model model) throws IOException{

		rep.setContentType("text/html; charset=utf-8");
		
		String pName = req.getParameter("pName");
		Place place = wmpService.searchPlaceOne(pName);
		String str = "{\"place\" : [";
			str += "{\"pcode\" : " + place.getpCode() + ", ";
			str += "\"ptype\" : \"" + place.getpType() + "\", ";
			str += "\"pname\" : \"" + place.getpName() + "\", ";
			str += "\"pimg\" : \"" + place.getpImg() + "\", ";
			str += "\"pmapx\" : \"" + place.getpMapX() + "\", ";
			str += "\"pmapy\" : \"" + place.getpMapY() + "\"}";
			str += "]}";
		PrintWriter out = rep.getWriter();
		out.print(str);
		return null;
	}
	
	@RequestMapping(value="placeAll", method=RequestMethod.GET)
	public String placeAllJSON(HttpServletRequest req,HttpServletResponse rep, Model model) throws IOException{
		int dNo = Integer.parseInt(req.getParameter("dNo"));
		
		List<TodayVisit> todayVisit = wmpService.todayVisitList(dNo);
		
		/*String str = "{\"paceAll\" : [";
		for (int i = 0; i < placelist.size(); i++) {
			str += "{\"pcode\" : " + placelist.get(i).getpCode() + ", ";
			str += "\"ptype\" : \"" + placelist.get(i).getpType() + "\", ";
			str += "\"pname\" : \"" + placelist.get(i).getpName() + "\", ";
			str += "\"pimg\" : \"" + placelist.get(i).getpImg() + "\", ";
			str += "\"pmapx\" : \"" + placelist.get(i).getpMapX() + "\", ";
			if(i == placelist.size()-1){
				str += "\"pmapy\" : \"" + placelist.get(i).getpMapY() + "\"}";
			}else{
				str += "\"pmapy\" : \"" + placelist.get(i).getpMapY() + "\"},";
			}
		}
		str += "]}";
		
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();
		out.print(str);*/
		
		//model.addAttribute("obj", todayVisit);
		//System.out.println(str);
		return null;
	}
	
	@RequestMapping(value="insertVisit", method=RequestMethod.GET)
	public String insertVisit(HttpServletRequest req,HttpServletResponse rep, Model model) throws IOException{
		int dNo = Integer.parseInt(req.getParameter("dNo"));;
		int mNo = Integer.parseInt(req.getParameter("mNo"));;
		int pCode = Integer.parseInt(req.getParameter("pCode"));
		String tWork = req.getParameter("tWork");
		String time1 = req.getParameter("time1");
		String time2 = req.getParameter("time2");
		
		String tTime = time1 + "~" + time2;
		
		System.out.println("타임 : " + tTime);
		
		//INSERT INTO TodayVisit values (2, 1, 5, 1, '공부하러 감', '09:00~18:00');
		
		TodayVisit todayVisit = new TodayVisit();
		
		todayVisit.setdNo(dNo);
		todayVisit.setmNo(mNo);
		todayVisit.setpCode(pCode);
		todayVisit.settWork(tWork);
		todayVisit.settTime(tTime);
		
		int result = wmpService.visitInsert(todayVisit);
		
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();
		out.print(result);
		
		return null;
	}
	
	@RequestMapping(value="DiaryMain")
	public String DiaryMain(){
		return "Diary/DiaryMain";
	}
	@RequestMapping(value="insertVisitView")
	public String insertVisitView(int dNo, int mNo, int pCode, Model model){
		model.addAttribute("dNo", dNo);
		model.addAttribute("pCode", pCode);
		model.addAttribute("mNo", mNo);
		
		return "Diary/insertVisitView";
	}
	
	@RequestMapping(value="DiaryDetail")
	public String DiaryDetail(){
		
		return "Diary/DiaryDetail";
	}
	
	@RequestMapping(value="DiaryWrite")
	public String DiaryWrite(){
		
		return "Diary/DiaryWrite";
	}
	
}
