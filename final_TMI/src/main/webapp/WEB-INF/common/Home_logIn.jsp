<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="/tmi/js/home.js" type='text/javascript'></script>
<link href='/tmi/css/homeLogin.css' type='text/css' rel='stylesheet'>
<script src="/tmi/js/COMMON.js" type='text/javascript'></script> 
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet' >

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<!-- 달력 플러그인 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment-with-locales.min.js"></script>
<script src="/tmi/js/lightpick.js"></script>
<link href='/tmi/css/lightpick.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>

<style type="text/css">
.btn {
    color: #fff;
    background: #FF0066;
    padding: .5rem 1rem;
    display: inline-block;
    border-radius: 4px;
    transition-duration: .25s;
    border: none;
    font-size: 14px;
    text-decoration: none;
    font-weight: 700;
}
#pro-form input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#pro-form label{
	display: block;
}

#pro_start, #pro_end{
	width: 49% !important;
}

#pro-form input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

#pro-form input[type=submit]:hover {
  background-color: #45a049;
}

.autocomplete-results {
    position: absolute;
    z-index: 99;
    width: 80%;
    max-height: 20em;
    overflow-y: auto;
    font-size: 13px;
    list-style: none;
    background: #fff;
    border-radius: 3px;
    box-shadow: 0 0 5px rgba(27,31,35,.3);
}

.autocomplete-item {
    display: block;
    padding: 5px;
    overflow: hidden;
    font-weight: 600;
    text-decoration: none;
    text-overflow: ellipsis;
    white-space: nowrap;
    cursor: pointer;
}

.autocomplete-item:hover{
	background-color: #478aff;
	color: white;
}

.table-list {
    display: table;
    width: 100%;
    color: #6a737d;
    table-layout: fixed;
    border-bottom: 1px solid #e1e4e8;
}

.table-list-item {
    position: relative;
    display: table-row;
    list-style: none;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var pro_start =  document.getElementById('pro_start');
	var pro_end = document.getElementById("pro_end");
	const myPicker = new Lightpick({
		field: pro_start,
	    secondField: pro_end,
		singleDate: false,
		onSelect: function(start, end){
			pro_start.value = start.format('YY/MM/DD');
			pro_end.value = end.format('YY/MM/DD');
		}
	});
	
	$('#pro-form #search_id').on({
		focus:function(){
			$('#pro-form #search_result').show();
		},
		blur:function(){
			var chk = false;
			$('#pro-form #search_result').on('focus',function(){
				chk = true;
			})
			
			$('#pro-form #search_result').hide();
		},
		keyup:function(){
			$('#pro-form #search_result').empty();
			var id = $(this).val();
			if(id == null || id == '')
				return;
			$.ajax({
				url:'project/searchId',
				type:'POST',
				data:'id='+id,
				success:function(res){
					$('#pro-form #search_result').empty();
					$(res).each(function(i,v){						
						$('#pro-form #search_result').append('<li class="autocomplete-item">'+v+'</li>')
					})
				}
			})
		}
	})
	$(document).on('click', '.autocomplete-item', function(){
		
		$('#pro_team_list').append('<li class="table-list-item">'+$(this).text()+'</li>')
	})
})
</script>

<title>세계의 모든일 Task Universe</title>
</head>
<body>
	<div id='bodywrap'>
		<div id="pro_div">
			<div id="pro_list">
                	<div class="pro_list_per no-drag">진행률</div>
                	<div class="pro_list_man no-drag">프로젝트 매니저</div>
                	<div class="pro_list_dday no-drag">남은시간</div>
                	<div class="pro_list_end no-drag">종료일</div>
            </div>
            <c:choose>
            	<c:when test="${not empty projectHomeList }">
            		<c:forEach items="${projectHomeList}" var="i">
						<div class='project'>
                			<div class="pro_header">
                    			<div class="pro_name no-drag">${i.pro_name }
                    				<input type="hidden" id="pro_id" value="${i.pro_id }">
                    			</div>
                			</div>
                			<div class="pro_body">
                				<div class="pro_per no-drag">${i.pro_name }</div>
                				<div class="pro_man no-drag">${i.pro_man }</div>
                				<div class="pro_dday no-drag">${i.pro_dday }</div>
                				<div class="pro_end no-drag">${i.pro_end }</div>
                			</div>
						</div>	
					</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<p>프로젝트를 생성해주세요</p>
            	</c:otherwise>
            </c:choose>            
			<!-- <div class='project'>
                <div class="pro_header">
                    <div class="pro_name no-drag">project01</div>
                </div>
                <div class="pro_body">
                	<div class="pro_per no-drag"><p>74</p>%</div>
                	<div class="pro_man no-drag">홍철민</div>
                	<div class="pro_dday no-drag"><p>27</p>day</div>
                	<div class="pro_end no-drag"><p>10</p>월<p>08</p>일</div>
                </div>
			</div> -->
			<!-- <form action="project/insertProject">
				<input type="submit" value="프로젝트 추가">
				<input type="text" name="pro_name">
				<input type="text" name="pro_info">
				<input type="date" name="pro_start">
				<input type="date" name="pro_end">
			</form> -->
			<form id="pro-form" class="modal" action="project/insertProject">
				<label for="pro_name">프로젝트 제목</label> 
				<input type="text" required="required" id="pro_name" name="pro_name" placeholder="프로젝트 제목">
				<label for="pro_info">프로젝트 간단설명</label> 
				<input type="text" required="required" id="pro_info" name="pro_info" placeholder="프로젝트 간단설명">
				<label for="pro_start">프로젝트 기간</label> 
				<input type="text" readonly="readonly" required="required" id="pro_start" name="pro_start" placeholder="프로젝트 시작일">
				<input type="text" readonly="readonly" required="required" id="pro_end" name="pro_end" placeholder="프로젝트 종료일">
				<label for="search_id">아이디로 팀원들을 찾아보세요</label>
				<ul class="table-list" id="pro_team_list">
					
				</ul>
				<input type="text" id="search_id">
				<ul id="search_result" hidden="" class="autocomplete-results">
				</ul>
				
				<input type="submit" value="프로젝트 추가">
			</form>

			<a href="#pro-form" class="btn" rel="modal:open">프로젝트 추가</a>
		</div>
	</div>
	
</body>
</html>