<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE html>
<html lang="en">
<head>
<!--  공통 수정사항-->
<!-- 메일 모양 받는 모양변경 -->


<!-- main고칠꺼있나 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>Document</title>
    <script>
    $(document).ready(function(){
        $('#sign_in_out').on('click',function(){
            $(location).attr("href", "sign_in.do");
        });
        $('#sign_up').on('click',function(){
            $(location).attr("href", "sign_up.do");
        });
        
      
    })
    </script>
    
    <style>
        *{
            margin: 0;
        }

        #textArea h3,#textArea h1,#header,#signUpSubmit,#info{
            background: linear-gradient(-120deg, #12c2e9, #c471ed, #f64f59);
        }
        *:focus {
            background: rgba(113, 191, 255,0.1);
            outline: none;
            }


        #header{
            width: 100%;
            height: 70px;            
        }

        #bodywrap{
            width: 100%;
            height: 2000px;
        }

        #bodywrap div{            
            float: left ;
        }

        .center_box{
            position:absolute;
            left:50%;
            transform: translate(-50%, -50%);
        }

        /* signUpArea*/
        #signUpArea{
            width: 100%;
            height: 625px;
            background: rgb(252, 252, 252)
        }

        #content{
            width: 1020px; 
            top: 356px;
        }

        /* textArea */
        #textArea{
            color: white;
            width: 520px;
            margin-top: 130px;
            font-family: 'Raleway', sans-serif;
            margin-right: 70px;
        }

        #textArea h1{
            background-size: 75%;
            font-size: 60px;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        #textArea h3{
            font-size: 24px;
            font-weight: 400;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }


        #signForm{
            padding-top: 15px;
            margin-top: 60px;
            width: 430px;
            height: 467px;
            background: rgb(245, 245, 240);
            border-radius: 5px;
            border: 1px solid rgba(5,5,5,0.2);
            box-sizing: border-box;
        }

        #signUpArea form label{
            margin-top: 20px;
            margin-bottom: 5px;
            display: block;
            color: black;            
            margin-left: 20px;
            font-weight: 400;
            font-size: 14px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .signIn {
            width:380px;
            height: 39px;
            margin-bottom: 10px;
            margin-left: 20px;
            border: 1px solid rgb(219, 219, 219);
            border-radius: 5px;
            box-shadow: inset -1px 1px 8px 0px rgba(200,200,200,0.5);
            padding-left: 10px;
            font-size: 20px;
            color: #09405a;
        }

        #signUpSubmitArea *{
            border: none;
            border-radius: 2px;
            color: white;
            height: 64px;
        }

        #signUpSubmit{
            width: 305px;      
            margin-left: 20px;  
            margin-right: 16px;
            cursor: pointer;
            font-size: 18px;
            font-family: 'Noto Sans KR', sans-serif;
            background-size: 200%;
            margin-top: 15px;
            transition: .6s;
            font-weight: 100;
        }

        #signUpSubmit:hover{
            background-position: right;
        }

        #SignUpGoogle{
            width: 60px;
            background-image: url("/finalproject/resources/images/search.png");
            background-size: 46px;
            background-repeat: no-repeat;
            background-color: rgb(245,245,240);
            color:rgba(0, 0, 0, 0);
            cursor: pointer;
            background-position-y: 5px
        }

        #signInfo{
            margin-top: 20px;
            font-size: 12px;
            color: rgb(173, 173, 173);
            width: 400px;
            margin-left: 20px;
        }

        #youtube iframe{
            top: 1450px;
        }
        #youtube{
            width: 100%;
            background: rgb(245,245,240);
            height: 3000px;
        }

        #info{
            width: 100%;
            height: 290px;
        }

        /****************************header************************/        
        .header_center_box{
            position:absolute;
            left:50%;
            transform: translate(-50%,0);
        }
        
        #header_content{
            width: 1300px;
        }

        #header_log{
            float: right;
            margin-right: 40px;
            margin-top: 16px;
        }

        

        #header_log button{            
            font-family: 'Noto Sans KR', sans-serif;
            opacity: 1;
            transition: 0.3s;
            cursor: pointer;
            color: white;
            background: rgba(0, 0, 0, 0);
            width: 95px;
            height: 38px;
            font-size: 16px;
            font-weight: 100;
        }

        #sign_in_out:hover ,#sign_up:hover{
            opacity: 0.75;
        }

        #sign_in_out{            
            border: 1px solid white;
            border-radius: 19px;
        }

        #sign_up{            
            border: none;            
        }

        #header_logo{
            font-size: 35px;
            font-family: 'Dancing Script', cursive;
            color:white;
            font-weight: 700;
            margin-top: 10px;
            opacity: 0.9;
        }


        /****************************header************************/
    </style>
</head>
<body>
    <div id='header'>
        <div id="header_content" class='header_center_box'>
            <span id="header_logo" class='header_center_box'>MaraTang</span>
            <div id='header_log'>
                <button id='sign_up'>Sign up</button>
                <button id='sign_in_out'>Sign in</button>
            </div>
        </div>
        
    </div>





    <div id = 'bodywrap'>
        <div id="signUpArea">
            <div id="content" class='center_box'>
                <div id='textArea'>
                    <h1>Project <br>Management</h1>
                    <h3>JooSung is a project management tool inspired by minimalism. 
                        From university team projects to business, simple tasks make 
                        it easy and fast to control and manage projects.</h3>
                </div>
                <div id='signForm'>
                    <form action="sign_up.do" method="post">
                            <label for="signUp_username">Username</label>
                            <input type="text" name="id" id="signUp_username" class="signIn" autocomplete="off">
                            <label for="signUp_email">Email</label>
                            <input type="text" name="email" id="signUp_email" class="signIn" autocomplete="off">
                            <label for="signUp_password">Password</label>
                            <input type="text" name="pwd" id="signUp_password" class="signIn" autocomplete="off">
                            <div id="signUpSubmitArea">
                                <input type="submit" name="" id="signUpSubmit" value="sign up for 주성">
                                <button id="SignUpGoogle">구글</button>
                            </div>
                            <div id="signInfo">By clicking “Sign up for GitHub”, 
                                you agree to our Terms of Service 
                                and Privacy Statement. We’ll occasionally 
                                send you account related emails.</div>
                    </form>
                </div>
            </div>            
        </div>
        <div id='info'>

        </div>
        <div id='youtube'>
            <iframe  class='center_box' width="1280" height="720" src="https://www.youtube.com/embed/4nKCAzdHm6A" 
            frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen></iframe>
        </div>
    </div>
</body>
</html>

