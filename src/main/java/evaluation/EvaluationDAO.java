package evaluation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class EvaluationDAO {

	public int write(EvaluationDTO evaluationDTO) {
	    String SQL = "INSERT INTO EVALUATION VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?,?,0)";
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = DatabaseUtil.getConnection();
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, evaluationDTO.getUserID());
	        pstmt.setString(2, evaluationDTO.getLectureName());
	        pstmt.setString(3, evaluationDTO.getProfessorName());
	        pstmt.setString(4, evaluationDTO.getLectureYear());
	        pstmt.setString(5, evaluationDTO.getSemesterDivide());
	        pstmt.setString(6, evaluationDTO.getLectureDivide());
	        pstmt.setString(7, evaluationDTO.getEvaluationTitle());
	        pstmt.setString(8, evaluationDTO.getEvaluationContent());
	        pstmt.setString(9, evaluationDTO.getTotalScore());
	        pstmt.setString(10, evaluationDTO.getCreditScore());
	        pstmt.setString(11, evaluationDTO.getComfortableScore());
	        pstmt.setString(12, evaluationDTO.getLectureScore());

	        int result = pstmt.executeUpdate();

	        if (result > 0) {
	            // 삽입 성공
	            return result;
	        } else {
	            // 삽입 실패
	            System.err.println("강의평가 삽입 실패");
	            return -1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; // 데이터베이스 오류
	    } finally {
	        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
	        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
	    }
	}

}