<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>

<title>modifyform</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

  <!-- Bootstrap Core CSS -->

	<!-- Custom CSS -->
	<link href="/beautyline/bootstrap/css/business-casual.css" rel="stylesheet">
   <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
   <link href="/beautyline/beautyline/css/include.css" rel="stylesheet">
   <!-- font awesome -->
    <link rel="stylesheet" href="/beautyline/bootstrap/css/font-awesome.min.css" media="screen" title="no title" >
    <!-- Custom style -->
    <link rel="stylesheet" href="/beautyline/bootstrap/css/style.css" media="screen" title="no title" >
	
  <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/beautyline/bootstrap/js/jquery.js"></script>
<style type="text/css">
.col-lg-3, .col-lg-2 {
	padding-right: 0px;
}
#btn {
	padding-left: 0px;
}
#dat_div{
	
	padding-right: 0px;
	width:10px;
}

input.onlyHangul{
	ime-mode:active;
}
</style>
<script>
	
</script>




</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container">
		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<div class="page-header">
						<hr>
						<h1 class="text-center text-center">
							<strong>관리자정보 수정</strong>
						</h1>
						<hr>
					</div>



					<!-- ////////////////////////회원정보 수정 폼시작///////////////////////////////////// -->
					<div class="form-horizontal" id="modify-form" >

						<!-- 이름 -->
						<div class="form-group" id="divName">
							<label class="col-lg-3 control-label" for="inputName">이름</label>
							<div class="col-lg-3">
								 <input class="form-control onlyHangul" id="inputName" type="text" value="${userVo.name }">
							</div>
						</div>
						<br>

						<!-- 아이디 -->
						<div class="form-group" id="divId">
							<label class="col-lg-3 control-label" for="inputId">아이디</label>
							<div class="col-lg-3">
								<input class="form-control  onlyAlphabetAndNumber" id="inputId" type="text" value="${userVo.id }" readonly>
							</div>
						</div>
						<br>

						<!-- 비밀번호 -->
						<div class="form-group" id="divPassword">
							<label class="col-lg-3 control-label" for="inputPassword">비밀번호</label>
							<div class="col-lg-3">
								<input class="form-control" id="inputPassword" name="password" type="password" value="${userVo.password }" >
							</div>
							<div class="col-lg-3">
								<h6 class="help-block" id="checkPw">특수문자,영문,숫자를 혼합하여 6~20자 이내</h6>
							</div>
						</div>

						<!-- 비밀번호확인 -->
						<div class="form-group" id="divPasswordCheck">
							<label class="col-lg-3 control-label" for="inputPasswordCheck">비밀번호
								확인</label>
							<div class="col-lg-3">
								<input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" value="${userVo.password }">
							</div>
							<div class="col-lg-3">
								<h6 class="help-block" id="oneMore">비밀번호를 한번 더 입력해주세요.</h6>
							</div>
						</div>
						<br>

						<!-- 휴대폰 번호 -->
						<div class="form-group" id="divNumber">
							<label class="col-lg-3 control-label" for="inputNumber">휴대폰번호*</label>
							<div class="col-lg-3">
								<input type="text" class="form-control onlyNumber" name="phone" id="inputNumber" placeholder="- 없이 입력해 주세요"  value="${userVo.phone }"/>
							</div>
							<div class="col-lg-2" id="btn" >
								<button class="btn btn-success" type="button">
									인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
								</button>
							</div>
						</div>
						<br>
						
						
						<div class="form-group">
							<div class="col-lg-12 text-center">
								<button class="btn btn-primary" id="modi" >수정하기<i class="fa fa-check spaceLeft"></i></button>
								<a class="btn btn-danger" href="javascript:history.go(-1);">취소<i class="fa fa-times spaceLeft"></i></a>
							</div>
						</div>
					</div>
					<hr>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>



