package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import model.DAO.memberDAO;


@WebServlet("/mem_del")
public class mem_del extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nick = request.getParameter("nickname");
		System.out.println(nick);
		memberDAO dao = new memberDAO();
		HttpSession session = request.getSession();
		boolean result;
		try {
			result = dao.delete(nick);
			response.setContentType("text/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			HashMap<String, Boolean> hm = new HashMap<>();
			if (result)
				{hm.put("result", true);
				session.removeAttribute("mem");
				}
			else
				hm.put("result", false);				
			JSONObject obj = new JSONObject(hm);				
			out.print(obj.toJSONString());
			out.close();
			return;	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
