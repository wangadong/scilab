<%@ page     contentType="text/html; charset=GBK" %>
<%@ page     import="javax.servlet.ServletInputStream" %>
<html>
<head>
<title>get method</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body>
	<form name="frm" method="post" action="ShowLocalFile.jsp" ENCTYPE="multipart/form-data">
打开文件：<input type="file" name="filept">
<input type="submit" name="submit" value="submit">
</form>
<%
    request.setCharacterEncoding("GBK");
        int BUFSIZE = 1024 * 8;        
        int rtnPos = 0;
        byte[] buffs = new byte[ BUFSIZE * 8 ];
        ServletInputStream sis = request.getInputStream();
        while( (rtnPos = sis.readLine( buffs, 0, buffs.length )) != -1 ){
            String strBuff = new String( buffs, 0, rtnPos );
            out.print(strBuff);
            out.print("<br>");
        }
%>
</body>
</html>