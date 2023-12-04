<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href =userLogin.jsp'");
		script.println("</script>");
		script.close();	
		return;
	}
	
	String lectureName = null;
	String professorName= null;
	String lectureYear= null;
	String semesterDivide= null;
	String lectureDivide= null;
	String evaluationTitle= null;
	String evaluationContent= null;
	String totalScore= null;
	String creditScore= null;
	String comfortableScore= null;
	String lectureScore= null;
	
	if(request.getParameter("lectureName") != null) {
		lectureName =  request.getParameter("lectureName").trim();
	}
	if(request.getParameter("professorName") != null) {
		professorName = request.getParameter("professorName").trim();
	}
	if(request.getParameter("lectureYear") != null) {
		lectureYear = request.getParameter("lectureYear").trim();
	}
	if(request.getParameter("semesterDivide") != null) {
		semesterDivide =  request.getParameter("semesterDivide").trim();
	}
	if(request.getParameter("lectureDivide") != null) {
		lectureDivide = request.getParameter("lectureDivide").trim();
	}
	if(request.getParameter("evaluationTitle") != null) {
		evaluationTitle = request.getParameter("evaluationTitle").trim();
	}
	if(request.getParameter("evaluationContent") != null) {
		evaluationContent =  request.getParameter("evaluationContent").trim();
	}
	if(request.getParameter("totalScore") != null) {
		totalScore = request.getParameter("totalScore").trim();
	}
	if(request.getParameter("creditScore") != null) {
		creditScore = request.getParameter("creditScore").trim();
	}
	if(request.getParameter("comfortableScore") != null) {
		comfortableScore =  request.getParameter("comfortableScore").trim();
	}
	if(request.getParameter("lectureScore") != null) {
		lectureScore = request.getParameter("lectureScore").trim();
	}

	if (lectureName.isEmpty() || professorName.isEmpty() || lectureYear.isEmpty() ||
			semesterDivide.isEmpty() || lectureDivide.isEmpty() || evaluationTitle.isEmpty() ||
			evaluationContent.isEmpty() || totalScore.isEmpty() || creditScore.isEmpty() ||
		    totalScore.isEmpty() || lectureScore.isEmpty() ||
		    evaluationTitle.equals("") || evaluationContent.equals("")) {
		    PrintWriter script = response.getWriter();
		    script.println("<script>");
		    script.println("alert('입력이 안 된 사항이 있습니다.');");
		    script.println("history.back();");
		    script.println("</script>");
		    script.close();
		    return;
		}

	
	
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		int result = evaluationDAO.write(new EvaluationDTO(0, userID, lectureName, professorName,
				lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, 
				totalScore, creditScore, comfortableScore, lectureScore, 0));
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의평가 등록에 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
			
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
%>