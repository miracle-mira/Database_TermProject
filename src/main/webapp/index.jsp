<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
                        <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                        <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
                        <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
                    </div>
                </li>
            </ul>
            <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
                <input type="text" name="search" class="form-control mr-sm-2" placeholder="내용을 입력하세요.">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
            </form>
        </div>
	</nav>
	    
	<section class = "container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="영양제">영양제</option>
				<option value="기타">기타</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
				<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
				<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
		</form>
		
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					 <div class="col-8 text-left">센트룸&nbsp;<small>GSK</small></div>
					  <div class="col-4 text-right">
					  	 종합 <span style="color: red;">4.5</span >
					  </div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					비타민으로 좋은 거 같아요.&nbsp;<small>(비타민 처음)</small>
				</h5>
				<p class="card-text">선물받아서 먹어본건데 맛있고 효과도 좋은 거 같아요.</p>
				<div class="row">
				 	<div class="col-9 text-left">
				 		추천 <span style="color: red;">4.5</span>
	              		효과 <span style="color: red;">4.5</span>
	              		재구매 의사 <span style="color: red;">4.5</span>
	              		<span style="color: green;">(추천: 15★)</span>
				 	</div>
				 	<div class="col-3 text-right">
				 	 	<a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=">추천</a>
	              		<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=">삭제</a>
				 	</div>
				 </div>
			</div>
		</div>
	</section>
	
	
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
			 	 		 		  <select name="nutritionalsupplementType" class="form-control">
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
			 	 		 		  <select name="purchasingExperience" class="form-control">
                    			  	<option value="처음" selected>처음</option>
                    			  	<option value="1~3번">1~3번</option>
                    			  	<option value="3~5번">3~5번</option>
                    			  	<option value="5번 이상">5번 이상</option>
                    			  </select>
			 	 		 	</div>
			 	 		 	
			 	 		 	<div class="form-group col-sm-4">
			 	 		 	<label>복약 기간</label>
			 	 		 		  <select name="medicationPeriod" class="form-control">
				                    <option value="3개월 미만"selected>3개월 미만</option>
				                    <option value="4~12개월">4~12개월</option>
				                    <option value="1년이상">1년이상</option>
			 	 		 		  </select>
			 	 		 	</div>
			 	 		 </div>
			 	 		 <div class="form-group">
			 	 		 	<label>제목</label>
			 	 		 	<input type="text" name="ReviewTitle" class="form-control" maxlength="30">
			 	 		 </div>
			 	 		 <div class="form-group">
			 	 			 <label>내용</label>
			 	 			  <textarea type="text" name="ReviewContent" class="form-control" maxlength="2048" style="height:180px;"></textarea> 
			 	 		 </div>
			 	 		 <div class="form-row">
			 	 		 
			 	 		 <div class="form-group col-sm-3">
			 	 		  	  <label>종합</label>
				 	 		  <select name="totalScore" class="form-control">
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.0</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.0</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.0</option>
			                    <option value="2.0">2.0</option>
			                    <option value="1.5">1.5</option>
			                    <option value="1.0">1.0</option>
				 	 		  </select>
			 	 		  </div>
			 	 		  
			 	 		   <div class="form-group col-sm-3">
				 	 		  <label>추천</label>
				 	 		  <select name="recommendationScore" class="form-control">
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.0</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.0</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.0</option>
			                    <option value="2.0">2.0</option>
			                    <option value="1.5">1.5</option>
			                    <option value="1.0">1.0</option>
				 	 		  </select>
			 	 		   </div>
			 	 		   
			 	 		   <div class="form-group col-sm-3">
				 	 		  <label>효과</label>
				 	 		  <select name="effectScore" class="form-control">
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.0</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.0</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.0</option>
			                    <option value="2.0">2.0</option>
			                    <option value="1.5">1.5</option>
			                    <option value="1.0">1.0</option>
				 	 		  </select>
			 	 		   </div>
			 	 		   <div class="form-group col-sm-3">
				 	 		  <label>재구매 의사</label>
				 	 		  <select name="repurchaseScore" class="form-control">
				 	 		    <option value="5.0" selected>5.0</option>
				 	 		  	<option value="4.5">4.0</option>
			                    <option value="4.0">4.0</option>
			 					<option value="3.5">3.0</option>
			                    <option value="3.0">3.0</option>
			                    <option value="2.5">2.0</option>
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