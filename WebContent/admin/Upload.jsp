<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="myutil.MultiPart" %>
<%@ page import="java.net.URLEncoder" %>

<% 
	MultiPart multipart = new MultiPart(request);
	String title = multipart.getParameter("TITLE");
	String description = multipart.getParameter("DESCRIPTION");
	
	String fileName = multipart.getFileName("UPLOAD_FILE");
	String newPath = application.getRealPath("/files/" + fileName);
	multipart.saveFile("UPLOAD_FILE", newPath);
	String url = String.format("UploadResult.jsp?TITLE=%s&DESCRIPTION=%s&FILE_NAME=%s",
								URLEncoder.encode(title, "UTF-8"),
								URLEncoder.encode(description, "UTF-8"),
								URLEncoder.encode(fileName, "UTF-8"));
	response.sendRedirect(url);

%>