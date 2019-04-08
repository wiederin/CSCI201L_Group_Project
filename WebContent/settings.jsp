<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule Builder</title>
<link rel="stylesheet" type="text/css" href="settings.css" />
</head>
<body>
	<div class="background-img"></div>
	<div id="sidenav" class="sidenav">
		<h2>Schedule Builder</h2>
		<a href="profile.jsp" class="snlinks">
			<img src="Images/profile.png" alt="profile" style="width:50px; height: 50px;">
		</a>
		<a href="settings.jsp" class="snlinks1">
			<img src="Images/setting.png" alt="settings" style="width:50px; height: 50px;">
		</a>
		<a href="main.jsp" class="snlinks2">
			<img src="Images/schedule.png" alt="schedule" style="width:50px; height: 50px;">
		</a>
		<a href="requirements.jsp" class="snlinks3">
			<img src="Images/requirements.png" alt="requirements" style="width:50px; height: 50px;">
		</a>
		<input id="button3" type="submit" name="submit" value="Logout" />
	</div>
	<div class="nav">
		<h1 class = center_p>Profile Settings</h1>
		<form method="POST" action="Login">
            <center>
            <table class = table>
                <tbody>
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: right">Major:</td>
                        <td ><input class = field type="text" name="major" style="width:200px;" required/></td>
                    </tr>
                    	
                    <tr>
                        <td class = desc style="color: white; font-size: 30px; text-align: right">Minor:</td>
                        <td><input class = field type="password" name="minor" style="width:200px;" required/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Password:</td>
                        <td ><input class = field type="text" name="password" style="width:200px;" required/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 30px; text-align: right">Previous Class:</td>
                        <td ><input class = field type="text" name="class" style="width:200px;" required/></td>
                    </tr>
                    <tr>
                    	<td class = desc style="color: white; font-size: 25px; text-align: right">Expected Graduation:</td>
                        <td ><input class = field type="text" name="class" style="width:200px;" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input id="button1" type="submit" name="submit" value="Save changes" />
                            &nbsp;&nbsp;<input id="button2" type="submit" name="submit" value="Clear Current Schedule" />
                            &nbsp;&nbsp;
                            <input id="button1" type="submit" value="Delete Account" />
                        </td>                        
                    </tr>  
                                      
                </tbody>
            </table>
            </center>
        </form>
	</div>
</body>
</html>
