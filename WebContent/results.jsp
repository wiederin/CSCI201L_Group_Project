<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
      <script type="text/javascript">
        // displays and hides both types of search bars
        function myFunction() {
          // show Class search bar
          if (document.getElementById("Class").checked == true) {
            document.getElementById("showClassSearch").style.display = "block";
            document.getElementById("showFriendSearch").style.display = "none";
          }
          // show Friend search bar
          else if (document.getElementById("Friend").checked == true) {
            document.getElementById("showClassSearch").style.display = "none";
            document.getElementById("showFriendSearch").style.display = "block";
	  }
        }
        function add(a) {
        	document.getElementById("addValue").value = a;
        	document.tableform.submit();
        }
		function sett(){
			window.location.replace("settings.jsp");
		}
		function req(){
			window.location.replace("requirements.jsp");
		}
		function prof(){
			window.location.replace("prof.jsp");
		}
		function man(){
			window.location.replace("main.jsp");
		}	
        function logout(){
          window.location.replace("login.jsp");
        }
      </script>
      <meta charset="UTF-8">
      <title>Schedule Builder</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <link rel="stylesheet" type="text/css" href="results.css">
    </head>
    <body>
      <div id="background"></div>
      <div class="container-fluid">
        <div class="row">
           <div class="col-lg-3">
             <div id="sidenav" style="overflow-y:scroll">
               <h2>Schedule Builder</h2>
               <ul class="nav nav-pills flex-row" style="justify-content:space-between; align-items:center; padding-top:15px; padding-bottom:15px;">
                 <li class="nav-item">
                   <a class="nav-link" href="profile.jsp">
                     <img src="Images/profile.png" style="width:50px; height:50px" onclick= "prof()">
                   </a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-item" href="settings.jsp">
                       <img src="Images/setting.png" style="width:50px; height:50px" onclick="sett()">
                     </a>
                 </li>
                 <li class="nav-item">
                  <a class="nav-item" href="main.jsp">
                    <img src="Images/schedule.png" style="width:50px; height:50px" onclick = "man()">
                  </a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-item">
                       <img src="Images/requirements.png" style="width:50px; height:50px" onclick="req()">
                     </a>
                 </li>
               </ul>
               <div id="logout" style="text-align:center">
                 <input type="button" name="submit" id="logoutButton" value="Logout" onclick="logout()">
               </div>
               <form name = "rButton" method = "POST" action = "Results">
			<div id="showClassSearch" class="showClassSearch">
				<input type="text" name="classText" placeholder="Search Class....">
				<button type="submit" name="classSearch"></button>
			</div>
			<div id="showFriendSearch" class="showFriendSearch">
				<input type="text" name="friendText" placeholder="Search Friend...">
				<button type="submit" name="friendSearch"></button>
			</div>
			<div class="radio-button-div">
				<input type="radio" name="option" id="Class" value="Class" checked="checked" onclick="myFunction()">Class 
				<input type="radio" name="option" id="Friend" value="Friend" onclick="myFunction()">Friend 
			</div>
	       </form>
               <div class="radio-button-div">
                 <input type="radio" name="option" id="Class" value="Class" checked="checked" onclick="myFunction()">Class
                 <input type="radio" name="option" id="Friend" value="Friend" onclick="myFunction()">Friend
               </div>
               <div class="User" style="font-family:tableTitles; text-align:center">
                 <h3 style="color:white; font-size:20px;">Welcome <%= session.getAttribute("userName") %></h3>
               </div>
               <div class="MM" style="font-family:tableTitles; font-size:20px; color:white">
                 <table class="sidenavtable" align="center">
                   <tbody>
                     <tr>
                       <td>Major:</td>
                       <td><%= session.getAttribute("majorName") %></td>
                     </tr>
                     <tr>
                       <td>Minor:</td>
                       <td><%= session.getAttribute("minorName") %></td>
                     </tr>
                   </tbody>
                 </table>
               </div>
		     <h2 style="font-size:20px; text-align:center; font-family:tableTitles">Updates:</h2>
               <div class="Updates" id="updates" style="font-size:20px; font-family:tableTitles; text-align:center; margin-top: 25px;">
               	 <script type="text/javascript" src = "assets/js/jquery-1.11.1.min.js"></script>
               	 <script type="text/javascript">
    					$(document).ready(function() {
    						setInterval(function() {
    							$("#updates").load('data.jsp #UpdatesTable')
    						}, 3000);
    					});
	  			 </script>
                  
               </div>
             </div>
           </div>
           <form name = "tableform" action = "Add" method = "POST">
           <input id = "addValue" name = "addValue" style = "display:none;"></input>
           <div class="col-lg-9">
             <div id="nav">
               <h1 style="font-size:45px"><%= session.getAttribute("searchType") %> </h1>
               <table class="table" style="width:800px;font-family:tableTitles">
               <% Vector<String> results = (Vector<String>)session.getAttribute("resultsArray");
               	  Vector<Integer> metrics = (Vector<Integer>)session.getAttribute("metricsArray");
               	  for (int i = 0; i < results.size();i++){          		  
               %>
                 <tr>
                 	<td style = "color:white;">
                 		<button id = <%= results.get(i) %> style = "color:white;border:0;padding:0;background-color:rgba(255, 255, 255, 0);" onclick="add('<%= results.get(i) %>')"><%= results.get(i) %></button>
                 	</td>
                 	<%
                 	if (metrics.size()!=0){
                 	%>
                 	<td style = "color:white;">
                 		<%= metrics.get(i) %>
                 	</td>
                 	<%
                 	}
                 	%>
                 </tr>
                <% }  %>
               </table>
             </div>
           </div>
           </form>
        </div>
      </div>
    </body>
</html>
