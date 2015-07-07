<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.ServletContext"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="com.brick.base.util.LeaseUtil"%>
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
	
    //仅做示例用，请自行修改
	String filePath = "\\\\"+LeaseUtil.getIPAddress()+properties.getProperty( "dirPath" );

	String imgStr ="";


	List<File> files = getFiles(filePath,new ArrayList());

	Uploader uploader = new Uploader(request);
	for(File file :files ){
		imgStr+= uploader.generateImgUrl(file.getPath()) + "ue_separate_ue";
	}
	if(imgStr!=""){
        imgStr = imgStr.substring(0,imgStr.lastIndexOf("ue_separate_ue")).replace(File.separator, "/").trim();
    }

	out.print(imgStr);		
%>
<%!
public List getFiles(String realpath, List files) {
	
	File realFile = new File(realpath);
	if (realFile.isDirectory()) {
		File[] subfiles = realFile.listFiles();
		for(File file :subfiles ){
			if(file.isDirectory()){
				getFiles(file.getAbsolutePath(),files);
			}else{
				if(!getFileType(file.getName()).equals("")) {
					files.add(file);
				}
			}
		}
	}
	return files;
}


public String getFileType(String fileName){
	String[] fileType = {".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp"};
	Iterator<String> type = Arrays.asList(fileType).iterator();
	while(type.hasNext()){
		String t = type.next();
		if(fileName.toLowerCase().endsWith(t)){
			return t;
		}
	}
	return "";
}
%>