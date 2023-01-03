package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CommentDAO;
import model.vo.CommentVO;

@WebServlet("/comment")
public class CommentSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentDAO dao;
	public void init() {
		dao = new CommentDAO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<CommentVO> list = dao.select();
		
		String view = "";
		System.out.println(list);
		if(list.size() != 0) {
			request.setAttribute("commentlist", list);
			view = "comment/commentList.jsp";
		} else {
			request.setAttribute("msg", " Comment 테이블에 저장된 내용이 없습니다.");
			view = "comment/commentResult.jsp";
		}		
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		
		rd.forward(request, response);	
	}
}
