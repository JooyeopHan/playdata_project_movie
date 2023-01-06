package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	
	// 메인페이지의 이미지링크로 부터 요청을 받을애들, 요청될 시 해당하는 후기 게시판 렌더링
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String movie = request.getParameter("movie");
		String cnt = request.getParameter("cnt");
		String action = request.getParameter("action");
		
		if (action.equals("select")) {
			ArrayList<CommentVO> list = dao.select(movie);
			String view = "";
			
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
		
		else if (action.equals("delete")) {
			boolean result = dao.delete(Integer.parseInt(cnt));
			if (result) {
				request.setAttribute("msg", "글이 성공적으로 삭제되었습니다.");
			} else {
				request.setAttribute("msg", "글이 삭제되지 않았습니다.");
			}		
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String name = request.getParameter("name");
		String comment = request.getParameter("comment");
		String cnt = request.getParameter("cnt");
		 
		CommentDAO dao = new CommentDAO();
		CommentVO vo = new CommentVO();
		vo.setNickname(name);
		vo.setContent(comment);
		vo.setCnt(Integer.parseInt(cnt));

		
		if (action.equals("update")) {
			boolean result = dao.update(vo);
			if (result) {			
				request.setAttribute("msg", name + "님의 글이 성공적으로 입력되었습니다.");			
			} else {
				request.setAttribute("msg", name + "님의 글이 입력되지 않았습니다.");
			}		
		}
		
	}
			
}
