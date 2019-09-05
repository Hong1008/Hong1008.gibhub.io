<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
    *{
            margin: 0;
        }
    #textArea h3,#textArea h1,#header,#signUpSubmit,#info{
            background: linear-gradient(-120deg, #12c2e9, #c471ed, #f64f59);
        }
        #header{
            width: 100%;
            height: 70px;            
        }
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

</style>
</head>
<body>
    <div id='header'>
        <div id="header_content" class='header_center_box'>
            <span id="header_logo" class='header_center_box'>TMI</span>
            <div id='header_log'>
                <button id='sign_up'>Sign up</button>
                <button id='sign_in_out'>Sign in</button>
            </div>
        </div>
        
    </div>
</body>
</html>