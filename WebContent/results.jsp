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
            document.getElementById("showProfessorSearch").style.display = "none";
          }
          // show Friend search bar
          else if (document.getElementById("Friend").checked == true) {
            document.getElementById("showClassSearch").style.display = "none";
            document.getElementById("showFriendSearch").style.display = "block";
            document.getElementById("showProfessorSearch").style.display = "none";
          }
          // show Professor search bar
          else if (document.getElementById("Professor").checked == true){
            document.getElementById("showClassSearch").style.display = "none";
            document.getElementById("showFriendSearch").style.display = "none";
            document.getElementById("showProfessorSearch").style.display = "block";
          }
        }
        function add(a) {
        	document.getElementById("addValue").value = a;
        	document.tableform.submit();
        }
        	
        function logout(){
          window.location.replace("login.jsp");
        }

        function req(){
          document.require.submit();
        }
        
        function sett(){
          document.settings.submit();
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
             <div id="sidenav">
               <h2>Schedule Builder</h2>
               <ul class="nav nav-pills flex-row" style="justify-content:space-between; align-items:center; padding-top:15px; padding-bottom:15px;">
                 <li class="nav-item">
                   <a class="nav-link" href="profile.jsp">
                     <img src="Images/profile.png" style="width:50px; height:50px">
                   </a>
                 </li>
                 <li class="nav-item">
                   <form name="settings" method="POST" action="Settings">
                     <a class="nav-item" href="settings.jsp">
                       <img src="Images/setting.png" style="width:50px; height:50px" onclick="sett()">
                     </a>
                   </form>
                 </li>
                 <li class="nav-item">
                  <a class="nav-item" href="main.jsp">
                    <img src="Images/schedule.png" style="width:50px; height:50px">
                  </a>
                 </li>
                 <li class="nav-item">
                   <form name="require" method="POST" action="RequirementsSearch">
                     <a class="nav-item">
                       <img src="Images/requirements.png" style="width:50px; height:50px" onclick="req()">
                     </a>
                   </form>
                 </li>
               </ul>
               <div id="logout" style="text-align:center">
                 <input type="button" name="submit" id="logoutButton" value="Logout" onclick="logout()">
               </div>
               <div id="showClassSearch" class="showClassSearch">
                 <input type="text" name="class" placeholder="Search Class....">
                 <button type="submit" name="classSearch"></button>
               </div>
               <div id="showFriendSearch" class="showFriendSearch">
                 <input type="text" name="friend" placeholder="Search Friend...">
                 <button type="submit" name="friendSearch"></button>
               </div>
               <div id="showProfessorSearch" class="showProfessorSearch">
                 <input type="text" name="professor" placeholder="Search Professor...">
                 <button type="submit" name="professorSearch"></button>
               </div>
               <div class="radio-button-div">
                 <input type="radio" name="option" id="Class" value="Class" checked="checked" onclick="myFunction()">Class
                 <input type="radio" name="option" id="Friend" value="Friend" onclick="myFunction()">Friend
                 <input type="radio" name="option" id="Professor" value="Professor" onclick="myFunction()">Professor
               </div>
               <div class="User" style="font-family:tableTitles; text-align:center">
                 <h3 style="color:white; font-size:28px;">Welcome <%= session.getAttribute("userName") %></h3>
               </div>
               <div class="MM" style="font-family:tableTitles; font-size:28px; color:white">
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
               <div class="Updates" style="font-family:tableTitles; text-align:center; margin-top: 25px;">
                 <h6 style="color:white; font-size:28px;">Updates:</h6>
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
