<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--추가  --> <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/Dash_dashMain.css">
<link rel="stylesheet" href="../css/Dash_an-skill-bar.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-indigo.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script> <!-- 도넛그래프  -->
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">


<!--추가  -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
      	<link rel="stylesheet" href="../css/Dash_style.css">
        <link rel="stylesheet" href="../css/Dash_jQuery.verticalCarousel.css">
        
        


<script type="text/javascript">

$(document).ready(function(){
   
	  
   var data= [   { name:"first",
         data:[
             {value:12, date:"12/14/2019"},
             {value:32, date:"12/15/2019"},
             {value:56, date:"12/17/2019"},
             {value:45, date:"12/19/2019"}
           
           ]
         },
         { name:"second",
         data:[
             {value:13, date:"12/13/2019"},
             {value:30, date:"12/15/2019"},
             {value:26.6, date:"12/18/2019"},
             {value:33, date:"12/19/2019"}
           
           ]
         }
     ]
   
     // Multiple lines
     options={
       height: 150,
       width: 840,
     }
     $("#multi").pista(data, options);
   
   
   $('.test').click(function(){
	   
	   $('.test').css('border','');
	   $(this).css('border','3px solid lightgreen');
	   
   })
   
   
});


var programmingSkills = [
    {
      value: 20,
      label: 'jQuery',
      color: '#3399FF'
    },
    {
      value: 23,
      label: 'JavaScript',
      color: '#FFC575'
    },
    {
      value: 17,
      label: 'Ruby',
      color: '#99CC00'
    },
    {
      value: 22,
      label: 'Python',
      color: '#FF3300'
    },
    {
      value: 18,
      label: 'CSS3',
      color: '#944DDB'
    },
];




</script>

