<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Build a Schedule</title>
<!-- linking CSS -->
<link rel="stylesheet" type="text/css" href="generate.css" />
<script language="javascript">
		function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var cell1 = row.insertCell(0);
			var element1 = document.createElement("input");
			element1.type = "checkbox";
			element1.name="chkbox[]";
			cell1.appendChild(element1);

			var cell2 = row.insertCell(1);
			cell2.innerHTML = "Class: ";

			var cell3 = row.insertCell(2);
			var element2 = document.createElement("input");
			element2.type = "text";
			element2.name = "txtbox[]";
			cell3.appendChild(element2);


		}

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}

	</script>
</head>
<body>
	<!-- background image -->
	<div class="background-img"></div>
	<!-- login fields -->
	<div class = nav>
			<h1 class = center_p>Schedule Builder</h1>
			<form method="POST" action="Login">
			<input type="button" value="Add Row" onclick="addRow('dataTable')" id="button1"/>
			<input type="button" value="Delete Row" onclick="deleteRow('dataTable')" id="button2"/>
            <center>
            <table class = table id="dataTable">
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="chk[]"/></td>
                        <td>Class: </TD>
                        <td> <input type="text" name="txt[]" /> </td>
                    </tr>           
                </tbody>
            </table>
            </center>
        </form>
	</div>
</body>
</html>