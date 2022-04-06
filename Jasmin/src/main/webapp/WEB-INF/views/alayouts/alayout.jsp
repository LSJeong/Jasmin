<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="resources/assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="resources/assets/vendors/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="resources/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="icon" type="image/x-icon" href="https://creazilla-store.fra1.digitaloceanspaces.com/emojis/54130/growing-heart-emoji-clipart-xl.png" />
<title><tiles:getAsString name="atitle" /></title>
</head>
<body>
	<div class="container-scroller">
		<tiles:insertAttribute name="aheader" />
		<div class="container-fluid page-body-wrapper">
			<tiles:insertAttribute name="amenu" />
			<div class="main-panel">
				<tiles:insertAttribute name="abody" />
				<tiles:insertAttribute name="afooter" />
			</div>
		</div>
	</div>

	<script src="resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="resources/assets/vendors/chart.js/Chart.min.js"></script>
	<script src="resources/assets/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
	<script src="resources/assets/js/off-canvas.js"></script>
	<script src="resources/assets/js/hoverable-collapse.js"></script>
	<script src="resources/assets/js/misc.js"></script>
	<script src="resources/assets/js/dashboard.js"></script>
</body>
</html>