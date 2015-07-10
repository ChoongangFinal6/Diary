package controller;

import model.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	// 회원 가입 요청
	@RequestMapping(value="memberJoinForm")
	public String memberJoinForm(Model model){
		System.out.println("CTRL:memberJoinForm");
		model.addAttribute("viewPage", "member/memberJoinForm.jsp");
		return "diaryMain";
	}

	// 회원 가입 처리
	@RequestMapping(value="memberJoinPro")
	public String memberJoinPro(@ModelAttribute Member mem, Model model){
		System.out.println("CTRL:memberJoinPro");
		
		model.addAttribute("viewPage", "member/");
		return "diaryMain";
	}
}
