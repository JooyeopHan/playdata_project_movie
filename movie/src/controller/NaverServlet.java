package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import api.NaverAPI;

@WebServlet("/naverAPI")
public class NaverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String apiRes = NaverAPI.getUrl("아바타");
		
		response.setContentType("text/html;charset=utf-8");
		
		request.setAttribute("jsonUrl", apiRes);
		
		PrintWriter out = response.getWriter();
		
		
		out.print("<p>"+request.getAttribute("jsonUrl")+"</p>");
		out.print("<img src = https://ssl.pstatic.net/imgmovie/mdi/mit110/1221/122101_P00_110037.jpg>");
		
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");	
		
		String myName = req.getParameter("name");
		Object boxOfficeDaily = req.getParameter("boxOfficeDaily");
		
		
		PrintWriter out = resp.getWriter();
		out.print("<h2>"+myName+ "</h2>");
		out.print("<h2>"+boxOfficeDaily + "</h2>");
		
		out.print("<p> Post 성공 </p>");	
		resp.getWriter().print("Hello "+ myName + "!!");
		
	}
	
	

}
