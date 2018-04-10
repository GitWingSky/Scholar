<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<c:choose>
			<c:when test="${sessionScope.type == null}">
				<title>学者网 - 搜索</title>
			</c:when>
			<c:when test="${sessionScope.type.equals('Lesson')}">
				<title>学者网 - 搜索课程 - "${sessionScope.searchString}"</title>
			</c:when>
			<c:when test="${sessionScope.type.equals('User')}">
				<title>学者网 - 搜索用户 - "${sessionScope.searchString}"</title>
			</c:when>
		</c:choose>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" href="css/bootstrap.min.css">

		<style>
			.address {
				margin-top: 4em;
				border-top: 1px dashed #1d7288;
				padding-top: 2em;
			}
			
			.content {
				margin-top: 100px;
			}
			
			body {
				background: #F2F2F2;
				color: #444;
				font: 14px "Microsoft YaHei", Helvetica, Arial, Lucida Grande, Tahoma, sans-serif;
				line-height: 180%;
			}
			
			.media-body h2 {
				overflow: hidden;
				height: 30px;
				color: #333;
				font-weight: 700;
				font-size: 18px;
				line-height: 30px;
				font-weight: normal;
			}
			
			.border_gray {
				margin-bottom: 15px;
				border: 1px solid #e5e5e5;
				background: #fff;
			}
			
			.media {
				margin-top: 0;
				padding: 20px 15px;
				border-bottom: 1px dashed #ddd;
			}
			
			.m {
				float: left;
			}
			
			.date {
				float: right;
				color: #a9a9a9;
				font-size: 14px;
			}
			
			.archive-content {
				overflow: hidden;
				margin-top: 8px;
				height: 120px;
				color: #656565;
				font-size: 14px;
				line-height: 25px;
			}
			
			.mimg {
				width: 270px;
				height: 180px;
				margin-right: 10px;
				border-radius: 9px;
				-webkit-border-radius: 9px;
				-moz-border-radius: 9px;
			}
			
			.media:hover {
				-webkit-transform: scale(1);
				-moz-transform: scale(1);
				transform: scale(1);
				-moz-box-shadow: 0 3px 10px #888;
				-webkit-box-shadow: 0 3px 10px #888;
				-webkit-transition: .3s;
				-moz-transition: .3s;
				-o-transition: .3s;
				-ms-transition: .3s;
			}
			
			.image-light:after {
				content: '';
				position: absolute;
				/*相对父级绝对定位*/
				width: 80px;
				height: 100%;
				top: 0;
				left: -200px;
				/*起始位置*/
				overflow: hidden;
				z-index: 9;
				/*背景渐变（兼容性写法）*/
				background: -moz-linear-gradient(left, rgba(255, 255, 255, 0) 0, rgba(255, 255, 255, .3) 50%, rgba(255, 255, 255, 0) 100%);
				background: -webkit-gradient(linear, left top, right top, color-stop(0%, rgba(255, 255, 255, 0)), color-stop(50%, rgba(255, 255, 255, .3)), color-stop(100%, rgba(255, 255, 255, 0)));
				background: -webkit-linear-gradient(left, rgba(255, 255, 255, 0) 0, rgba(255, 255, 255, .3) 50%, rgba(255, 255, 255, 0) 100%);
				background: -o-linear-gradient(left, rgba(255, 255, 255, 0) 0, rgba(255, 255, 255, .3)50%, rgba(255, 255, 255, 0) 100%);
				background: linear-gradient(left, rgba(255, 255, 255, 0) 0, rgba(255, 255, 255, .3) 50%, rgba(255, 255, 255, 0) 100%);
				-webkit-transform: skewX(-25deg);
				/*倾斜*/
				-moz-transform: skewX(-25deg);
				transform: skewX(-25deg);
			}
			/*鼠标滑过*/
			
			.image-light:hover:after {
				-webkit-transition: left 1s ease-in-out;
				/*过渡*/
				transition: left 1s ease-in-out;
				left: 500px;
				/*结束位置*/
			}
			
			.content img {
				vertical-align: middle;
			}
		</style>

	</head>

	<body>

		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
			<div class="container">
				<!-- 导航栏 -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                  		<span class="sr-only">Toggle navigation</span>
                  		<span class="icon-bar"></span>
                  		<span class="icon-bar"></span>
                  		<span class="icon-bar"></span>
                	</button>
					<a class="navbar-brand" href="#">學者網</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							<a href="home/home.jsp">主页<span class="sr-only">(current)</span></a>
						</li>

					</ul>

				</div>
			</div>
		</nav>

		<div class="container">

			<div class="content">
				<a href="SearchSer">
					<img src="images/scholat_scholar.png">
				</a>
				<form class="form-group" action="SearchSer" method="post">
					<div class="input-group col-xs-12">
						<div class="input-group-btn">
							<select name="type" class="form-control" style="width: auto;">
								<c:choose>
									<c:when test="${sessionScope.type.equals('Lesson')}">
										<option value="Lesson" selected="selected">课程</option>
									</c:when>
									<c:otherwise>
										<option value="Lesson">课程</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sessionScope.type.equals('User')}">
										<option value="User" selected="selected">用户</option>
									</c:when>
									<c:otherwise>
										<option value="User">用户</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
						<div class="input-group-btn">
							<select name="pageSize" class="form-control" style="width: auto;">
								<c:choose>
									<c:when test="${sessionScope.page.pageSize == 5}">
										<option value="5" selected="selected">每页显示5条</option>
									</c:when>
									<c:otherwise>
										<option value="5">每页显示5条</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sessionScope.page.pageSize == 10}">
										<option value="10" selected="selected">每页显示10条</option>
									</c:when>
									<c:otherwise>
										<option value="10">每页显示10条</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sessionScope.page.pageSize == 20}">
										<option value="20" selected="selected">每页显示20条</option>
									</c:when>
									<c:otherwise>
										<option value="20">每页显示20条</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sessionScope.page.pageSize == 50}">
										<option value="50" selected="selected">每页显示50条</option>
									</c:when>
									<c:otherwise>
										<option value="50">每页显示50条</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sessionScope.page.pageSize == 100}">
										<option value="100" selected="selected">每页显示100条</option>
									</c:when>
									<c:otherwise>
										<option value="100">每页显示100条</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
						<input type="text" name="searchString" id="searchString" class="form-control" placeholder="请您输入关键词">
						<span class="input-group-btn">  
            				<input class="btn btn-primary" type="submit" value="Go">Go</input>  
        				</span>
					</div>
				</form>
			</div>
			<div class="address"></div>

			<div class="border_gray">
				<c:if test="${sessionScope.page != null && page.totalItem >= 1}">
					<c:forEach items="${sessionScope.page.list}" var="item">
						<div class="media image-light">

							<c:choose>
								<c:when test="${sessionScope.type.equals('Lesson')}">
									<a class="media-left media-middle m" href="LessonSer?lessonId=${item.lessonId}">
										<!-- <img class="mimg" src="images/lesson.jpg" alt="">  -->
										<img class="mimg" src="${item.lessonPictureUrl}" alt="">
									</a>
								</c:when>
								<c:when test="${sessionScope.type.equals('User')}">
									<a class="media-left media-middle m" href="SelfSer?userId=${item.userId}">
										<!-- <img class="mimg" src="images/lesson.jpg" alt="">  -->
										<img class="mimg" src="${item.userPictureUrl}" alt="">
									</a>
								</c:when>
							</c:choose>

							<div class="media-body">
								<h2 class="media-heading">
		                    		<c:choose>
		                    			<c:when test="${sessionScope.type.equals('Lesson')}">
		                    				<a href="LessonSer?lessonId=${item.lessonId}">${item.lessonName}</a>
		                    			</c:when>
		                    			<c:when test="${sessionScope.type.equals('User')}">
		                    				<a href="SelfSer?userId=${item.userId}">${item.userName}</a>
		                    			</c:when>
		                    		</c:choose>
		                		</h2>
								<div class="archive-content">
									<c:choose>
										<c:when test="${sessionScope.type.equals('Lesson')}">
											${item.lessonIntroduction}
										</c:when>
										<c:when test="${sessionScope.type.equals('User')}">
											${item.userIntroduction}
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<c:if test="${sessionScope.page != null && page.totalItem >= 1}">
				<ul class="pagination" style="opacity: 0.8;">

					<c:choose>
						<c:when test="${sessionScope.page.index == 1}">
							<li class="disabled">
								<a>&laquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="SearchSer?type=${sessionScope.type}&searchString=${sessionScope.searchString}&pageIndex=1&pageSize=${sessionScope.page.pageSize}">&laquo;</a>
							</li>
						</c:otherwise>
					</c:choose>

					<c:if test="${sessionScope.page.index >= 3}">
						<li>
							<a href="SearchSer?type=${sessionScope.type}&searchString=${sessionScope.searchString}&pageIndex=${sessionScope.page.index - 2}&pageSize=${sessionScope.page.pageSize}">${sessionScope.page.index - 2}</a>
						</li>
					</c:if>

					<c:if test="${sessionScope.page.index >= 2}">
						<li>
							<a href="SearchSer?type=${sessionScope.type}&searchString=${sessionScope.searchString}&pageIndex=${sessionScope.page.index - 1}&pageSize=${sessionScope.page.pageSize}">${sessionScope.page.index - 1}</a>
						</li>
					</c:if>

					<li class="active">
						<a>${sessionScope.page.index}</a>
					</li>

					<c:if test="${sessionScope.page.index < page.totalPage}">
						<li>
							<a href="SearchSer?type=${sessionScope.type}&searchString=${sessionScope.searchString}&pageIndex=${sessionScope.page.index + 1}&pageSize=${sessionScope.page.pageSize}">${sessionScope.page.index + 1}</a>
						</li>
					</c:if>

					<c:if test="${sessionScope.page.index < page.totalPage - 1}">
						<li>
							<a href="SearchSer?type=${sessionScope.type}&searchString=${sessionScope.searchString}&pageIndex=${sessionScope.page.index + 2}&pageSize=${sessionScope.page.pageSize}">${sessionScope.page.index + 2}</a>
						</li>
					</c:if>

					<c:choose>
						<c:when test="${sessionScope.page.index == page.totalPage}">
							<li class="disabled">
								<a>&raquo;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="SearchSer?type=${sessionScope.type}&searchString=${sessionScope.searchString}&pageIndex=${sessionScope.page.totalPage}&pageSize=${sessionScope.page.pageSize}">&raquo;</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</c:if>

			<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
			<script type="text/javascript" src="js/bootstrap.min.js"></script>

	</body>

</html>