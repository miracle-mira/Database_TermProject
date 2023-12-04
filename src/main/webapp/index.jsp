<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>영양제 리뷰 웹 사이트</title>
    <!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>


<body>
<%
 	request.setCharacterEncoding("UTF-8");
	String lectureDivide = "전체";
	String searchType = "최신순";
	String search = "";
	int pageNumber = 0;
	if(request.getParameter("lectureDivide") != null) {
		lectureDivide = request.getParameter("lectureDivide");
	}
	if(request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null) {
		try {
	        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	    } catch (Exception e) {
	        out.println("검색 페이지 번호 오류");
	    }
	}
	
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();	
		return;
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.jsp">영양제 리뷰 웹 사이트</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">메인</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원 관리</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown">
                    
<%
	if(userID == null) {
%>
                        <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                        <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
<%
	} else {
%>
                        <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
<%
	}
%>
                        
                        
                    </div>
                </li>
            </ul>
            <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
                <input type="text" name="search" class="form-control mr-sm-2" placeholder="내용을 입력하세요.">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
            </form>
        </div>
	</nav>
	    
	    
	    
	    <div class="container">
      <form method="get" action="./index.jsp" class="form-inline mt-3">
        <select name="lectureDivide" class="form-control mx-1 mt-2">
          <option value="전체">전체</option>
          <option value="3개월 미만" <%if(lectureDivide.equals("3개월 미만")) out.println("selected");%>>3개월 미만</option>
          <option value="4~12개월" <%if(lectureDivide.equals("4~12개월")) out.println("selected");%>>4~12개월</option>
          <option value="1년 이상" <%if(lectureDivide.equals("1년 이상")) out.println("selected");%>>1년 이상</option>
        </select>
        <select name="searchType" class="form-control mx-1 mt-2">
          <option value="최신순">최신순</option>
          <option value="추천순" <%if(searchType.equals("추천순")) out.println("selected");%>>추천순</option>
        </select>
        <input type="text" name="search" class="form-control mx-1 mt-2" value="<%= search %>" placeholder="내용을 입력하세요.">
        <button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
        <a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
      </form>


<%
	ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
	evaluationList = new EvaluationDAO().getList(lectureDivide, searchType, search, pageNumber);
	if(evaluationList != null)
		for (int i = 0; i < evaluationList.size(); i++) {
		    if (i == 5) break;
		    EvaluationDTO evaluation = evaluationList.get(i);
%>
<div class="card bg-light mt-3">
    <div class="card-header bg-light">
        <div class="row">
            <div class="col-md-8 text-left">
                <%=evaluation.getLectureName()%>&nbsp;<small><%=evaluation.getProfessorName()%></small>
            </div>
            <div class="col-md-4 text-right">
                종합 <span style="color: red;"><%=evaluation.getTotalScore()%></span>
            </div>
        </div>
    </div>
    <div class="card-body">
        <h5 class="card-title">
            <%=evaluation.getEvaluationTitle()%>&nbsp;<small>(<%=evaluation.getLectureYear()%> <%=evaluation.getSemesterDivide()%>)</small>
        </h5>
        <p class="card-text"><%=evaluation.getEvaluationContent()%></p>
        <div class="row">
            <div class="col-md-9 text-left">
                추천 <span style="color: red;"><%=evaluation.getCreditScore()%></span>
                효과 <span style="color: red;"><%=evaluation.getComfortableScore()%></span>
                재구매 의사 <span style="color: red;"><%=evaluation.getLectureScore()%></span>
                <span style="color: green;">(추천: <%=evaluation.getLikeCount()%>)</span>
            </div>
            <div class="col-md-3 text-right">
                <a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=<%=evaluation.getEvaluationID()%>">추천</a>
                <a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=<%=evaluation.getEvaluationID()%>">삭제</a>
            </div>
        </div>
    </div>
</div>
<%
}
%>
    </div>




    <ul class="pagination justify-content-center mt-3">
      <li class="page-item">
<%
	if(pageNumber <= 0) {
%>     
        <a class="page-link disabled">이전</a>
<%
	} else {
%>
		<a class="page-link" href="./index.jsp?lectureDivide=<%=URLEncoder.encode(lectureDivide, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber - 1%>">이전</a>
<%
	}
%>
      </li>
      <li class="page-item">
<% 
    if (evaluationList == null) {
        evaluationList = new ArrayList<EvaluationDTO>();
    }
    if(evaluationList.size() < 6) {
        // 추가 데이터를 생성하여 크기를 6 이상으로 만듦
        for (int i = 0; i < 6 - evaluationList.size(); i++) {
            evaluationList.add(new EvaluationDTO());
        }
%>   
        <a class="page-link disabled">다음</a>
<%
	} else {
%>
		<a class="page-link" href="./index.jsp?lectureDivide=<%=URLEncoder.encode(lectureDivide, "UTF-8")%>&searchType=<%=URLEncoder.encode(searchType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%=pageNumber + 1%>">다음</a>
<%
	}
