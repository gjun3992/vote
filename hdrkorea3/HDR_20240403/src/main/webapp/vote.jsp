<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>




</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


<section>
<h2>투표하기</h2>
<form action="action.jsp" method="post" onsubmit="return check(this);">
<table class="table table-bordered">
	<tr>
		<th>주민번호</th>
		<td><input type="text"  name="M_JUMIN"> 예: 8906153154726</td> 
	</tr>
	<tr>
		<th>성명</th>
		<td><input type="text"  name="M_NAME"></td>
	</tr>
	<tr>
		<th>투표번호</th>
		<td>
		<select class="form-select" aria-label="Default select example"  name="M_NO">
		  <option value="" selected>후보자를 선택하세요</option>
		  <option value="1">1 김후보</option>
		  <option value="2">2 이후보</option>
		  <option value="3">3 박후보</option>
		  <option value="4">4 조후보</option>
		  <option value="5">5 최후보</option>
		</select>

		</td>
	</tr>
	<tr>
		<th>투표시간</th>
		<td><input type="text"  name="V_TIME"></td>
	</tr>
	<tr>
		<th>투표장소</th>
		<th><input type="text" name="V_AREA"></th>
	</tr>
	<tr>
		<th>유권자 확인</th>
		<th>
       <input type="radio" name="V_CONFIRM" value="Y" checked="checked">확인
	   <input type="radio" name="V_CONFIRM" value="N">미확인
       </th>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" class="btn btn-outline-info">투표하기</button>
			<button type="reset" class="btn btn-outline-info">다시하기</button>
		</th>
	</tr>






</table>
</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>


<script type="text/javascript">
	function check(form) {
         
		if (form.M_JUMIN.value == "") {            
			alert("주민번호를  입력해주십시오");            
			f.M_JUMIN.focus();            
			return false;		
		}
		if (form.M_NAME.value == "") {            
			alert("이름을  입력해주십시오");            
			f.M_NAME.focus();            
			return false;		
		}
		if (form.M_NO.value == "") {            
			alert("후보자를 선택해주세요");            
			f.M_NO.focus();            
			return false;		
		}
		if (form.V_TIME.value == "") {            
			alert("투표시간 입력해주십시오");            
			f.V_TIME.focus();            
			return false;		
		}
		
		if (form.V_AREA.value == "") {            
			alert("투표장소  입력해주십시오");            
			f.V_AREA.focus();            
			return false;		
		}
		
		if (form.V_CONFIRM.value == "") {            
			alert("유권자를 확인해주십시오");            
			f.V_CONFIRM.focus();            
			return false;		
		}
		alert("투표정보가 정상적으로 등록되었습니다.")
		return true;
	}




</script>
</body>
</html>