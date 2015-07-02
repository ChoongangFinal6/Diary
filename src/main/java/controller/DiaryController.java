package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Diary;
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
			str += "{\"ptype\" : \"" + place.getpType() + "\", ";
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
	public String insertVisit(HttpServletRequest req,HttpServletResponse rep, Model model) throws IOException, ParseException{
		
		int dNo = Integer.parseInt(req.getParameter("dNo"));
		String mEmail = req.getParameter("mEmail");
		String pName = req.getParameter("pName");
		String tWork = req.getParameter("tWork");
		String time1 = req.getParameter("time1");
		String time2 = req.getParameter("time2");
		
		
		
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();
		int result = 0;
		
		DateFormat sdf = new SimpleDateFormat("hh:mm");
		Date date1 = sdf.parse(time1);
		Date date2 = sdf.parse(time2);
		System.out.println("time1 : " + time1);
		System.out.println("time2 : " + time2);
		System.out.println(date1.after(date2));
		if(date1.after(date2)){
			result = 2;
			out.print(result);
		}else if(time2.equals("00:00")){
			result = 3;
			out.print(result);
		}else{
		
		String tTime = time1 + "~" + time2;
		
		System.out.println("타임 : " + tTime);
		
		//INSERT INTO TodayVisit values (2, 1, 5, 1, '공부하러 감', '09:00~18:00');
		
		TodayVisit todayVisit = new TodayVisit();
		
		todayVisit.setdNo(dNo);
		todayVisit.setmEmail(mEmail);
		todayVisit.setpName(pName);
		todayVisit.settWork(tWork);
		todayVisit.settTime(tTime);
		
		result = wmpService.visitInsert(todayVisit);
		
		out.print(result);
		}
		return null;
	}
	
	@RequestMapping(value="DiaryMain")
	public String DiaryMain(Model model){
		return "Diary/DiaryMain";
	}
	
	@RequestMapping(value="insertVisitView")
	public String insertVisitView(int dNo, String mEmail, String pName, Model model){

		model.addAttribute("dNo", dNo);
		model.addAttribute("pName", pName);
		model.addAttribute("mEmail", mEmail);
		
		return "Diary/insertVisitView";
	}
	
	@RequestMapping(value="DiaryDetail")
	public String DiaryDetail(){
		
		return "Diary/DiaryDetail";
	}
	
	@RequestMapping(value="DiaryWrite", method=RequestMethod.GET)
	public String DiaryWriteView(Model model){
		String mEmail = "ttt@choongang.com";
		
		Diary diary = new Diary();
		
		diary.setmEmail(mEmail);
		
		int result = wmpService.diaryInsert(diary);

		int dNo = wmpService.searchDNo(mEmail);
		
		model.addAttribute("result", result);
		model.addAttribute("mEmail", mEmail);
		model.addAttribute("dNo", dNo);
		
		return "Diary/DiaryWrite";
	}
	
	/*@RequestMapping(value="write",method=RequestMethod.POST)
	public String write(Board board, Model model) {
		int result = bs.insert(board);
		if (result > 0) {	return "redirect:list.do";
		} else {	return "writeForm";	}
	}*/
	
	@RequestMapping(value="DiaryWrite", method=RequestMethod.POST)
	public String DiaryWrite(Diary diary, Model model){
		int result = wmpService.diaryInsert(diary);
		if(result > 0){
			model.addAttribute("result", result);
			return "Diary/DiaryMain";
		}else{
			model.addAttribute("result", result);
			return "redirect:Diary/DiaryWrite";			
		}
	}
	@RequestMapping(value="diaryCancel")
	public String diaryCancel(HttpServletRequest req,HttpServletResponse rep, Model model){
		int dNo = Integer.parseInt(req.getParameter("dNo"));
		System.out.println(dNo);
		
		int result = 0;
		
		
		int delTV = wmpService.deleteTV(dNo);
		System.out.println("delTv : " + delTV);
		result = wmpService.deleteDiary(dNo);
		System.out.println("result : " + result);
		
		model.addAttribute("result", result);
		return "Diary/DiaryMain";
	}
}
