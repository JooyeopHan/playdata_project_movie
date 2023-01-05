package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import api.NaverAPI;
import api.RankingAPI;

@WebServlet("/naverAPI")
public class NaverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	// search/NaverAPI.html 에서 보낸 Get요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String boxOffRes = RankingAPI.getUrl();
		
		try {
			
			// 박스 오피스 JSON Parsing
			JSONObject jobj2 = new JSONObject(boxOffRes);
			JSONObject BR = jobj2.getJSONObject("boxOfficeResult");
			JSONArray dBOL = BR.getJSONArray("dailyBoxOfficeList");
			
/*			System.out.println("BR  :" + BR);
			System.out.println("dBOL  :" + dBOL);
			*/
			
			HttpSession session = request.getSession();
			ArrayList<MovieVO> MovieList = new ArrayList();
			for (int i=0; i<dBOL.length();i++) {
				// System.out.println(dBOL.getJSONObject(i).get("rank"));
				System.out.println(dBOL.getJSONObject(i).get("movieNm"));
				
				
				session.setAttribute("movie", new MovieVO());
				MovieVO movieInfo = (MovieVO)session.getAttribute("movie");
				
				movieInfo.setMovieNM(dBOL.getJSONObject(i).getString("movieNm"));
				// 무비 네임 기반 검색..... (썸네일 및 정보 가져오기)
				String naverRes = NaverAPI.getUrl(dBOL.getJSONObject(i).getString("movieNm"));
				
				// Naver API JSON parsing
				JSONObject jobj1 = new JSONObject(naverRes);
				JSONArray items = jobj1.getJSONArray("items");
				

				System.out.println("items  :" + items);
				System.out.println("imageUrl" + items.getJSONObject(0).get("image"));
				
				
				MovieList.add(movieInfo);
			}
			
			System.out.println("영화 리스트 : "+ MovieList);
			System.out.println("영화 제목 : "+ MovieList.get(0).getMovieNM());
			System.out.println("영화 제목 : "+ MovieList.get(3).getMovieNM());
			
//			if(session.getAttribute("movie"+i) == null) {
//				session.setAttribute("movie"+i, new MovieVO());
//			}
//			MovieVO movieInfo = (MovieVO)session.getAttribute("movie");
//			
//			movieInfo.setMovieNM("영화이름");
//			movieInfo.setDirector("감독");
//			movieInfo.setSubtitle("부제");
			response.setContentType("text/html;charset=utf-8");
						
			
			//request.setAttribute("naverUrl", naverRes);
			request.setAttribute("boxOffUrl", boxOffRes);
			
			
//			PrintWriter out = response.getWriter();	
//			out.print("<p>"+request.getAttribute("jsonUrl")+"</p>");
//			out.print("<p>"+naverRes+"</p>");
//			out.print("<img src = https://ssl.pstatic.net/imgmovie/mdi/mit110/1221/122101_P00_110037.jpg>");
			
			String view = "";
			view = "/etc/jsontest.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
			
			
		} catch (JSONException e) {
			e.printStackTrace();
		}	
		
	}

	// index.html에서 보낸 Post요청
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