%>
      </li>
	</ul>
	
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
    			 	<h5 class="modal-title" id="modal">리뷰 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					 <span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post"">
			 	 		<div class="form-row">
			 	 			 <div class="form-group col-sm-6">
								<label>영양제 이름</label>
								 <input type="text" name="lectureName" class="form-control" maxlength="20">
			 	 			 </div>
			 	 	
			 	 			 <div class="form-group col-sm-6">
			 	 			 	<label>제약사</label>
			 	 			 	<input type="text" name="professorName" class="form-control" maxlength="20"> 
			 	 			 </div>
			 	 		</div>
			 	 		 <div class="form-row">
			 	 		 
			 	 		 	<div class="form-group col-sm-4">
			 	 		 		<label>영양제 종류</label>
			 	 		 		  <select name="lectureYear" class="form-control">
				 	 		 		<option value="비타민">비타민</option>
				 	 		 		<option value="아미노산">아미노산</option>
				 	 		 		<option value="철분">철분</option>
				 	 		 		<option value="오메가">오메가</option>
				 	 		 		<option value="칼슘">칼슘</option>
				 	 		 		<option value="프로바이오틱스">프로바이오틱스</option>
				 	 		 		<option value="마그네슘">마그네슘</option>
				 	 		 		<option value="글루코사민">글루코사민</option>
				 	 		 		<option value="콜라겐">콜라겐</option>
				 	 		 		<option value="아연">아연</option>
				 	 		 		<option value="글루타치온">글루타치온</option>
				 	 		 		<option value="아르기닌">아르기닌</option>
									<option value="단백질">단백질</option>
			 	 		 		</select>
			 	 		 	</div>
			 	 		 	
			 	 		 	<div class="form-group col-sm-4">
			 	 		 		 <label>구매 경험</label>
			 	 		 		  <select name="semesterDivide" class="form-control">
                    			  	<option value="처음" selected>첫 구매</option>
                    			  	<option value="1~3번">1~3번</option>
                    			  	<option value="3~5번">3~5번</option>
                    			  	<option value="5번 이상">5번 이상</option>
                    			  </select>
			 	 		 	</div>
			 	 		 	
			 	 		 	<div class="form-group col-sm-4">
			 	 		 	<label>복약 기간</label>
			 	 		 		  <select name="lectureDivide" class="form-control">
				                    <option value="3개월 미만"selected>3개월 미만</option>
				                    <option value="4~12개월">4~12개월</option>
				                    <option value="1년 이상">1년 이상</option>
			 	 		 		  </select>
			 	 		 	</div>
			 	 		 </div>
			 	 		 <div class="form-group">
			 	 		 	<label>제목</label>
			 	 		 	<input type="text" name="evaluationTitle" class="form-control" maxlength="30">
			 	 		 </div>
			 	 		 <div class="form-group">
			 	 			 <label>내용</label>
			 	 			  <textarea name="evaluationContent" class="form-control" maxlength="2048" style="height:180px;"></textarea> 
			 	 		 </div>
			 	 		 <div class="form-row">
			 	 		 
			 	 		 <div class="form-group col-sm-3">
			 	 		  	  <label>종합</label>
				 	 		  <select name="totalScore" class="form-control">
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.5</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.5</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.5</option>
			                    <option value="2.0">2.0</option>
			                    <option value="1.5">1.5</option>
			                    <option value="1.0">1.0</option>
				 	 		  </select>
			 	 		  </div>
			 	 		   <div class="form-group col-sm-3">
				 	 		  <label>추천</label>
				 	 		  <select name="creditScore" class="form-control">
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.5</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.5</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.5</option>
			                    <option value="2.0">2.0</option>
			                    <option value="1.5">1.5</option>
			                    <option value="1.0">1.0</option>
				 	 		  </select>
			 	 		   </div>
			 	 		   
			 	 		   <div class="form-group col-sm-3">
				 	 		  <label>효과</label>
				 	 		  <select name="comfortableScore" class="form-control">
					 	 		    <option value="5.0점" selected>5.0점</option>
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.5</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.5</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.5</option>
			                    <option value="2.0">2.0</option>
			                    <option value="1.5">1.5</option>
			                    <option value="1.0">1.0</option>
				 	 		  </select>
			 	 		   </div>
			 	 		   <div class="form-group col-sm-3">
				 	 		  <label>재구매 의사</label>
				 	 		  <select name="lectureScore" class="form-control">
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.5</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.5</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.5</option>
			                    <option value="2.0">2.0</option>
			                    <option value="1.5">1.5</option>
			                    <option value="1.0">1.0</option>
				 	 		  </select>
			 	 		   </div>
			 	 		   
			 	 		    <div class="modal-footer">
			 	 		    	 <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								 <button type="submit" class="btn btn-primary">등록하기</button>
			 	 		    </div>
			 	 		 </div>
			 	 	</form>
			 	 </div>
			 </div>
		</div>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright ⓒ 2023 박미라 All Rights Reserved.
	</footer>
	<!-- jQuery 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- Pooper 자바스크립트 추가하기 -->
	<script src="./js/pooper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	
	

	
</body>
</html>