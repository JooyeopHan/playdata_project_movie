package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

import connectDB.ConnectDB;
import model.VO.CommentVO;

import model.VO.MovieVO;

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
				
				
								
				vo.setNickname(rs.getString(1));
				vo.setPrehour(rs.getDate(2));
				vo.setContent(rs.getString(3));
				vo.setMoviename(rs.getString(4));
				vo.setLike(rs.getInt(5));
				vo.setCnt(rs.getInt(6));
				list.add(vo);
				
				System.out.println(rs.getString(3));

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
	
	public boolean update(CommentVO vo) {
		Connection conn = ConnectDB.connect();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"update comm set " +  
					"cont = ?, " + 
					"prehour= ?" +
					"where cnt = ?"); 
			
			
			Date today = new Date ();
			System.out.println(today);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String targetDay = sdf.format(today);
			System.out.println("포맷 후 :" + targetDay);
			
			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, targetDay);
			pstmt.setInt(3, vo.getCnt());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.err.println("comment insert 과정에서 오류 발생 " + e);
			return false;
		} finally {
			close(pstmt, null, conn);
		}
	}
		
		
	public boolean delete(int cnt) {
		Connection conn = ConnectDB.connect();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("DELETE FROM comm WHERE cnt = " + cnt);

			if (pstmt.executeUpdate() != 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			System.err.println("delete 과정에서 오류 발생 " + e);
			return false;
		} finally {
			close(pstmt, null, conn);
		}
	}
	
		
	private void close(Statement s, ResultSet r, Connection conn) {
		try {
			if (r != null)
				r.close();
			if (s != null)
				s.close();
			ConnectDB.close(conn);
		} catch (SQLException e) {
			System.err.println("객체 close 과정에서 문제 발생" + e);
		}
	}
		
	
}
	
	
