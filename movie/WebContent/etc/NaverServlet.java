package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.vo.CommentVO;
import model.vo.MovieVO;
import java.text.SimpleDateFormat;
import api.NaverAPI;
import api.RankingAPI;

@WebServlet("/naverAPI")
public class NaverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// search/NaverAPI.html 에서 보낸 Get요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
		try {
			
			// 오늘 날짜
			Date today = new Date ();
			System.out.println(today);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String targetDay = sdf.format(today);
			System.out.println("포맷 후 :" + targetDay);
			
			// 어제날짜
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DATE, -1);
			String yesterday = sdf.format(c1.getTime());
			
			// 날짜에 따른 박스오피스 api 요청
			//String boxOffRes = RankingAPI.getUrl(targetDay);
			String boxOffRes = RankingAPI.getUrl(yesterday);
			
			// 박스 오피스 JSON Parsing
			JSONObject jobj2 = new JSONObject(boxOffRes);
			JSONObject BR = jobj2.getJSONObject("boxOfficeResult");
			JSONArray dBOL = BR.getJSONArray("dailyBoxOfficeList");
			
			HttpSession session = request.getSession();
			ArrayList<MovieVO> movielist = new ArrayList<MovieVO>();
			String movieNm;
			for (int i=0; i<dBOL.length();i++) {
				
				
				session.setAttribute("movie", new MovieVO());
				MovieVO movieVO = (MovieVO)session.getAttribute("movie");
				movieNm = dBOL.getJSONObject(i).getString("movieNm");
				
			
				
				// 무비 네임 기반 검색..... (썸네일 및 정보 가져오기)
				String naverRes = NaverAPI.getUrl(movieNm);
				
				// Naver API JSON parsing
				JSONObject jobj1 = new JSONObject(naverRes);
				JSONArray items = jobj1.getJSONArray("items");
				
				
				// movieVO setting (Naver의 경우 영화진흥원의 결과중 가장 첫번째 결과에서 뽑음)
				movieVO.setMovieNM(movieNm);
				movieVO.setRank(dBOL.getJSONObject(i).getInt("rank"));
				// 여기부터 Naver API 결과		
				movieVO.setPubDate(items.getJSONObject(0).getInt("pubDate"));
				movieVO.setSubtitle(items.getJSONObject(0).getString("subtitle"));
				movieVO.setUserRating(items.getJSONObject(0).getDouble("userRating"));
				movieVO.setDirector(items.getJSONObject(0).getString("director"));
				movieVO.setActor(items.getJSONObject(0).getString("actor"));
				movieVO.setImgUrl(items.getJSONObject(0).getString("image"));
				
				
				
				movielist.add(movieVO);
			}
			
			
			session.setAttribute("movielist", movielist);
			response.setContentType("text/html;charset=utf-8");
						
			
			//request.setAttribute("naverUrl", naverRes);
			request.setAttribute("boxOffUrl", boxOffRes);
			
			String view = "";
			view = "/index.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
			
			
		} catch (JSONException e) {
			e.printStackTrace();
		}	
		
	}

	//  Post요청 (무시해도 됌 AJAX용임)
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");	

		String movieNm;
		ArrayList<String> boxOfficeDaily = new ArrayList<String>( );
		
		// Ajax 리스트 받는법을 모르겠어서 일단 이렇게 해결
		for (int i =0; i<10; i++) {
			movieNm = req.getParameter("boxOfficeDaily"+i);
			boxOfficeDaily.add(movieNm);
		}
		
		PrintWriter out = resp.getWriter();
		
		out.print("<h2>박스오피스 리스트 : "+boxOfficeDaily + "</h2>");
		out.print("<p> Post 성공 </p>");	

		
	}
	
	

}
