<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
String username = (String) session.getAttribute("username");
if (username == null) {
	response.sendRedirect("login.jsp"); // Redirect if not logged in
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home - Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

	<!-- Navbar -->
	<nav class="bg-white shadow p-4 flex justify-between items-center">
		<div class="text-xl font-bold text-blue-600">MyApp</div>
		<ul class="flex space-x-4 text-gray-700 font-medium">
			<li><a href="#" class="hover:text-blue-600">Home</a></li>
			<li><a href="#" class="hover:text-blue-600">Profile</a></li>
			<li><a href="logout.jsp" class="hover:text-red-600">Logout</a></li>
		</ul>
	</nav>

	<!-- Main Content -->
	<main
		class="flex-1 flex flex-col items-center justify-center text-center p-6">
		<h1 class="text-4xl font-bold text-gray-800 mb-4">
			Welcome,
			<%=username%>
			👋
		</h1>
		<p class="text-lg text-gray-600">You're now logged into your
			dashboard.</p>
	</main>

	<!-- Footer -->
	<footer
		class="text-center py-4 text-gray-500 text-sm bg-white shadow-inner">
		&copy; 2025 MyApp. All rights reserved. </footer>

</body>
</html>
