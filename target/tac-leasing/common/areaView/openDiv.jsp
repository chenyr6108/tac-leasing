<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
    <link href="styles/core.css" type="text/css" rel="stylesheet"/>
    <script src="scripts/jquery.1.3.2.js" type="text/javascript" language="javascript"></script>
    <script src="scripts/popup_layer.js" type="text/javascript" language="javascript"></script>
    <script src="scripts/areaDiv.js" type="text/javascript" language="javascript"></script>
   
</head>
<body>
	
	
      
       <!-- 第一个层 -->
        <div id="blk1" class="blk" style="display:none;">
            <div class="head"><div class="head-right"></div></div>
            <div class="main">
                <a href="javascript:void(0)" id="close1" class="closeBtn" style="font-size: 12px" onclick="closeAllDiv()">关闭</a>
                <ul id="fristLeval" onclick="allAreaOneClick()" ondblclick="allAreaDbClick()">
                   
                </ul>
            </div>
            <div class="foot"><div class="foot-right"></div></div>
        </div>
   
   		<!-- 第二个层 -->
   		<div class="description"></div>
        <div id="blk2" class="blk" style="display:none;">
            <div class="head"><div class="head-right"></div></div>
            <div class="main">
            	 <h2 id="secondTitle"></h2>
                <ul id="secondLeval" onclick="sub1AreaOneClick()" ondblclick="sub1AreaDbClick()">
                 	
                </ul>
            </div>
            <div class="foot"><div class="foot-right"></div></div>
        </div>
    
    	<!-- 第三个层 -->
        <div id="blk3" class="blk" style="display:none;">
            <div class="head"><div class="head-right"></div></div>
            <div class="main">
                <h2 id="thridTitle"></h2>
                <ul id="thridLeavl" onclick="sub2AreaOneClick()" ondblclick="sub2AreaDbClick()">
                   
                </ul>
            </div>
            <div class="foot"><div class="foot-right"></div></div>
        </div>
    
    	<!-- 第四个层 -->
    	 <div id="blk4" class="blk" style="display:none;">
            <div class="head"><div class="head-right"></div></div>
            <div class="main">
                <h2 id="fourthTitle"></h2>
                <ul id="fourthLeavl" onclick="sub3AreaOneClick()" ondblclick="sub3AreaDbClick()">
                   
                </ul>
            </div>
            <div class="foot"><div class="foot-right"></div></div>
        </div>
        
        <!-- 第五个层 -->
    	 <div id="blk5" class="blk" style="display:none;">
            <div class="head"><div class="head-right"></div></div>
            <div class="main">
                <h2 id="fifthTitle"></h2>
                <ul id="fifthLeavl" onclick="sub4AreaOneClick()" ondblclick="sub4AreaDbClick()">
                   
                </ul>
            </div>
            <div class="foot"><div class="foot-right"></div></div>
        </div>
        
         <!-- 第六个层 -->
    	 <div id="blk6" class="blk" style="display:none;">
            <div class="head"><div class="head-right"></div></div>
            <div class="main">
                <h2 id="sixthTitle"></h2>
                <ul id="sixthLeavl">
                   
                </ul>
            </div>
            <div class="foot"><div class="foot-right"></div></div>
        </div>
</body>
</html>