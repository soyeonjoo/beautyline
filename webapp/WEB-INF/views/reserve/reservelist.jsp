<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>예 약 관 리</title>

<!-- Custom CSS -->
<link rel="stylesheet"href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<link href="/beautyline/beautyline/css/reserve.css" rel="stylesheet">
<link rel="stylesheet" href="http://www.prepbootstrap.com/Content/css/loadingbuttoneffects/local.css" />

<link href="/beautyline/bootstrap/css/business-casual.css"rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
<!-- Modal jquery -->
<link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
<link rel="stylesheet" href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen" title="no title" >
 <link rel="stylesheet" href="/beautyline/bootstrap/css/style.css" media="screen" title="no title" >


<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<!-- jquery  -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 

</head>
<style type="text/css">
.ui-datepicker {
	margin: auto;
	width: auto;
}
.ui-state-default {
	height : 20px;
}

#user-name{
	font-weight : bold;
}
</style>


<jsp:useBean id="now" class="java.util.Date" />

<body>

<c:import url="/WEB-INF/views/include/header.jsp" />
<div class="container">
	<div class="row">
		<div class="box">
<c:choose>
<c:when test="${not empty sessionScope.authUser && authUser.isAdmin eq 'a'}">
			<div class="col-lg-12">
				<hr>
				<h2 class="intro-text text-center">
				<strong>Reserve List</strong><br>예약관리
				</h2>
				<hr>
			</div>

			<fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일" var="today" />
			
			
		<div class="col-lg-12">
	         <table class="table table-hover table-responsive">                   
						<thead>
							<tr class="danger">
								<th>#</th>
								<th>이름</th>
								<th>예약 프로그램</th>
								<th>예약일</th>
								<th>예약 시간</th>
								<th>예약취소</th>
							</tr>
						</thead>


						
							<c:set var="doneLoop" value="false" />
							
							<!-- for(i=보고있는 페이지의 시작번호; i<(시작번호+한페이지의 게시물수); i++ ){ -->
							<c:forEach begin="${page.beginPerPage }" 
							end="${page.beginPerPage + page.numPerPage -1}" 
							var="i" varStatus="status">
						 	
							<!-- doneLoop가 false이면 루프 계속 돎-->
							<c:if test="${not doneLoop }">
						<tbody>
	
							<tr>
								<!-- (전체 게시물 갯수-(전체회원수-1))>=1이면 -->
								<c:if test="${(page.totalRecord -status.index)>=1}">
								<td>${page.totalRecord - status.index}</td>
								<td><a id=user-name href="/beautyline/userinfo/userhistory?no=${resList[i].userNo }">${resList[i].userName }</a></td>
								<td>${resList[i].progName }</td>
								<td>${resList[i].resDate }</td>
								<td>${resList[i].resTime }시- ${resList[i].resTime + 1 }시</td>
								<td>
									<input type="hidden" name="no" value="${resList[i].no }" />
									<a class="btn btn-default btn-xs delete-reserve" 
										data-target="#modalDeleteReserve" type="button"
										data-toggle="modal" data-backdrop="static" role="button"
										data-no="${resList[i].no}">취소</a>
								</td>
								</c:if>
							</tr>
								<!-- 회원수가 토탈 게시물보다 많아지면 루프가 True가 되어 빠져나옴 -->
								<c:if test="${i+1 == page.totalRecord} ">
								<c:set var="doneLoop" value="true" />
							</c:if>
						</c:if>
						
						</c:forEach> 
					</tbody>
				</table>
				
				<div class="col-lg-12 text-right">	
					<a class="btn btn-danger" type="button" href="javascript:history.go(-1);" >돌아가기</a>
					
					<form id="adminReserve" action="reservePastList" method="POST">
					<input type="hidden" value="${today }" name="today">
					<input class="btn btn-default" type="submit" value="지난 예약관리">
					</form>
				</div>

<!-------------Paging--------------->
	<c:import url="/WEB-INF/views/include/paging.jsp" />
    	 <!-- 이전 페이지 -->
			<form id="blockmoveb" name="blockmoveb" method="POST" action="reservelist">
				<input type="hidden" name="nowBlock" value="${page.nowBlock-1 }" />
				<input type="hidden" name="nowPage" value="${(page.nowBlock-1)*page.pagePerBlock}" />
				<input type="hidden" name="keyField" value="${keyField }" />
				<input type="hidden" name="keyWord" value="${keyWord }" />
				<input type="hidden" name="today" value="${today }" />
			</form>
		<!-- 페이지블록 -->
			<form id="pagemove" name="pagemove" method="POST" action="reservelist">
				<input type="hidden" name="nowBlock" value="${page.nowBlock}" />
				<input id="now-page" type="hidden" name="nowPage" value="${page.nowBlock*page.pagePerBlock}" />
				<input type="hidden" name="keyField" value="${keyField }" />
				<input type="hidden" name="keyWord" value="${keyWord }" />
				<input type="hidden" name="today" value="${today }" />
			</form>

		<!-- 다음 페이지 -->
			<form id="blockmovef" name="blockmovef" method="POST" action="reservelist">
				<input type="hidden" name="nowBlock" value="${page.nowBlock+1 }" />
				<input type="hidden" name="nowPage" value="${(page.nowBlock+1)*page.pagePerBlock}" />
				<input type="hidden" name="keyField" value="${keyField }" />
				<input type="hidden" name="keyWord" value="${keyWord }" />
				<input type="hidden" name="today" value="${today }" />
		
			</form>
	 	
			</div>
			
			
<!-- 검색 -->
	    <div class="col-lg-12">
			<form id="search_form" name="search" action="reservelist" method="post">
				<div class="col-lg-3"></div>
				<div class="col-lg-2">
					<select class="form-control input-sm" name="keyField" size="1">
						<option value="">선택 </option>
						<option value="selName" <c:if test="${'selName'==keyField }"> selected</c:if>>회원이름</option>
						<option value="selDate" <c:if test="${'selDate'==keyField }"> selected</c:if>>날짜</option>
						<option value="selPro" <c:if test="${'selPro'==keyField }"> selected</c:if>>프로그램</option>
					</select>
					</div>
					<label>
					<input id="datepicker1" type="text"  class="form-control input-sm" name="keyWord" value="${keyWord }">
					
					</label>
					
					<label> 
					<input  class="btn btn-warning btn-sm" type="button" value="검색" onClick="check()">
					</label> 
					
					<input type="hidden" name="page" value="0">
			</form>
		</div>
			
			</c:when>
			<c:otherwise>
				<div class="col-lg-12 text-center">
					<hr>
					<h2 class="intro-text text-center">
					<strong>관리자 페이지</strong><br>관리자 페이지 입니다.
					</h2>
					<hr>
					
					<a href="/beautyline/main" type="button" class="btn-primary btn-lg">메인으로</a>
				</div>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>

<!-- 예약삭제 Modal -->
	<div class="modal fade" id="modalDeleteReserve" role="dialog"
		tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<!-- modal content -->
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title text-center">
						<strong>예약취소</strong>
					</h4>
				</div>

				<!-- body -->
				<div class="modal-body text-center">
					<h4>예약을 취소 하시겠습니까?</h4>
				</div>

				<!-- Footer -->
				<div class="modal-footer">
					<button class="btn btn-primary" id="resDelOk">예</button>
					<button class="btn btn-default" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>



	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
<script>

$(".delete-reserve").on("click", function() {
		var no = $(this).data("no");
		$("#resDelOk").on("click", function() {
			console.log(no);
		
			$.ajax({
				url : "reservedelete",
				type : "POST",
				data : {"no" : no},
				success : function(result) {
					
				
					if (result > 0) {
						location.href = "reservelist";
					} else {
						alert("유효하지 않은 정보입니다.");
					}
				}
			});
		});
});

$(document).on("change","select[name=keyField]",function(){
	var test = $("select[name=keyField] option:selected").val();
		if( test == "selDate"){
		
			console.log("00");
		$("#datepicker1").datepicker({
			showOtherMonths: true,
			monthNames: ['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월' ],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			dateFormat: 'yy-mm-dd',
			minDate: '-0d',
			onSelect: function(dateText, datePicker) { 
		         var sDate = new Date(dateText); 
		         var dd = sDate.getDate(); 
		         var mm = sDate.getMonth()+1; 
		         if(mm<10) mm = "0" + mm; 
		         if(dd <10) dd = "0" + dd;
		         $("#datepicker1").val(sDate.getFullYear() +"년 "+mm+"월 "+dd+"일 ");      
		         
		      }
			});
	}else{
		$( "#datepicker1").val('');
		$( "#datepicker1" ).datepicker( "destroy" );  
	
	}
});

function check() {
	if (document.search.keyWord.value == "") {
		alert("검색어를 입력하세요.");
		document.search.keyWord.focus();
		return;
	}
		document.search.submit();
	}
</script>
</html>