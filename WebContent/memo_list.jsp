<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "twoline.OnelineDTO" %>
<%@ page import= "twoline.OnelineDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>웹서비스 실습</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
     #memo {
	 background-color: #ffbb24;
	 width : 600px;
	 margin: auto;
	 border-radius: 12px;
	 padding:24px;
	 text-align:center;
     }
     #title {
     font-size: 25px;
     font-family: 'Jua', sans-serif;
     font-weight:bold;
     color: white;
  	 height:70px;
  	 padding-bottom:10px;
     }
     #wrtie {
     background-color:red;
     font-size:1.1em;
     }
     #content {
     border-style:dashed;
     border-width:1px;
     border-radius:12px;
     background-color:white;
   	
   	 margin-top:12px;
     }
     #content p {
     /*border: 2px solid red;*/
     margin: 0 0 0 10px;
     padding: 5px;
   	 text-align:left;
     font-family: 'Gamja Flower', cursive;
     }
     #content p input[type=button] {
     border: 1px solid #222;
     margin-left:20px;
     background-color:white;
     }
     #write input[type=text] {
     width:200px;
     height:20px;
     }
     #write input[type=submit] {
     height:19px;
     font-family: 'Gamja Flower', cursive;
     background-color:white;
     }
     </style>
</head>
<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
<body>
<div id = "memo">

<div id = "title">
<h3>메모장</h3><hr>
</div>

<form method="post" action="memo_write.jsp">
<div id = "write">
<input type="text" name="memo"></input> 
<input type="submit" value="등록"></input>
</div>
</form>

<div id = "content">
<% 
	for(int i = 0; i <dtos.size(); i++) {
		OnelineDTO dto = dtos.get(i);
	 		out.println("<p>(" +dto.getWdate() + ") " + dto.getMemo
	 				()+ "<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no=" +dto.getNo() + "'\"><br>");
	 		out.println("</input></p>");
	 	}	
%>	 
	
	
	</div>


</div>
</body>
</html>




	