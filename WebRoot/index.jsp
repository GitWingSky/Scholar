<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	
    <title>学者网</title>
	<link rel="stylesheet" href="css/index.css" />
	
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  </head>
   <%
  		String n = "";
  		String p = "";
  		Cookie[] cookies;
  		try{
  			cookies = request.getCookies();
  			for(int i = 0; i < cookies.length; i++){
  	  			
  	  			if(cookies[i].getName().equals("userUsername")){
  	  				n = cookies[i].getValue();
  	  			}else if(cookies[i].getName().equals("userPassword")){
  	  				p = cookies[i].getValue();
  	  			}

  	  		}
  		}catch(Exception e){
  			
  		}
  		
  		
  	%>
  <body>
   <!-- Wrapper -->
		<div id="wrapper">
			<!-- Header -->
			<header id="header">
				<div class="logo">
					<span class="icon">Scholar</span>
				</div>
				<div class="content">
					<div class="inner">
						<h1>学者网</h1>
						<p>面向学者社交网络，教学科研协作平台<br/> The scholar＇s home. Color your academic life. </p>
					</div>
				</div>
				<nav>
					<ul>
						<li>
							<a href="#login">登录</a>
						</li>
						<li>
							<a href="#register">用户注册</a>
						</li>
					</ul>
				</nav>
			</header>
			<!-- Main -->
			<div id="main">
				<!-- Login -->
				<article id="login">
					<h2 class="major">登录<span id="msg" style="color: brown; font-size: 16px;"></span></h2>
					<form  name="login_form">
						<div class="field first">
							<label for="login_account">账户</label>
							<input type="text" name="LoginUsername" id="LoginUsername" value="<%=n%>" required="required" />
						</div>
						<div class="field">
							<label for="login_pwd">密码</label>
							<input type="password" name="LoginPassword" id="LoginPassword" value="<%=p%>" required="required" />
						</div>
						<div class="field">
							<input type="checkbox" name="rememberMe" id="rememberMe" value="1"/>记住我
						</div>
						<ul class="actions">
							<li><input value="登陆" class="loginButton" type="button"/></li>
							<li><input type="reset" value="重置" /></li>
						</ul>
					</form>
				</article>
				<!--  register -->
				<article id="register">
					<h2 class="major">用户注册</h2>
					<form method="post" action="UserSer?method=register" name="register_form">
						<div class="field">
							<label for="userUsername"><i >*</i>用户名<strong><span id="userUsernameTip"></span></strong></label>
							<input name="userUsername" id="userUsername" type="text" required="required" />
						</div>
						<div class="field">
							<label for="userPassword"><i >*</i>密码<strong><span id="userPasswordTip"></span></strong></label>
							<input type="password" name="userPassword" id="userPassword" required="required" />
						</div>
						<div class="field">
							<label for="userRetypePassword"><i >*</i>重复密码<strong><span id="userRetypePasswordTip"></span></strong></label>
							<input type="password" name="userRetypePassword" id="userRetypePassword" required="required" />
						</div>
						<div class="field">
							<label for="userName"><i >*</i>姓名<strong><span id="userNameTip"></span></strong></label>
							<input type="text" name="userName" id="userName" required="required" />
						</div>
						<div class="field">
							<div class="select-wrapper">
								<label><i >*</i>用户类型</label>
								<select name="userType" id="userType">
									<option value="学生" selected="selected">学生</option>
									<option value="教师">教师</option>
								</select>
							</div>
						</div>

						<ul class="actions">
							<li><input type="submit" value="提交信息" onclick="return checkRegisterAll();"/></li>
							<li><input type="reset" value="重置 " /></li>
						</ul>
					</form>
				</article>
			</div>
		</div>
		<!-- BG -->
		<div id="bg"></div>
		
		<script>
		function checkRegisterUserUsername() {
			var re = /^[0-9a-zA-Z]{6,16}$/; 
			
			var userUsername = $('#userUsername').val();
			
			if (re.test(userUsername)) {
				$('#userUsername').css('color', 'white');
				$('#userUsernameTip').text('');
				if(!checkUserExist(userUsername)){
					return false;
				}
				return true;
			}
			
			$('#userUsername').css('color', 'red');
			$('#userUsernameTip').text('长度为6~16的数字/大小写字母').css('color', 'red').css('');			
			return false;
		}
		
		function checkRegisterUserPassword() {
			var re1 = /^((.+[0-9]{1,15})|([0-9]{1,15}.+)|(.+[0-9]{1,14}.+))$/;
			var re2 = /^((.+[a-z]{1,15})|([a-z]{1,15}.+)|(.+[a-z]{1,14}.+))$/;
			var re3 = /^((.+[A-Z]{1,15})|([A-Z]{1,15}.+)|(.+[A-Z]{1,14}.+))$/;
			var re4 = /^[0-9a-zA-Z]{8,16}$/;

			var count = 0;
			var userPassword = $('#userPassword').val();

			if (re1.test(userPassword)) {
				count++;
			}
			
			if (re2.test(userPassword)) {
				count++;
			}
			
			if (re3.test(userPassword)) {
				count++;
			}

			if (re4.test(userPassword) && count >= 2) {
				$('#userPassword').css('color', 'white');
				$('#userPasswordTip').text('');				
				return true;
			}
			
			$('#userPassword').css('color', 'red');
			$('#userPasswordTip').text('至少两种长度为8~16的数字/大小写字母').css('color', 'red');			
			return false;
		}
		
		function checkRegisterUserRetypePassword() {
			var userPassword = $('#userPassword').val();
			var userRetypePassword = $('#userRetypePassword').val();
			
			if (userPassword == userRetypePassword) {
				$('#userRetypePassword').css('color', 'white');
				$('#userRetypePasswordTip').text('');
				return true;
			}
			
			$('#userRetypePassword').css('color', 'red');
			$('#userRetypePasswordTip').text('两次输入的密码不一致').css('color', 'red');
			return false;
		}
		
		function checkRegisterUserName() {
			var re = /^[\u4e00-\u9fa5]{2,4}$/;
			var userName = $('#userName').val();
			
			if (re.test(userName)) {
				$('#userName').css('color', 'white');
				$('#userNameTip').text('');
				return true;
			}
			
			$('#userName').css('color', 'red');
			$('#userNameTip').text('长度为2~4的汉字').css('color', 'red');
			return false;
		}
		
		function checkRegisterAll() {
			var check = true;

			check = (check && ($('#userUsername').val().length > 0));
			check = (check && ($('#userUsernameTip').text().length == 0));
			if (!check) {
				$('#userUsername').focus().blur().focus();
				return check;
			}
			
			check = (check && ($('#userPassword').val().length > 0));
			check = (check && ($('#userPasswordTip').text().length == 0));
			if (!check) {
				$('#userPassword').focus().blur().focus();
				return check;
			}
			
			check = (check && ($('#userRetypePassword').val().length > 0));
			check = (check && ($('#userRetypePasswordTip').text().length == 0));
			if (!check) {
				$('#userRetypePassword').focus().blur().focus();
				return check;
			}
			
			check = (check && ($('#userName').val().length > 0));
			check = (check && ($('#userNameTip').text().length == 0));
			if (!check) {
				$('#userName').focus().blur().focus();
				return check;
			}
			
			return check;
		}
		
		function checkUserExist(userUsername){

			$.ajax({
				type : "POST",
				url: "UserSer?method=check",
				data: {userUsername:userUsername},
				datatype: "text",
				success : function(msg) {
                    if("success" != msg){
                        $('#userUsername').css('color', 'red');
						$('#userUsernameTip').text(msg).css('color', 'red').css('');
						return false;
                    }
                    else{
                    	$('#userUsername').css('color', 'white');
						$('#userUsernameTip').text('');
						return true;
                    }
                }
			});
		}
		
		$(function() {
			$('#userUsername').blur(function() {
				checkRegisterUserUsername();
			});
			$('#userPassword').blur(function() {
				checkRegisterUserPassword();
			});
			$('#userRetypePassword').blur(function() {
				checkRegisterUserRetypePassword();
			});
			$('#userName').blur(function() {
				checkRegisterUserName();
			});
		});
		</script>
		<script type="text/javascript">
		$(function() {
			$(".loginButton").click(function(){				
				var userUsername = $('#LoginUsername').val();
				var userPassword = $('#LoginPassword').val();
				var rememberMe = $('#rememberMe').val();
                //alert(userUsername);
				$.ajax({
					type : "POST",
					url: "UserSer",
					data: {userUsername:userUsername,userPassword:userPassword,rememberMe:rememberMe},
					datatype: "text",
					success : function(msg) {
                        if("success" == msg){
                            location.href="home/home.jsp";
                        }else{
                            $('#msg').html(msg);
                        }
                    }
				});
			});
		});
	</script>
	<script src="js/util.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/main.js"></script>
	
	
	
  </body>  
</html>
