package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.memberDAO;

@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String gender =  request.getParameter("gender");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		memberDAO dao = new memberDAO();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		boolean result = dao.insert(id, pwd, nickname,name,gender,email);
		if(result) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('회원가입에 성공하였습니다'); location.href='http://localhost:8088/reprotype/log';</script>"); 
			writer.close();
		}else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('회원가입에 실패하였습니다');location.href='http://localhost:8088/reprotype/sign-up.jsp'; </script>"); 
			writer.close();
		}
		
		
	}

}
