<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Movie Seat</title>
</head>
<body>
	<div class="admin_seat_container">
		<input type="button" onclick="seatMakeList()" id="nana" value="">
		<script type="text/javascript">
			function seatMakeList(){
				const createDiv = document.createElement('div');
				var i, j;
				var inputValue;
				
				
				createDiv.className="admin_seat_list";
				const array = [];
				const seat=0;
				for(i=0;i<9;i++){
					for(j=1;j<15;j++){
						if(i=0){
							i ='A';	
						}
						add.array[j-1]=i+'${j}';
					}		
				}
			document.getElementById("nana").value
			}
		</script>
	</div>
</body>
</html>