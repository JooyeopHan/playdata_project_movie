package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.vo.CommentVO;

public class CommentDAO {
	
	public ArrayList<CommentVO> select(String movie) {
		Connection conn = ConnectDB.connect();
		
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<CommentVO> list = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM COMM WHERE moviename = '" + movie + "'");
			
			list = new ArrayList<CommentVO>();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				
				System.out.println(rs.getString(1));
								
				vo.setNickname(rs.getString(1));
				vo.setPrehour(rs.getDate(2));
				vo.setContent(rs.getString(3));
				vo.setMoviename(rs.getString(4));
				vo.setLike(rs.getInt(5));
				vo.setCnt(rs.getInt(6));
				list.add(vo);
				System.out.println(list);
			}			
		} catch (SQLException e) {			
			System.out.println("오류 발생 : " + e);
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(stmt != null)
					stmt.close();
				if(conn != null)
					conn.close();
			} catch (Exception e) {		
				System.out.println("오류 발생 : " + e);
			}
		}
		return list;
	}

}
