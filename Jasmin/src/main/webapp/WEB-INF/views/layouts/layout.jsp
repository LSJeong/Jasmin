<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /> </title>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
    <link rel="icon" type="image/x-icon" href="https://e7.pngegg.com/pngimages/218/230/png-clipart-princess-jasmine-aladdin-drawing-the-walt-disney-company-disney-princess-princess-jasmine-hat-cartoon.png" />
    <style>
    :root{
        --main-dark-chocolate:#301c02;
        --main-chocolate:#573B25;
        --main-brown:#8E5F46;
        --main-light-brown:#BD9D80;
    }
        
        .img_box{
           display: flex;
           justify-content: flex-end;
           width: 100%;
           margin-bottom: 20px;
        }
        .site-btn{
            background-color: var(--main-dark-chocolate);
            border-radius:4px;
        }
        .site-btn2{
            background-color: var(--main-chocolate);
        }
        .site-btn3{
            background-color: var(--main-light-brown);
        }
        .site-btn4{
            background-color: var(--main-brown);
        }
        .shop_a{
            color: #8E5F46;
        }
        .header_section{
           margin-bottom:40px;
        } 
    </style>
</head>
<body>
<div class="header_section">
   <tiles:insertAttribute name="header"/>
   </div>
   <tiles:insertAttribute name="body"/>

   <tiles:insertAttribute name="footer"/>
   


<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/mixitup.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>
</body>
</html>