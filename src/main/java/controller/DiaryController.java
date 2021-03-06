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
	
	// 공백 명령으로 접근
	@RequestMapping()
	public String homePage(Model model){
		System.out.println("Ctrl: homePage");
		model.addAttribute("viewPage", "template/diary_home.jsp");
		return "diaryMain";
	}

	// 다이어리 작성
	@RequestMapping(value = "DiaryWrite", method = RequestMethod.POST)
	public String DiaryWrite(Diary diary, Model model) {
		int result = wmpService.diaryUpdateWrite(diary);
		if (result > 0) {
			model.addAttribute("result", result);
			return "Diary/DiaryMain";
		//	model.addAttribute("viewPage", "template/diary_home.jsp");
		} else {
			model.addAttribute("result", result);
			return "redirect:Diary/DiaryWrite";
		//	model.addAttribute("viewPage", "template/diary_home.jsp");
		}
//		return "diaryMain";
	}

	// 다이어리 삭제
	@RequestMapping(value = "diaryCancel")
	public String diaryCancel(HttpServletRequest req, HttpServletResponse rep,
			Model model) {
		System.out.println("Ctrl: diaryDelete ");
		int dNo = Integer.parseInt(req.getParameter("dNo"));

		int result = 0;
		int delTV = wmpService.deleteTV(dNo);
		System.out.println("delTv : " + delTV);
		result = wmpService.deleteDiary(dNo);

		model.addAttribute("result", result);
		return "Diary/DiaryMain";
	}
	
	//	장소 검색
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
	
//	방문 기록 모두 조회 (AJAX)
	@RequestMapping(value="placeAll", method=RequestMethod.GET)
	public String placeAllJSON(HttpServletRequest req,HttpServletResponse rep, Model model) throws IOException{
		
		String email = req.getParameter("mEmail");
		int dNo = Integer.parseInt(req.getParameter("dNo"));
		System.out.println("Ctrl : placeAllJSON - "+ email + "/" + dNo);
		TodayVisit todayVisit = new TodayVisit();
		todayVisit.setmEmail(email);
		todayVisit.setdNo(dNo);
		List<TodayVisit> vList = wmpService.todayVisitList(todayVisit);
		
		String str = "{\"visited\" : [";
		for (int i = 0; i < vList.size(); i++) {
			str += "{\"dNo\" : \"" + vList.get(i).getdNo() + "\", ";
			str += "\"mEmail\" : \"" + vList.get(i).getmEmail() + "\", ";
			str += "\"pName\" : \"" + vList.get(i).getpName() + "\", ";
			str += "\"tTime\" : \"" + vList.get(i).gettTime() + "\", ";
			if(i == vList.size()-1){
				str += "\"tWork\" : \"" + vList.get(i).gettWork() + "\"}";
			}else{
				str += "\"tWork\" : \"" + vList.get(i).gettWork() + "\"},";
			}
		}
		str += "]}";
		System.out.println("json : "+str);
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();
		out.print(str);
		
		//model.addAttribute("obj", todayVisit);
		//System.out.println(str);
		return null;
	}
	
//	새 방문기록 작성
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
	
//	새 방문기록 작성 과정 - 시간 계산 (AJAX)
	@RequestMapping(value="visitTimeCalc")
	public String visitTimeCalc(){
		
		return null;
	}
	
	@RequestMapping(value="DiaryMain")
	public String DiaryMain(Model model){
		System.out.println("Ctrl : DiaryMain");
		String mEmail = "ttt@choongang.com";
		List<Diary> diaryList = wmpService.myDiaryList(mEmail);
		
		model.addAttribute("diaryList", diaryList);
		
		model.addAttribute("viewPage", "Diary/DiaryMain");
		
		/*return "Diary/DiaryMain";*/
		return "/index";
	}
	
// 새 방문기록 작성 폼 요청	
	@RequestMapping(value="insertVisitView")
	public String insertVisitView(int dNo, String mEmail, String pName, Model model){

		model.addAttribute("dNo", dNo);
		model.addAttribute("pName", pName);
		model.addAttribute("mEmail", mEmail);
		
		return "Diary/insertVisitView";
	}

// 방문기록 수정 폼 요청
	@RequestMapping(value="modifyVisitView")
	public String modifyVisitView(int dNo, String mEmail, String pName, Model model){
		
		model.addAttribute("dNo", dNo);
		model.addAttribute("pName", pName);
		model.addAttribute("mEmail", mEmail);
		
		return "Diary/modifyVisitView";
	}
	
// 방문기록 삭제 (AJAX)
	@RequestMapping(value="deleteVisit")
	public String deleteVisit(int dNo, String mEmail, String pName, Model model, HttpServletResponse rep) throws IOException{
		TodayVisit todayVisit = new TodayVisit();
		todayVisit.setdNo(dNo);
		todayVisit.setmEmail(mEmail);
		todayVisit.setpName(pName);
		int result = wmpService.deleteVisit(todayVisit);
		System.out.println("삭제결과 : "+result);
		PrintWriter out = rep.getWriter();
		out.print(result);
		return null;
	}
	@RequestMapping(value="DiaryDetail")
	public String DiaryDetail(){
		
		return "Diary/DiaryDetail";
	}
	
	@RequestMapping(value="DiaryWrite", method=RequestMethod.GET)
	public String DiaryWriteView(Model model){
		String mEmail = "ttt@choongang.com";
		
		Date today = new Date();
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String date = formater.format(today);
		
		Diary searchDiary = new Diary();
		
		searchDiary.setmEmail(mEmail);
		searchDiary.setdDay(date);
		
		
		Diary thisDiary = wmpService.thisDiary(searchDiary);
	
		String view = "";
		
		if(thisDiary != null){
			model.addAttribute("warningEmail", thisDiary.getmEmail());
			
			view = "Diary/DiaryMain";
		}else{
			Diary diary = new Diary();
			
			diary.setmEmail(mEmail);
			diary.setdDay(date);
			diary.setdTitle(date + " 임시 다이어리");
			
			wmpService.diaryInsert(diary);
			int dNo = wmpService.searchDNo(mEmail);
			
			model.addAttribute("mEmail", mEmail);
			model.addAttribute("dNo", dNo);
			model.addAttribute("date", date);
			
			view = "Diary/DiaryWrite";
		}
		
		/*if(thisDiary.getdNo() == null){
			Diary diary = new Diary();
			
			diary.setmEmail(mEmail);
			
			wmpService.diaryInsert(diary);

			int dNo = wmpService.searchDNo(mEmail);
			
			model.addAttribute("mEmail", mEmail);
			model.addAttribute("dNo", dNo);
			model.addAttribute("date", date);
		}else{
			model.addAttribute("mEmail", thisDiary.getmEmail());
			model.addAttribute("dNo", thisDiary.getdNo());
			model.addAttribute("date", thisDiary.getdDay());
		}*/
		
		return view;
	}

	
}