<script>
	$(function() {
		//모달을 전역변수로 선언
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");
		$('.onlyAlphabetAndNumber').keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
			}
		});
		$(".onlyHangul").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
			}
		});
		$(".onlyNumber").keyup(function(event) {
	         if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
	            var inputVal = $(this).val();
	            inputVal = inputVal.replace(/[^0-9]/g, '');
	            var tmp = '';
	            
	            if( inputVal.length < 4){
	               return $(this).val(inputVal);
	            }else if(inputVal.length < 7){
	               tmp += inputVal.substr(0, 3);
	               tmp += '-';
	               tmp += inputVal.substr(3);
	               return $(this).val(tmp);
	            }else if(inputVal.length < 11){
	               tmp += inputVal.substr(0, 3);
	               tmp += '-';
	               tmp += inputVal.substr(3, 3);
	               tmp += '-';
	               tmp += inputVal.substr(6);
	               return $(this).val(tmp);
	            }else{            
	               tmp += inputVal.substr(0, 3);
	               tmp += '-';
	               tmp += inputVal.substr(3, 4);
	               tmp += '-';
	               tmp += inputVal.substr(7);
	               return $(this).val(tmp);
	            }
	         }
	         
	      });
		//------- 검사하여 상태를 class에 적용
		$('#inputName').keyup(function(event) {
			var divId = $('#divName');
			if ($('#inputName').val() == "") {
				divId.removeClass("has-success");
				divId.addClass("has-error");
			} else {
				divId.removeClass("has-error");
				divId.addClass("has-success");
			}
		});
		$('#inputId').keyup(function(event) {
			var divId = $('#divId');
			if ($('#inputId').val() == "") {
				divId.removeClass("has-success");
				divId.addClass("has-error");
			} else {
				divId.removeClass("has-error");
				divId.addClass("has-success");
			}
		});
		$('#inputPassword').keyup(function(event) {
			var password = $('#inputPassword').val();
			var passwordCheck = $('#inputPasswordCheck').val();
			var divPasswordCheck = $('#divPasswordCheck');
			var divPassword = $('#divPassword');
			if (password == "" || (CehckPassWord(password) == false)) {
				divPassword.removeClass("has-success");
				divPassword.addClass("has-error");
				$("#checkPw").html("비밀번호는 특수문자, 영문,숫자를 혼합하여 6~20자리로 입력해주세요.");
			} else {
				divPassword.removeClass("has-error");
				divPassword.addClass("has-success");
				$("#checkPw").html("사용 가능합니다.");
			}
			if (password != passwordCheck) {
				divPasswordCheck.removeClass("has-success");
				divPasswordCheck.addClass("has-error");
				$("#oneMore").html("일치 하지 않습니다.")
			} else {
				divPasswordCheck.removeClass("has-error");
				divPasswordCheck.addClass("has-success");
				$("#oneMore").html("일치 합니다.")
			}
		});
		$('#inputPasswordCheck').keyup(function(event) {
			var passwordCheck = $('#inputPasswordCheck').val();
			var password = $('#inputPassword').val();
			var divPasswordCheck = $('#divPasswordCheck');
			if ((passwordCheck == "") || (password != passwordCheck)) {
				divPasswordCheck.removeClass("has-success");
				divPasswordCheck.addClass("has-error");
				$("#oneMore").html("일치 하지 않습니다.")
			} else {
				divPasswordCheck.removeClass("has-error");
				divPasswordCheck.addClass("has-success");
				$("#oneMore").html("일치 합니다.")
			}
		});
		
		
		$('#inputNumber').keyup(function(event) {
			var divPhoneNumber = $('#divNumber');
			//숫자 검사해야함!
			if ($.trim($('#inputNumber').val()) == "") {
				divPhoneNumber.removeClass("has-success");
				divPhoneNumber.addClass("has-error");
			} else {
				divPhoneNumber.removeClass("has-error");
				divPhoneNumber.addClass("has-success");
			}
		});
		
		
		/* validation 검사 & submit   */
		$("#modi").on("click", function() {
			
			if ($("#inputNumber").val() == "") {
				alert("전화번호를 입력하세요.");
				$("#inputNumber").focus()
				return false;
			}
			
			
			/* 아니라면 아작스 통신으로 데이터 보내기!  */
				var no=${userVo.no };
				var name = $("#inputName").val();
				var password =	$("#inputPassword").val();
				var phone =		$("#inputNumber").val(); 
				//인증번호	
				
				var userVo ={
						"no": no,
						"name": name,
						"password":  password,
						"phone":	 phone
				
						
					};
					$.ajax({// 비동기식 
						url : "modify",
						type : "POST",
						data:JSON.stringify(userVo),
						contentType:"application/json",
						success : function(a) {
							console.log(a);
							
							if (a == 1) {
								alert("관리자정보를 수정하였습니다.");
								window.history.back();
								 //location.href = "/beautyline/userinfo/userhistory?no=${userVo.no }";
								 return true;
							}
							/*  if($("#inputId").val()==null){
							  $("#inputId").val("").focus();
							 } */
							else {
								alert("님은 회원수정안됨 ㅋ");
								return false;
								
							}
						},
						error : function(jqXHR, status, error) {
							console.error(status + ":" + error);
							
						}
					});
			/////////////////////////////////////////////////////////////
		});
		/* id중복체크  */
		$("#inputId").change(function() {
			$("#conCheckId").val('0');
		});
			//승인안됨 
			$("#checkId").on("click", function() {
				var id = $("#inputId").val();
				console.log(id);
				$.ajax({// 비동기식 
					url : "checkId",
					type : "POST",
					data : {
						"id" : id
					},
					dataType : "text",
					success : function(check) {
						console.log(check);
						if (check == "exists") {
							alert("이미 존재하는 아이디 입니다.");
							$("#inputId").val("").focus();
							$("#conCheckId").val('0');
						}
						/*  if($("#inputId").val()==null){
						  $("#inputId").val("").focus();
						 } */
						else {
							alert("사용 가능한 아이디입니다..");
							$("#conCheckId").val('1');
						}
					},
					error : function(jqXHR, status, error) {
						console.error(status + ":" + error);
					}
				});
			});	
	});
	function CehckPassWord(str) { //비밀번호 유효성 검사 
		if (str.length < 6) {
			return false;
		}
		if (!str
				.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
			return false;
		}
		return true;
	}
</script>



</html>