package induk.software.TimeBox;

import induk.software.TimeBox.model.MemberDTO;
import induk.software.TimeBox.model.ddayDTO;
import induk.software.TimeBox.model.f_fileDTO;
import induk.software.TimeBox.model.g_boardDTO;
import induk.software.TimeBox.model.g_fileDTO;
import induk.software.TimeBox.model.majorDTO;
import induk.software.TimeBox.model.myschDTO;
import induk.software.TimeBox.model.uniDTO;
import induk.software.TimeBox.model.ttDTO;
import induk.software.TimeBox.service.BoardService;
import induk.software.TimeBox.service.MemberService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private String partName;
	private String partValue;	
	
	private String getFileName(Part part) {
		String contentDispositionHeader = part.getHeader("content-disposition");
		String[] splitedContentDisposition = contentDispositionHeader.split(";");
		for (String cd : splitedContentDisposition ) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
	
	@RequestMapping(value = "/insertFile", method = RequestMethod.POST)
	public String insertFile(Locale locale, Model model,HttpSession session,HttpServletRequest request) throws IOException, ServletException {	
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		g_fileDTO g_fdto = new g_fileDTO();
		String absolutePath;
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			partName = part.getName();
			if(part.getContentType() != null) {
				partValue = getFileName(part);
				if (partValue != null && ! partValue.isEmpty()) {
					absolutePath = request.getServletContext().getRealPath("/resources/uploadFile");
					part.write(absolutePath + File.separator + partValue);
				}
			}
			else if(partValue == null || partValue.isEmpty()){
				if(partName.equals("file1") && request.getParameter("file1") != null){
					partValue = request.getParameter("file1");
				}
			}
			else {
				partValue = request.getParameter(partName);
			}
			request.setAttribute(partName, partValue);
		}
		g_fdto.setG_name((String)request.getAttribute("file1"));
		g_fdto.setG_no(String.valueOf(1));
		
		int row = BoardService.fileWrite(g_fdto);
		
		model.addAttribute("row", row);
		
		return "taskfile/addFileView";
	}
	
	@RequestMapping(value = "/insertFfile", method = RequestMethod.POST)
	public String insertFfile(Locale locale, Model model,HttpSession session,HttpServletRequest request) throws IOException, ServletException {	
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		f_fileDTO f_fdto = new f_fileDTO();
		String absolutePath;
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			partName = part.getName();
			if(part.getContentType() != null) {
				partValue = getFileName(part);
				if (partValue != null && ! partValue.isEmpty()) {
					absolutePath = request.getServletContext().getRealPath("/resources/uploadFile");
					part.write(absolutePath + File.separator + partValue);
				}
			}
			else if(partValue == null || partValue.isEmpty()){
				if(partName.equals("ffile1") && request.getParameter("ffile1") != null){
					partValue = request.getParameter("ffile1");
				}
			}
			else {
				partValue = request.getParameter(partName);
			}
			request.setAttribute(partName, partValue);
		}
		f_fdto.setF_name((String)request.getAttribute("ffile1"));
		f_fdto.setF_no(String.valueOf(1));
		
		int row = BoardService.ffileWrite(f_fdto);
		
		model.addAttribute("row", row);
		
		return "taskfile/faddFileView";
	}
	
	@RequestMapping(value = "/fileList", method = RequestMethod.GET) // 파일박스
	public String fileList(Locale locale, Model model) {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		
		List<HashMap<String,String>> f_file = BoardService.fileList();
		List<f_fileDTO> list = new ArrayList<f_fileDTO>();
		
		f_fileDTO dto = null;
		
		for(HashMap<String, String> a : f_file){
			dto = new f_fileDTO();
			dto.setF_name(a.get("F_NAME"));	
			dto.setF_date(a.get("F_DATE"));
			list.add(dto);
		}
		
		model.addAttribute("fileList",list);
		
		return "/taskfile/fileBox";
	}

	
	@RequestMapping(value = "/taskList", method = RequestMethod.GET) // 파일박스
	public String taskList(Locale locale, Model model) {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		
		List<HashMap<String,String>> g_file = BoardService.taskList();
		List<g_fileDTO> list = new ArrayList<g_fileDTO>();
		
		g_fileDTO dto = null;
		
		for(HashMap<String, String> a : g_file){
			dto = new g_fileDTO();
			dto.setG_name(a.get("G_NAME"));	
			dto.setG_date(a.get("G_DATE"));
			list.add(dto);
		}

		List<HashMap<String,String>> day = BoardService.selectDay();
		List<ddayDTO> list1 = new ArrayList<ddayDTO>();
		
		ddayDTO ddto = null;
		
		for(HashMap<String, String> a : day){
			ddto = new ddayDTO();
			ddto.setDday_no(String.valueOf(a.get("DDAY_NO")));	
			ddto.setStartday(a.get("STARTDAY"));
			ddto.setEndday(a.get("ENDDAY"));
			ddto.setComm(a.get("COMM"));
			list1.add(ddto);
		}
		
		model.addAttribute("dday",list1);
		
		model.addAttribute("fileList",list);
		
		return "/taskfile/taskBox";
	}

	
	@RequestMapping(value = "/timeTable", method = RequestMethod.GET)
	public String timeTable(Locale locale, Model model,HttpSession session,HttpServletRequest request) {	
		
		
		return "/timetable/timeTable";
	}
	
	@RequestMapping(value = "/taskConn", method = RequestMethod.GET)
	public String taskConn(Locale locale, Model model,HttpSession session,HttpServletRequest request) {	
		
		String conn = request.getParameter("a");
		
		model.addAttribute("conn",conn);
		
		return "taskfile/taskConnView";
	}
	
	@RequestMapping(value = "/fileConn", method = RequestMethod.GET)
	public String fileConn(Locale locale, Model model,HttpSession session,HttpServletRequest request) {	
		
		String conn = request.getParameter("a");
		
		model.addAttribute("conn",conn);
		
		return "taskfile/fileConn";
	}
	@RequestMapping(value = "/taskConnView", method = RequestMethod.GET)
	public String taskConnView(Locale locale, Model model,HttpSession session,HttpServletRequest request) {	
		
		return "redirect:taskList";
	}
	@RequestMapping(value = "/timeList", method = RequestMethod.GET)
	public String timeList(Locale locale, Model model,HttpSession session,HttpServletRequest request) {	

		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);

		 MemberDTO dto = (MemberDTO)session.getAttribute("logined");
			
			String email =  dto.getEmail();
			
			System.out.println("ㅁㄴㅇㄹ"+ email);
			List<myschDTO> data =MemberService.selectMyschData(email);
			
			if(data != null){
			String print[] = new String[data.size()];
	
			for(int i = 0 ; i < data.size(); i++)
			{
				String[] day = {"월요일","화요일","수요일","목요일","금요일"};
				int[] num = {1,2,3,4,5};
				String yoil = "";
				String stime = String.valueOf(data.get(i).getMstime().charAt(0));
				String etime = String.valueOf(data.get(i).getMetime().charAt(0));
				
				for(int j = 0; j < 5 ; j++)
				{
					if(data.get(i).getMday().equals(day[j]))
					{
						yoil = String.valueOf(num[j]); 
					}
				}
				
				print[i] = yoil + stime + etime + data.get(i).getMsubject();
			}
			request.setAttribute("mylist",print);
			System.out.println(print);
			}
			
		return "/timetable/timeTable";
		
		
	}
	
	@RequestMapping(value = "/down", method = RequestMethod.POST)
	public String down(Locale locale, Model model,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {	
		
	     String fileName = request.getParameter("filename");
	        String sDownloadPath = "C:\\rbt\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TimeBox\\resources\\uploadFile\\";
	        String sFilePath = sDownloadPath + fileName;
	        
	        byte b[] = new byte[4096];
	        FileInputStream in = new FileInputStream(sFilePath);
	        
	        String sMime = request.getServletContext().getMimeType(sFilePath);
	        
	        if (sMime == null) {
	            sMime = "application/octet-stream";
	        }
	        response.setContentType(sMime);
	        
	        String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1");
	        response.setHeader("Content-Disposition", "attachment; filename=" + sEncoding);
	        // 응답 헤더 지정
	        ServletOutputStream out = response.getOutputStream();
	        // ServletOutputStream 객체로 Browser에 출력
	        int numRead;
	        while ((numRead = in.read(b, 0, b.length)) != -1) {
	            out.write(b, 0, numRead);
	        }
	        out.flush();
	        out.close();
	        in.close();
	        
		return "taskfile/taskBox";
	
}
	
	
	@RequestMapping(value = "/timeChoice", method = RequestMethod.GET)
	public String timeChoice_1(Locale locale, Model model) {
	
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);
	
		List<HashMap<String, String>>hak = MemberService.hak();
		
		List<uniDTO> list = new ArrayList<uniDTO>();
		
		uniDTO hdto = null;
		
		for(HashMap<String, String> a : hak){
			hdto = new uniDTO();
			hdto.setUni_no((Integer.parseInt(String.valueOf(a.get("UNI_NO")))));
			hdto.setUni_name((a.get("UNI_NAME")));
			list.add(hdto);
		}
		model.addAttribute("hakList",list);
		
		
	     List<HashMap<String, String>>major = MemberService.major();
			
			List<majorDTO> list1 = new ArrayList<majorDTO>();
			
			majorDTO hdto1 = null;
			
			for(HashMap<String, String> a : major){
				hdto1 = new majorDTO();
				hdto1.setMajor_no((Integer.parseInt(String.valueOf(a.get("MAJOR_NO")))));
				hdto1.setMajor_name((a.get("MAJOR_NAME")));
				list1.add(hdto1);
			}
			model.addAttribute("majorList",list1);
			
		
		return "/timetable/timeChoice";
	}
	@RequestMapping(value = "/insertDay", method = RequestMethod.POST)
	public String dayInsert(Locale locale, Model model,HttpSession session,HttpServletRequest request) {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		
		String start = request.getParameter("startyear") + "/" + request.getParameter("startmonth") + "/" + request.getParameter("startday");
		String end = request.getParameter("endyear") + "/" + request.getParameter("endmonth") + "/" + request.getParameter("endday");
		
		ddayDTO day = new ddayDTO();
		
		day.setStartday(start);
		day.setEndday(end);
		day.setComm(request.getParameter("comm"));
		
		int rst = BoardService.insertDay(day);
		
		model.addAttribute("rst",rst);
		
		return "taskfile/ddayconn";
	}
	
	
	@RequestMapping(value = "/ddayconn", method = RequestMethod.GET)
	public String ddayconn(Locale locale, Model model,HttpSession session,HttpServletRequest request) {
	
		return "taskfile/ddayconn";
	}

	@RequestMapping(value = "/selectDay", method = RequestMethod.GET)
	public String selectDay(Locale locale, Model model,HttpSession session,HttpServletRequest request) {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		
		
		
		return "taskfile/taskBox";
	}

	@RequestMapping(value = "/timeTableinsert", method = RequestMethod.GET)
	public String timeTableinsert(Locale locale, Model model,HttpSession session,HttpServletRequest request) {
	
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);
		
		int tt_no =	Integer.parseInt(String.valueOf(request.getParameter("check")));
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("logined");
		
		System.out.println("단데기네"+tt_no);
		
		ttDTO tt = MemberService.selectTTdata(tt_no);
		
		myschDTO mydto = new myschDTO();
		
		mydto.setMteach(tt.getTeach()); //교수
		mydto.setMsubject(tt.getSubject()); //강좌이름
		//mydto.setM_grade(tt.getS_grade()); //학년
		mydto.setMday(tt.getSubdate()); //요일
		mydto.setMstime(tt.getStime()); //시작	
		mydto.setMetime(tt.getEtime()); //끝
		mydto.setPlace(tt.getPlace());//장소
		mydto.setEmail(mdto.getEmail()); //이메일저장
		
		MemberService.insertMysch(mydto);	

		MemberDTO dto = (MemberDTO)session.getAttribute("logined");
			
		String email =  dto.getEmail();
			
		System.out.println("ㅁㄴㅇㄹ"+ email);
			
		List<myschDTO> data =MemberService.selectMyschData(email);
		
	
			String print1[] = new String[data.size()];
			
			for(int i = 0 ; i < data.size(); i++)
			{
				String[] day1 = {"월요일","화요일","수요일","목요일","금요일"};
				int[] num1 = {1,2,3,4,5};
				String yoil1 = "";
				String stime1 = String.valueOf(data.get(i).getMstime().charAt(0));
				String etime1 = String.valueOf(data.get(i).getMetime().charAt(0));
				
				for(int j = 0; j < 5 ; j++)
				{
					if(data.get(i).getMday().equals(day1[j]))
					{
						yoil1 = String.valueOf(num1[j]); 
					}
				}
				
				print1[i] = yoil1 + stime1 + etime1 + data.get(i).getMsubject();
			}
			
			request.setAttribute("mylist",print1);
			//System.out.println(print);
		
		return "/timetable/timeTable";
	}
	
	@RequestMapping(value = "/seltt", method = RequestMethod.POST)
	public String seltt(Locale locale, Model model,HttpSession session,HttpServletRequest request) {
		
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);
	
		int hak_no =  Integer.parseInt(request.getParameter("hak_no"));
		
		System.out.println(hak_no);
		
		List<HashMap<String, String>>hak = MemberService.seltt(hak_no);
		
		List<ttDTO> list = new ArrayList<ttDTO>();
		
		ttDTO ttdto = null;
		
	//session.getAttribute("hakList");
		
		for(HashMap<String, String> a : hak){
			ttdto = new ttDTO();
			ttdto.setTt_no((Integer.parseInt(String.valueOf(a.get("TT_NO")))));
			ttdto.setUni_no(Integer.parseInt(String.valueOf(a.get("UNI_NO"))));
			ttdto.setS_major((String.valueOf(a.get("S_MAJOR"))));
			ttdto.setS_grade((String.valueOf(a.get("S_GRADE"))));
			ttdto.setSubject((String.valueOf(a.get("SUBJECT"))));
			ttdto.setTeach((String.valueOf(a.get("TEACH"))));
			ttdto.setStime((String.valueOf(a.get("STIME"))));
			ttdto.setSubdate(String.valueOf(a.get("SUBDATE")));
			ttdto.setEtime((String.valueOf(a.get("ETIME"))));
			ttdto.setPlace((String.valueOf(a.get("PLACE"))));
			list.add(ttdto);
		}
		
		
		List<HashMap<String, String>>hak1 = MemberService.hak();
		
		List<uniDTO> list1 = new ArrayList<uniDTO>();
		
		uniDTO hdto = null;
		
		for(HashMap<String, String> a : hak1){
			hdto = new uniDTO();
			hdto.setUni_no((Integer.parseInt(String.valueOf(a.get("UNI_NO")))));
			hdto.setUni_name((a.get("UNI_NAME")));
			list1.add(hdto);
		}
		model.addAttribute("hakList",list1);
		
		model.addAttribute("ttList",list);
		
	     List<HashMap<String, String>>major = MemberService.major();
			
			List<majorDTO> list2 = new ArrayList<majorDTO>();
			
			majorDTO hdto1 = null;
			
			for(HashMap<String, String> a : major){
				hdto1 = new majorDTO();
				hdto1.setMajor_no((Integer.parseInt(String.valueOf(a.get("MAJOR_NO")))));
				hdto1.setMajor_name((a.get("MAJOR_NAME")));
				list2.add(hdto1);
			}
			model.addAttribute("majorList",list2);
		
		return "timetable/timeChoice";
	}

	
	@RequestMapping(value = "/join", method = RequestMethod.POST) // ȸ������
	public String join(Locale locale, Model model,HttpServletRequest request) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");

		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);
		MemberDTO mdto = new MemberDTO();
		mdto.setName(String.valueOf(request.getParameter("firstname"))+" "+String.valueOf(request.getParameter("lastname")));
		mdto.setBirthday(String.valueOf(request.getParameter("year"))+"/"+String.valueOf(request.getParameter("month"))+"/"+String.valueOf(request.getParameter("day")));
		mdto.setEmail(String.valueOf(request.getParameter("email")));
		mdto.setPw(String.valueOf(request.getParameter("pw")));
		mdto.setTel(String.valueOf(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3")));
		mdto.setUniver(String.valueOf(request.getParameter("univer")));
		mdto.setMajor(String.valueOf(request.getParameter("major")));
		mdto.setHakbun(String.valueOf(request.getParameter("hakbun")));
		if(request.getParameter("sinbun").equals("교수"))
		{
			mdto.setSinbun("교수");
			
		}else mdto.setSinbun("학생");
		
		
		int rst = MemberService.join(mdto);
		
		if(rst>=1)System.out.println("성공!!");

		return "/memberjoin/membershipFinish";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST) // ȸ������
	public String delete(Locale locale, Model model, HttpServletRequest request,HttpSession session) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");

		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);
		
		MemberDTO sdto = (MemberDTO)session.getAttribute("logined");
		MemberDTO mdto = new MemberDTO();
		
		
		mdto.setEmail(sdto.getEmail());
		mdto.setPw(request.getParameter("pw"));

		MemberService.delete(mdto);
	
		
		return "/memberjoin/memberDropOutFinish";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST) // ȸ������
	public String update(Locale locale, Model model, HttpServletRequest request,HttpSession session) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");

		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("logined");
		
		mdto.getEmail();
		mdto.setName(String.valueOf(request.getParameter("firstname"))+" "+String.valueOf(request.getParameter("lastname")));
		mdto.setBirthday(String.valueOf(request.getParameter("year"))+"/"+String.valueOf(request.getParameter("month"))+"/"+String.valueOf(request.getParameter("day")));
		mdto.setPw(String.valueOf(request.getParameter("pw")));
		mdto.setTel(String.valueOf(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3")));
		mdto.setUniver(String.valueOf(request.getParameter("univer")));
		mdto.setMajor(String.valueOf(request.getParameter("major")));
		mdto.setHakbun(String.valueOf(request.getParameter("hakbun")));
		int rst = MemberService.update(mdto);
	
		if(rst>=1)System.out.println("성공!!");

		return "/memberjoin/updateFinish";
	}
	
	@RequestMapping(value = "/myInformation", method = RequestMethod.GET)
	public String membershipUpdateForm(Locale locale, Model model,HttpSession session, HttpServletRequest request ) {
		
		MemberDTO mdto = new MemberDTO();
		
		 mdto = (MemberDTO)session.getAttribute("logined");
		 
		 model.addAttribute("logined",mdto);
		 
		 String[] name = mdto.getName().split(" ");
		 String[] birth = mdto.getBirthday().split("/");
		 String[] tel = mdto.getTel().split("-");

		 model.addAttribute("firstname",name[0]);
		 model.addAttribute("lastname",name[1]);
		 model.addAttribute("year",birth[0]);
		 model.addAttribute("month",birth[1]);
		 model.addAttribute("day",birth[2]);
		 model.addAttribute("tel1",tel[0]);
		 model.addAttribute("tel2",tel[1]);
		 model.addAttribute("tel3",tel[2]);
		 
		return "/memberjoin/myInformation";
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model, @RequestParam(value="go",required=false) String go, @RequestParam(value="gogroup",required=false) String gogroup ) {
		

		return "/memberjoin/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST) // ȸ������

	public String login(Locale locale, Model model,HttpServletRequest request,HttpSession session) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");

		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);
		MemberDTO mdto = new MemberDTO();
		
		System.out.println(request.getParameter("email"));
		System.out.println(String.valueOf(request.getParameter("pw")));
		
		mdto.setEmail(String.valueOf(request.getParameter("email")));
		mdto.setPw(String.valueOf(request.getParameter("pw")));
		
		MemberDTO rst = MemberService.login(mdto);
		session.setAttribute("logined", rst);
		
		if(rst == null)
		{
			System.out.println("잘못입력하셨습니다");
		}
		
		if(rst != null){
		session.setAttribute("logined", rst);
		session.setAttribute("name", String.valueOf(mdto.getName()));
		}
		
		 MemberDTO dto = (MemberDTO)session.getAttribute("logined");
			
			String email =  dto.getEmail();
			
			System.out.println("ㅁㄴㅇㄹ"+ email);
			List<myschDTO> data =MemberService.selectMyschData(email);
			
			if(data != null){
			String print[] = new String[data.size()];
	
			for(int i = 0 ; i < data.size(); i++)
			{
				String[] day = {"월요일","화요일","수요일","목요일","금요일"};
				int[] num = {1,2,3,4,5};
				String yoil = "";
				String stime = String.valueOf(data.get(i).getMstime().charAt(0));
				String etime = String.valueOf(data.get(i).getMetime().charAt(0));
				
				for(int j = 0; j < 5 ; j++)
				{
					if(data.get(i).getMday().equals(day[j]))
					{
						yoil = String.valueOf(num[j]); 
					}
				}
				
				print[i] = yoil + stime + etime + data.get(i).getMsubject();
			}
			request.setAttribute("mylist",print);
			System.out.println(print);
			}
			
		return "/timetable/timeTable";
	}
	
	@RequestMapping(value = "/boardInsert", method = RequestMethod.GET)
	public String boardInsert(Locale locale, Model model, HttpSession session, HttpServletRequest request) {
		
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		g_boardDTO bdto = new g_boardDTO();
		
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("logined");
		
		for(int i=0;i<5;i++){
		    if(rnd.nextBoolean()){
		        buf.append((char)((rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10))); 
		    }
		}
		
		bdto.setG_code((String.valueOf(buf)));
		bdto.setEmail(mdto.getEmail());
		System.out.println("랜덤코드생성"+buf);
		
		int result = BoardService.boardWrite(bdto);
		
		if(result > 0){
			
			request.setAttribute("success",result);
			request.setAttribute("code", bdto.getG_code());
			
		}
		return "/timetable/message";
	}
	
	@RequestMapping(value = "/searchcode", method = RequestMethod.POST)
	public String searchCode(Locale locale, Model model, HttpSession session, HttpServletRequest request) {
		
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		g_boardDTO bdto = new g_boardDTO();
		
		String usercode =request.getParameter("searchcode");

		bdto = BoardService.searchCode(usercode);
		
		request.setAttribute("bdto", bdto);
		
		return "/timetable/boardConnect";
	}
	
	@RequestMapping(value = "/hak", method = RequestMethod.GET) // ȸ������
	public String hak(Locale locale, Model model,HttpServletRequest request,HttpSession session) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");

	
		return "index";
	}
	
	@RequestMapping(value = "/message", method = RequestMethod.GET) // ȸ������
	public String message(Locale locale, Model model,HttpServletRequest request,HttpSession session) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");

	
		return "/timetable/message";
	}

	
	
	@RequestMapping(value = "/fileBox", method = RequestMethod.GET) // 파일박스
	public String fileBox(Locale locale, Model model) {
		
		return "/taskfile/fileBox";
	}
	
	@RequestMapping(value = "/newFolder", method = RequestMethod.GET) // 파일박스
	public String newFolder(Locale locale, Model model) { 
		
		return "/taskfile/newFolder";
	}
	
	@RequestMapping(value = "/addFile", method = RequestMethod.GET) // 파일박스
	public String addFile(Locale locale, Model model) {
		
		return "/taskfile/addFile";
	}
	
	@RequestMapping(value = "/addFileView", method = RequestMethod.GET) // 파일박스
	public String addFileView(Locale locale, Model model) {
		
		return "/taskfile/addFileView";
	}
	
	@RequestMapping(value = "/faddFile", method = RequestMethod.GET) // 파일박스
	public String faddFile(Locale locale, Model model) {
		
		return "/taskfile/faddFile";
	}
	
	
	@RequestMapping(value = "/taskBox", method = RequestMethod.GET) // 파일박스
	public String homeworkBox(Locale locale, Model model) {
		
		return "/taskfile/taskBox";
	}
	
	
	
	
	@RequestMapping(value = "/setDday", method = RequestMethod.GET) // 파일박스
	public String setDday(Locale locale, Model model) {
		
		return "/taskfile/setDday";
	}
	
	@RequestMapping(value = "/pwdReset", method = RequestMethod.GET) // 파일박스
	public String pwdReset(Locale locale, Model model) {
		
		return "/memberjoin/pwdReset";
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		return "/memberjoin/loginForm";
	}
	
	@RequestMapping(value = "subjectSelection", method = RequestMethod.GET)
	public String subjectSelection(Locale locale, Model model) {
		
		return "/memberjoin/subjectSelection";
	}
	
	@RequestMapping(value = "boardConnect", method = RequestMethod.GET)
	public String boardConnect(Locale locale, Model model) {
		
		return "/timetable/boardConnect";
	}
	
	@RequestMapping(value = "boardLink", method = RequestMethod.GET)
	public String boardLink(Locale locale, Model model, HttpServletRequest request) {
		
	
		return "/timetable/boardLink";
	}
	@RequestMapping(value = "boardLink1", method = RequestMethod.POST)
	public String boardLink1(Locale locale, Model model, HttpServletRequest request,HttpSession session) {
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		BoardService BoardService = ctx.getBean(BoardService.class);
		MemberDTO dto  = (MemberDTO) session.getAttribute("logined");
		String email = dto.getEmail();
		if(request.getParameter("code") != null)
		{
			String code = request.getParameter("code");
			
			
			model.addAttribute("data",code);
		}
		
		return "/timetable/boardLink";
	}
	
	@RequestMapping(value ="emailCheck", method = RequestMethod.GET)
	public String emailCheck(Locale locale, Model model, HttpServletRequest request,HttpSession session) {
		
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		String email = request.getParameter("email");
		System.out.println(email);
		MemberService MemberService = ctx.getBean(MemberService.class);
		int rst = MemberService.emailCheck(email);
		model.addAttribute("id",rst);
		model.addAttribute("email",email);
		
		
		return "/memberjoin/idCheck";
	}
	
	@RequestMapping(value = "createFinish", method = RequestMethod.GET)
	public String createFinish(Locale locale, Model model) {
		
		return "/memberjoin/createFinish";
	}
	
	@RequestMapping(value = "createTaskpage", method = RequestMethod.GET)
	public String createTaskpage(Locale locale, Model model) {
		
		return "/memberjoin/createTaskpage";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpSession session) {
		
		session.getAttribute("logined");
		
		return "index";
	}
	
	@RequestMapping(value = "/Homepageterms", method = RequestMethod.GET)
	public String Homepageterms(Locale locale, Model model) {
		
		return "/memberjoin/Homepageterms";
	}
	
	@RequestMapping(value = "/memberDropOutFinish", method = RequestMethod.GET)
	public String memberDropOutFinish(Locale locale, Model model) {
		
		return "/memberjoin/memberDropOutFinish";
	}
	
	@RequestMapping(value = "/membershipFinish", method = RequestMethod.GET)
	public String membershipFinish(Locale locale, Model model) {
		
		return "/memberjoin/membershipFinish";
	}
	
	@RequestMapping(value = "/updateFinish", method = RequestMethod.GET)
	public String updateFinish(Locale locale, Model model, HttpSession session) {
		
		return "/memberjoin/updateFinish";
	}
	
	@RequestMapping(value = "/membership", method = RequestMethod.GET)
	public String membership(Locale locale, Model model) {

		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/di-context.xml");
		MemberService MemberService = ctx.getBean(MemberService.class);

		List<HashMap<String, String>>hak = MemberService.hak();
		
		List<uniDTO> list = new ArrayList<uniDTO>();
		
		uniDTO hdto = null;
		
		for(HashMap<String, String> a : hak){
			hdto = new uniDTO();
			hdto.setUni_no((Integer.parseInt(String.valueOf(a.get("UNI_NO")))));
			hdto.setUni_name((a.get("UNI_NAME")));
			list.add(hdto);
		}
		model.addAttribute("hakList",list);
		
		
       List<HashMap<String, String>>major = MemberService.major();
		
		List<majorDTO> list1 = new ArrayList<majorDTO>();
		
		majorDTO hdto1 = null;
		
		for(HashMap<String, String> a : major){
			hdto1 = new majorDTO();
			hdto1.setMajor_no((Integer.parseInt(String.valueOf(a.get("MAJOR_NO")))));
			hdto1.setMajor_name((a.get("MAJOR_NAME")));
			list1.add(hdto1);
		}
		model.addAttribute("majorList",list1);
		
		
		return "/memberjoin/membership";
	}
	
	@RequestMapping(value = "/memberFinish", method = RequestMethod.GET)
	public String memberFinish(Locale locale, Model model) {
		
		return "/memberjoin/memberFinish";
	}
	
	@RequestMapping(value = "/dropOut", method = RequestMethod.GET)
	public String dropOut(Locale locale, Model model) {
		
		return "/memberjoin/dropOut";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpSession session) {
		
		session.invalidate();

		return "/memberjoin/loginForm";
	}
	
	
}
