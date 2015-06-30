package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import service.WmpService;

@Controller
public class PlaceController {

	@Autowired
	WmpService ws;
	
	// 새 장소 등록 요청
	@RequestMapping(value="diaryPlaceInsertForm")
	public String placeInsertForm(){
		System.out.println("Ctrl: diaryPlaceInsertForm");
		return "Diary/place/placeInsertForm";
	}
	
	// 새 장소 등록
	@RequestMapping(value="diaryPlaceInsert", method=RequestMethod.POST)
	public String placeInsert(MultipartHttpServletRequest req, Model model){
		System.out.println("Ctrl: diaryPlaceInsert");
		
		Place pDto = new Place();
		try {
			MultipartFile pimg = req.getFile("pimg");

			if(pimg.getSize() > 0) {
				String path = req.getSession().getServletContext().getRealPath("/");
				
				File file = new File(path + "resources/upload/place/" + pimg.getOriginalFilename());
				pimg.transferTo(file);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
		pDto.setpName(req.getParameter("pname"));
		pDto.setpType( req.getParameter("pTypeCat1") + req.getParameter("pTypeCat2") );
		pDto.setpMapX(Double.parseDouble(req.getParameter("pmapx")));
		pDto.setpMapY(Double.parseDouble(req.getParameter("pmapy")));
		pDto.setpImg(req.getFile("pimg").getOriginalFilename());
		
		int check = ws.insertPlace(pDto);
		
		System.out.println("입력결과 : " + check);
		model.addAttribute("viewName", "diary/placeWriteOk.jsp");
		
		return "/index";
	}
	
	// 소분류읽어오기(ajax)
	@RequestMapping(value="getPTypeCat2")
	public String getSubCat2(String pTypeCat1, Model model, HttpServletRequest req, HttpServletResponse rep)
			throws IOException {
		System.out.println("Ctrl: getPTypeCat2");
		List<Place> cat2List = ws.getPlaceSubCat2(pTypeCat1);
		String optionList ="<option value=''>선택</option>";
		
		for(Place place : cat2List){
			optionList += "<option value='"+place.getpCat2Code()+"'>"+place.getpCat2Name()+"</option>\n";
		}
		
		rep.setContentType("text/html; charset=utf-8");
		PrintWriter out = rep.getWriter();		
		out.print(optionList);
		
		return null;
	}
	
	
}
