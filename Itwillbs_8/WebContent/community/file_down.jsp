<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.ServletUtils"%>


<%
	request.setCharacterEncoding("utf-8");
	// file_name 파일이름 파라미터  가져오기
    String fileName = request.getParameter( "downFile" );
 	System.out.println(fileName);
 	// upload폴더의 물리적인 경로 확인
     String savePath = "communityUpload";
     ServletContext context = getServletContext();
     String sDownloadPath = context.getRealPath(savePath);
     // upload물리적 경로\\ 파일이름
     String sFilePath = sDownloadPath + "\\" + fileName;

   byte b[] = new byte[4096];
   // File 파일객체생성  파일정보 크기,속성,존재여부,..
   File oFile = new File(sFilePath);
  

	// 파일 입력받기
   FileInputStream in = new FileInputStream(oFile);

	// 파일 타입 확인
   String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>>"+sMimeType );

// 파일 타입이 확인이 안되면 
   // octet-stream은  8비트로 된 일련의 데이터를 뜻합니다. 지정되지 않은 파일 형식을 의미합니다.
 
   if(sMimeType == null) sMimeType = "application/octet-stream";


	// 서버에서 클라이언트 타입 설정
   response.setContentType(sMimeType);

   // 브라우저별(익스플로 , 크롬)로  파일   한글처리 
   String userAgent = request.getHeader("User-Agent");
   boolean ie = (userAgent.indexOf("MSIE") > -1)|| (userAgent.indexOf("Trident") > -1);
   String sEncoding=null;
   if(ie) {
	  sEncoding = URLEncoder.encode(fileName, "utf-8").replaceAll("\\+", "%20");
	  System.out.println(sEncoding);
   }else{
	  sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");
	  System.out.println(sEncoding);
  }
   
  
   //한글 업로드 (이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다.)
//    String sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");
 //  System.out.println(sEncoding);

 // 서버 -> 클라이언트 설정 바꿈 => 파일첨부 다운
   response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);
   
 // 출력
   ServletOutputStream out2 = response.getOutputStream();
   int numRead;

   // 첨부파일을 입력받아서  파일다운 되게 설정변경 => 출력
   // 바이트 배열b의 0번 부터 numRead번 까지 브라우저로 출력
   while((numRead = in.read(b, 0, b.length)) != -1) {
    out2.write(b, 0, numRead);
   }
   out2.flush(); 
   out2.close();
   in.close();

   out.clear();
	out = pageContext.pushBody();
 //  ServletUtils.returnFile( PdsMisc.UPLOAD_DIRECTORY + File.separator + StringMisc.uniToEuc( fileName ), response.getOutputStream() );
%>
