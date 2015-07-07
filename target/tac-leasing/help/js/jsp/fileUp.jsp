<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.ueditor.Uploader" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.ueditor.Uploader" %>

<%

	
	//加载配置文件
	Properties pro = new Properties();
	String propertiesPath = request.getRealPath("/help/js/jsp/config.properties");
	
	Properties properties = new Properties();
	
	try {
	    properties.load( new FileInputStream( propertiesPath ) );
	} catch ( Exception e ) {
	    //加载失败的处理
	    e.printStackTrace();
	}
	String savePath = properties.getProperty("upload");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    Uploader up = new Uploader(request);
    up.setSavePath(savePath);
   // String[] fileType = {".rar" , ".doc" , ".docx" , ".zip" , ".pdf" , ".txt" , ".swf", ".wmv"};  //允许的文件类型
  //  up.setAllowFiles(fileType);
    up.setMaxSize(10000);        //允许的文件最大尺寸，单位KB
    up.upload();
    response.getWriter().print("{'url':'"+up.getUrl()+"','fileType':'"+up.getType()+"','state':'"+up.getState()+"','original':'"+up.getOriginalName()+"'}");

%>