</head>
<body>
<%@include file="../include/Header.jsp"%>
<%@include file="../include/aside.jsp"%>
       
       
       
      <!--  modal 버튼  -->

 
      <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-small" style="width: 3%;float: right; margin-right: 0.2%;" >
      <img src="../resources/Dash_images/changebg.png" style="width: 20px;">
      </button>
       
       
        <div id="id01" class="w3-modal" >
    <div class="w3-modal-content w3-animate-top w3-card-4" style="width: 31%" >
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 style="font-family: 'Hi Melody', cursive;">배경화면 바꾸기</h2>
      </header>
      <div class="w3-container" style="z-index:3;">
      
 <!--  이미지 사진 -->     
      <div class="test" style="background-image:url('../resources/Dash_images/bg10.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/bg1.png'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/bg2.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/bg3.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>     
       </br>
       <div class="test" style="background-image:url('../resources/Dash_images/bg5.png'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/bg6.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
	  <div class="test" style="background-image:url('../resources/Dash_images/bg7.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>      
	  <div class="test" style="background-image:url('../resources/Dash_images/bg8.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      </br>
      <div class="test" style="background-image:url('../resources/Dash_images/su1.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/su2.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/su3.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/su4.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      </br>
      <div class="test" style="background-image:url('../resources/Dash_images/su5.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>  
      <div class="test" style="background-image:url('../resources/Dash_images/su6.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/su7.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      <div class="test" style="background-image:url('../resources/Dash_images/su8.jpg'); background-size:125px; width: 125px; height: 73px; float: left; margin-left: 2%; margin-top: 1%;"> 
      </div>
      </div>
      <footer class="w3-container w3-teal" style="margin-top: 1%;">
        <input type="button" class="w3-teal" style="font-family: 'Hi Melody', cursive; border: 0; outline: 0; cursor: pointer;" value="초기화" />
        <input type="button" class="w3-teal" style="font-family: 'Hi Melody', cursive; float:right; border:0; outline:0; cursor: pointer;" value="적용" /> 
      </footer>
    </div>
  </div>


   <!--  전체 틀-->
   <div class="grid_container">
      <!--  첫번째 틀-->
     <!--  첫번째 틀-->
      <div class="board_first">
         <div class="board1">

            <div class="w3-panel w3-pale-white w3-leftbar w3-border-black" style="height: 110%">
               <p class="text-uppercase mar-btm text-sm w3-xlarge">프로젝트 </p>
             <!--   <i class="fa fa-users fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin">254,485</p>
               <small><span class="text-semibold">7%</span> Higher than
                  yesterday</small>
            </div>
         </div>

         <div class="board2">
            
            <div class="w3-panel w3-pale-white w3-leftbar w3-border-yellow"
               style="height: 90%">
               <p class="text-uppercase mar-btm text-sm w3-xlarge">전체 일정</p>
              <!--  <i class="fa fa-comment fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin">873</p>
               <small><span class="text-semibold"> 154</span> Unapproved comments</small>
            </div>
         </div>

         <div class="board3">
            

            <div class="w3-panel w3-pale-white w3-leftbar w3-border-purple" 
               style="height: 90%">
               <p class="text-uppercase mar-btm text-sm w3-xlarge">남은 업무</p>
               <!-- <i class="fa fa-shopping-cart fa-5x"></i> -->
               <hr>
               <p class="h2 text-thin">2,423</p>
               <small><span class="text-semibold"> 954</span> Sales in this month</small>
            </div>


         </div>

         <div class="board4">
              <div class="w3-panel w3-pale-sand w3-leftbar w3-border-dark-grey" style="height: 90%">
                 <p class="text-uppercase mar-btm text-sm w3-xlarge">완료업무</p>
                       <!-- <i class="fa fa-dollar fa-5x"></i> -->
                       <hr>
                       <p class="h2 text-thin">7,428</p>
                       <small><span class="text-semibold"> 22,675</span> Total Earning</small>
              </div>
         </div>
         

      </div>
      
      <!--두번째 틀  -->
      <div class="board_second">
         <!--  두번째 안에 6개 -->
         <div class="board_chart1">
          <div class="verticalCarouselHeader ">
            <div class="w3-container w3-theme w3-large">
                    프로젝트 진행률 (곡선그래프)
          </div>
          </div>
          <div id="multi"></div>  
         </div>
         
         <div class="board_chart2">
          <div class="verticalCarouselHeader ">
            <div class="w3-container w3-theme  w3-large">
                팀원별 기여도 (가로 막대차트)
          </div>
          </div>
          
            <div class="container" >
               <div id="skill">
                     <div class="skillbar html" style="height:5%;">
                       <div class="filled" data-width="15%"></div>
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">15%</span>
                     </div>
               
                     <div class="skillbar css" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">20%</span>
                       <div class="filled" data-width="20%"></div>
                     </div>
               
                     <div class="skillbar js" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">30%</span>
                       <div class="filled" data-width="30%"></div>
                     </div>
               
                     <div class="skillbar php" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">40%</span>
                       <div class="filled" data-width="40%"></div>
                     </div>
               
                     <div class="skillbar sass" style="height:5%;">
                       <span class="title w3-small">ㅎㅎㅎㅎ</span>
                       <span class="percent w3-small">50%</span>
                       <div class="filled" data-width="50%"></div>
                     </div>
                 </div>      
              </div>    

         </div>
         
         <!----차트3 다가올 일정 ---->
         <div class="board_chart3" style="float: left;">
         
            <div class="verticalCarousel1">
            <div class="verticalCarouselHeader ">
                <h3 class="w3-theme  w3-large"> 다가올 일정</h3>
                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
            </div>
            <ul class="verticalCarouselGroup vc_list">
                <li>
                    <p class="w3-small">서누님 무슨무슨 일정입니다</p>
                </li>
                <li>
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li>
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li>
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li>
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
            </ul>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
        <script>
            $(".verticalCarousel1").verticalCarousel({
                currentItem: 1,
                showItems: 4,
            });
        </script>
            </div>
            
            
         <div class="board_chart6">
          <div class="verticalCarouselHeader ">
            <div class="w3-container w3-theme w3-large">
                   나의 배정 업무
          </div>
          </div>
            <svg id="svg" style="height: 80%;"></svg>
         </div>     
         
         <!---- 차트 4 최근 일정 목록---->
         
         <div class="board_chart4"  style="float: left;">
         
            <div class="verticalCarousel2">
            <div class="verticalCarouselHeader ">
                <h3 class="w3-theme  w3-large"> 최근(등록)일정 목록</h3>
                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
            </div>
            <ul class="verticalCarouselGroup vc_list">
                <li style="margin-bottom: 0.05%;">
                    <p class="w3-small"> ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li style="margin-bottom: 0.05%;">
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li style="margin-bottom: 0.05%;">
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li style="margin-bottom: 0.05%;">
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li style="margin-bottom: 0.05%;">
                    <p class="w3-small">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
            </ul>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
        <script>
            $(".verticalCarousel2").verticalCarousel({
                currentItem: 1,
                showItems: 4,
            });
        </script>
            </div>
            
            <!--  차트5 타임라인-->
           <div class="board_chart5">
            
            <div class="verticalCarousel3">
            <div class="verticalCarouselHeader ">
                <h3 class="w3-theme  w3-large"> 타임라인</h3>
                <a href="#" class="vc_goDown"><i class="fa fa-fw fa-angle-down"></i></a>
                <a href="#" class="vc_goUp"><i class="fa fa-fw fa-angle-up"></i></a>
            </div>
            <ul class="verticalCarouselGroup vc_list">
                <li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
                <li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </li>
            </ul>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../js/Dash_jQuery.verticalCarousel.js"></script>
        <script>
            $(".verticalCarousel3").verticalCarousel({
                currentItem: 1,
                showItems: 3,
            });
        </script>
        
        
        
            </div>
         
        <!--  modal 버튼 -->
                 
                 
        </div><!--두번째틀 끝 -->    
      </div> <!--  전체틀 끝 -->
      
      

      
<script src="../js/Dash_svg-donut-chart-framework.js"></script>
<script src="../js/Dash_jquery.pista.min.js"></script> <!-- 곡선그래프 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
<script src="../js/Dash_an-skill-bar.js"></script>
<script src="../js/Dash_DashMainGraph.js"></script>

</body>
</html>