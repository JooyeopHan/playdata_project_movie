package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.memberDAO;
import model.VO.memberVO;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();
		memberDAO dao = new memberDAO();
		ArrayList<memberVO> truely = dao.search(id,pwd);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(truely.size() == 0) {
			writer.println("<script>alert('로그인에 실패하였습니다');history.go(-1); </script>"); 
			writer.close();
		}else {
			session.setAttribute("mem", truely.get(0));
			writer.println("<script>alert('로그인에 성공하였습니다');location.href='http://localhost:8088/reprotype/log'; </script>"); 
			writer.close();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String logout = request.getParameter("action");
		HttpSession session = request.getSession();
		if(logout.equals("logout")) {
			session.removeAttribute("mem");
		}
		response.sendRedirect("/reprotype/log");
	}

}
