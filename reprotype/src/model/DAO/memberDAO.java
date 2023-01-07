package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			pstmt = conn.prepareStatement("SELECT date_format(curdate, '%Y년 %m월 %d일') AS curdate,nickname,grade FROM member WHERE name= ? and password = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			System.out.println("13");
			while(rs.next()){		
				System.out.println("12");
				vo = new memberVO();
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
}
