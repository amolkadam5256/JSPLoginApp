<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sign Up</title>
<script src="https://cdn.tailwindcss.com"></script>
<!-- Optional: Remix Icons CDN for back arrow icon -->
<link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-purple-100 via-white to-blue-100 min-h-screen flex items-center justify-center p-4">

	<div class="absolute top-4 left-4">
		<!-- Back button/icon -->
		<a href="index.html" class="text-purple-600 hover:text-purple-800 text-lg flex items-center space-x-2">
			<!-- Optional: Using Remix Icon's back-arrow -->
			<i class="ri-arrow-left-line"></i>
			<span>Back to Home</span>
		</a>
	</div>

	<div class="bg-white shadow-xl rounded-2xl max-w-md w-full p-8 sm:p-10 space-y-6">
		<h2 class="text-3xl font-bold text-center text-gray-800">Create Account</h2>
		<p class="text-center text-gray-500">Join us and start your journey!</p>

		<form action="signup" method="POST" class="space-y-5">
			<!-- Full Name -->
			<div>
				<label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
				<input type="text" name="name" id="name" required
					class="mt-1 block w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-400 focus:border-transparent" />
			</div>

			<!-- Username -->
			<div>
				<label for="username" class="block text-sm font-medium text-gray-700">Username</label>
				<input type="text" name="username" id="username" required
					class="mt-1 block w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-400 focus:border-transparent" />
			</div>

			<!-- Password -->
			<div class="relative">
				<label for="password" class="block text-sm font-medium text-gray-700">Password</label>
				<input type="password" name="password" id="password" required
					class="mt-1 block w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-400 focus:border-transparent" />
				<button type="button" onclick="togglePassword('password', this)"
					class="absolute right-3 top-[42px] text-sm text-purple-500 hover:underline">Show</button>
			</div>

			<!-- Confirm Password -->
			<div class="relative">
				<label for="confirm" class="block text-sm font-medium text-gray-700">Confirm Password</label>
				<input type="password" name="confirm" id="confirm" required
					class="mt-1 block w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-400 focus:border-transparent" />
				<button type="button" onclick="togglePassword('confirm', this)"
					class="absolute right-3 top-[42px] text-sm text-purple-500 hover:underline">Show</button>
			</div>

			<!-- Sign Up Button -->
			<button type="submit"
				class="w-full bg-purple-600 text-white py-2 rounded-lg hover:bg-purple-700 transition-all duration-200 shadow-md">
				Sign Up
			</button>
		</form>

		<p class="text-center text-sm text-gray-600">
			Already have an account? <a href="login.jsp" class="text-purple-600 hover:underline">Log In</a>
		</p>
	</div>

	<script>
		function togglePassword(id, btn) {
			const input = document.getElementById(id);
			if (input.type === 'password') {
				input.type = 'text';
				btn.textContent = 'Hide';
			} else {
				input.type = 'password';
				btn.textContent = 'Show';
			}
		}
	</script>

</body>
</html>
