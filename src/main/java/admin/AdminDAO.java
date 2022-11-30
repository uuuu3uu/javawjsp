package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import member.MemberVO;

public class AdminDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();  // GetConn.java의 driver, url, user, password="1234" 이런게 연결된..
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

	// 회원 등급 변경처리
	public void setLevelCheck(int idx, int level) {
		try {
			sql = "update member set level = ? where idx = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		}	finally {
			getConn.pstmtClose();
		}
		
	}	
	
	
}
