<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Optional: Remix Icons CDN for back arrow icon -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-r from-blue-100 via-white to-blue-100 min-h-screen flex items-center justify-center p-4">

  <!-- Back to Home Button/Icon -->
  <div class="absolute top-4 left-4">
    <a href="index.html" class="text-blue-600 hover:text-blue-800 text-lg flex items-center space-x-2">
      <i class="ri-arrow-left-line"></i>
      <span>Back to Home</span>
    </a>
  </div>

  <div class="bg-white shadow-2xl rounded-2xl max-w-md w-full p-8 sm:p-10 space-y-6">
    <h2 class="text-3xl font-bold text-center text-gray-800">Welcome Back 👋</h2>
    <p class="text-center text-gray-500">Please login to your account</p>

    <!-- Show error message if any -->
    <c:if test="${not empty param.error}">
        <p class="text-center text-red-500 text-sm">${param.error}</p>
    </c:if>

    <form action="login" method="POST" class="space-y-5">
      <div>
        <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
        <input type="text" name="username" id="username" required
          class="mt-1 block w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400 focus:border-transparent" />
      </div>

      <div class="relative">
        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
        <input type="password" name="password" id="password" required
          class="mt-1 block w-full px-4 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400 focus:border-transparent" />
        <button type="button" onclick="togglePassword()"
          class="absolute right-3 top-[42px] text-sm text-blue-500 hover:underline focus:outline-none">
          Show
        </button>
      </div>

      <div class="flex items-center justify-between">
        <label class="inline-flex items-center">
          <input type="checkbox" class="form-checkbox h-4 w-4 text-blue-600" />
          <span class="ml-2 text-sm text-gray-600">Remember me</span>
        </label>
        <a href="#" class="text-sm text-blue-600 hover:underline">Forgot password?</a>
      </div>

      <button type="submit"
        class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition-all duration-200 shadow-md">
        Sign In
      </button>
    </form>

    <p class="text-center text-sm text-gray-600">
      Don’t have an account?
      <a href="signup.jsp" class="text-blue-600 hover:underline">Sign up</a>
    </p>
  </div>

  <script>
    function togglePassword() {
      const passwordInput = document.getElementById('password');
      const toggleBtn = event.target;
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        toggleBtn.textContent = 'Hide';
      } else {
        passwordInput.type = 'password';
        toggleBtn.textContent = 'Show';
      }
    }
  </script>

</body>
</html>
