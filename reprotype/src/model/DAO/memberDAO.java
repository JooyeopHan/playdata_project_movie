package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import connectDB.ConnectDB;
import model.VO.memberVO;


public class memberDAO{

	public ArrayList<memberVO> search(String id, String pwd) {
		PreparedStatement pstmt = null;
		Connection conn = ConnectDB.connect();
		memberVO vo = null;
		ResultSet rs = null;
		ArrayList<memberVO> list = new ArrayList<>();
		System.out.println("14");
		try {			
			pstmt = conn.prepareStatement("SELECT date_format(curdate, '%Y년 %m월 %d일') AS curdate,nickname,email,grade FROM member WHERE ident= ? and pwd = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			System.out.println("13");
			while(rs.next()){		
				System.out.println("12");
				vo = new memberVO();
				vo.setEmail(rs.getString("email"));
				vo.setNickname(rs.getString("nickname"));
				vo.setCurdate(rs.getString("curdate"));
				vo.setGrade(rs.getInt("grade"));
				list.add(vo);
			}	
			System.out.println(list);
		} catch (SQLException e) {		
			System.out.println("오류 발생 : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e) {		
				System.out.println("오류 발생 : " + e);
			}
		}
		return list;
	}
	
	public boolean insert(String id, String pwd, String nickname,String name,String gender,String email) {
		PreparedStatement pstmt = null;
		Connection conn = ConnectDB.connect();
		try {
			Date today = new Date ();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String targetDay = sdf.format(today);
			
			pstmt = conn.prepareStatement("INSERT INTO member(ident,pwd,nickname,username,curdate,gender,email,grade) VALUES(?,?,?,?,?,?,?,1)");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, nickname);
			pstmt.setString(4, name);
			pstmt.setString(5, targetDay);
			pstmt.setString(6, gender);
			pstmt.setString(7, email);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			System.err.println("member insert 과정에서 오류 발생 " + e);
			return false;
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e) {		
				System.out.println("오류 발생 : " + e);
			}
		}
	}
	public boolean delete(int cnt) throws SQLException {
		Connection conn = ConnectDB.connect();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		try {
			pstmt = conn.prepareStatement("DELETE FROM comm WHERE nickname = " + cnt);
			pstmt1 = conn.prepareStatement("DELETE FROM member WHERE nickname = " + cnt);
			if (pstmt.executeUpdate() != 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			System.err.println("delete 과정에서 오류 발생 " + e);
			return false;
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(pstmt1 != null)
				pstmt1.close();
		}
	}
}