<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Scholar-${lesson.lessonName}</title>
    
	<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/styles.css">
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<style type="text/css">
			.about-left img {
				width: 270px;
				height: 180px;
				border: 5px solid #1dadd3;
				padding: 10px;
			}
			
			.file {
				position: relative;
				margin-top: 15px;
				margin-left: 30%;
			}
			
			.file input {
				position: absolute;
				font-size: 18px;
				right: 0;
				top: 0;
				opacity: 0;
			}
			
			@media (max-width: 991px) {
				.about-left img {
					width: 30%;
					margin: 0 auto 1em;
				}
			}
			
			li {
				list-style-type: none;
			}
			
			.about h3 {
				color: #fff;
			}
			
			.member-info h3 {
				color: black;
			}
			
			.about b {
				color: #a5a5a5;
			}
			
			.about h3 span {
				color: #f3286c;
			}
			
			.address {
				margin-top: 1.5em;
				border-top: 1px dashed #1d7288;
				padding-top: 0.5em;
			}
			
			ul.address li ul.agileits-address-text li {
				display: inline-block;
				margin-top: 1em;
			}
			
			ul.address li ul.agileits-address-text li:nth-child(1) {
				width: 20%;
			}
			
			.about-text {
				padding: 1em 3em 0;
			}
			
			.active1 {
				height: 600px;
			}
			
			.list-group-item {
				background-color: rgba(255, 255, 255, 0.5);
			}
			
			.panel {
				background-color: rgba(255, 255, 255, 0.5);
			}
			
			.red {
				background-color: rgba(241, 49, 109, 0.16);
			}
			
			.category1 {
				height: 44px;
				padding-bottom: 30px;
				border-bottom: 1px solid #eee;
				background-image: url(img/CourseIntroduction.png);
				background-repeat: no-repeat;
				background-position: left;
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
						<c:choose>
							<c:when test="${!empty user}">
								<li>
									<a href="UserSer?method=logout">注销<span class="sr-only">(current)</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="index.jsp">登陆<span class="sr-only">(current)</span></a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:if test="${!empty user}">
							<li>
								<a href="home/home.jsp">主页<span class="sr-only">(current)</span></a>
							</li>
						</c:if>
						<li>
							<a href="search.jsp" target="view_window">搜索<span class="sr-only">(current)</span></a>
						</li>
					</ul>
					<div class="navbar-right">
						<ul class="nav navbar-nav" role="tabpanel">
							<li role="presentation" class="active">
								<a href="#lesson-info" id="info-tab" role="tab" data-toggle="tab" aria-controls="info" aria-expanded="true">课程信息</a>
							</li>
							
							<c:if test="${!empty user}">
							<c:if test="${user.userId==lesson.teacher.userId}">
								<li role="presentation">
									<a href="#change" role="tab" id="list-tab" data-toggle="tab" aria-controls="activity">修改课程信息</a>
								</li>
							</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</nav>

		<div class="container">
			<div class="selfContent">
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="lesson-info" aria-labelledby="info-tab">

						<div id="selfInfo" class="about">
							<div class="col-md-4 about-left ">
								<img src="${lesson.lessonPictureUrl}" class="img-responsive" alt="" />
								<c:if test="${!empty user}">
								
									<c:choose>
										<c:when test="${user.userType.equals('老师') }">
											<c:if test="${user.userId == lesson.teacher.userId }">
												<a href="LessonDetailSer?lessonId=${lesson.lessonId}" class="btn btn-success btn-lg" style="margin-top: 30px; margin-left: 5%;width: 200px;">进入课程/Enter</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${!empty studentLessonRelation}">
													<a href="LessonDetailSer?lessonId=${lesson.lessonId}" class="btn btn-success btn-lg" style="margin-top: 30px; margin-left: 5%;width: 200px;">进入课程/Enter</a>
												</c:when>
												<c:otherwise>
													<a href="LessonSer?method=add&studentId=${user.userId}&lessonId=${lesson.lessonId}" class="btn btn-success btn-lg" style="margin-top: 30px; margin-left: 5%;width: 200px;">添加课程/Add</a>
												</c:otherwise>
											</c:choose>
											
										</c:otherwise>
									</c:choose>
									
								</c:if>
							</div>
							<div class="col-md-8 about-right wthree">
								<h3> <span>${lesson.lessonName} </span></h3>

								<ul class="address">
									<li>
										<ul class="agileits-address-text">
											<li><b>Teacher </b></li>
											<li>${lesson.teacher.userName}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Phone </b></li>
											<li>${lesson.teacher.userPhone}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>E-Mail </b></li>
											<li>
												<a href="mailto:${lesson.teacher.userEmail}">${lesson.teacher.userEmail}</a>
											</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Department </b></li>
											<li>${lesson.major.department.departmentName}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Major </b></li>
											<li>${lesson.major.majorName}</li>
										</ul>
									</li>

								</ul>
							</div>
							<div class="about-text">
								<li><b>Introduction </b></li>
								<p style="line-height: 2em;">${lesson.lessonIntroduction}</p>
							</div>
							<div class="about-text">
								<li><b>Announcement </b></li>
								<p style="line-height: 2em;">${lesson.lessonAnnouncement}</p>
							</div>

						</div>

					</div>
					<c:if test="${!empty user}">
					<c:if test="${user.userId==lesson.teacher.userId}">
					<div role="tabpanel" class="tab-pane fade" id="change" aria-labelledby="classInfo-tab">
						<div class="about">
						<form action="LessonUpdateSer?lessonId=${lesson.lessonId}" method="post" enctype="multipart/form-data">
							<div class="col-md-4 about-left ">
								<img src="${lesson.lessonPictureUrl}" class="img-responsive" id="img0" />
								<p class="file btn btn-primary">更改头像
									<input type="file" name="file1" id="file0" />
								</p>
							</div>
							<div class="col-md-8 about-right wthree">
								<h3>change lesson <span>Information </span>
										
									</h3>

								<ul class="address">
									<li>
										<ul class="agileits-address-text">
											<li><b>LessonName </b></li>
											<li><input type="text" value="${lesson.lessonName}" name="lessonName" /></li>
										</ul>
									</li>
									
									<li>
										<ul class="agileits-address-text">
											<li><b>Department </b></li>
											<li>
												<select class="form-control" name="departmentId" id="departmentId">
													<c:forEach items="${departmentListt}" var="departmentList">
														<c:choose>
															<c:when test="${departmentList.departmentId==lesson.major.department.departmentId}">
																<option selected="selected" value="${departmentList.departmentId}" >${departmentList.departmentName }</option>
															</c:when>
															<c:otherwise>
																<option value="${departmentList.departmentId}" >${departmentList.departmentName }</option>
															</c:otherwise>									
														</c:choose>
													</c:forEach>
												</select>
											</li>
										</ul>
									</li>
									<li style="margin-bottom: 4em">
										<ul class="agileits-address-text">
											<li><b>Major </b></li>
											<li>
												<select class="form-control" name="majorId" id="majorId">
								 					<c:forEach items="${majorListt}" var="majorList">
								 						<c:choose>
								 							<c:when test="${majorList.majorId==lesson.major.majorId}">
								 								<option selected="selected" value="${majorList.majorId}" >${majorList.majorName }</option>
								 							</c:when>
								 							<c:otherwise>
								 								<option value="${majorList.majorId}" >${majorList.majorName }</option>
								 							</c:otherwise>
								 						</c:choose>
														
													</c:forEach>
												</select>
											</li>
										</ul>
									</li>
									
								</ul>
							</div>
							<div class="about-text">
								<li><b>Introduction </b></li>
								<li><textarea name="lessonIntroduction" rows="5">${lesson.lessonIntroduction}</textarea></li>
								<p style="line-height: 2em;"></p>
							</div>
							<div class="about-text">
								<li><b>Announcement </b></li>
								<li><textarea name="lessonAnnouncement" rows="5">${lesson.lessonAnnouncement}</textarea></li>
								<p style="line-height: 2em;"></p>
							</div>
							<div class="col-sm-8"></div>
							<div class="form-group">
								<input type="submit" class="btn btn-primary col-sm-2" value="修改" />
							</div>
						</form>
						</div>
					</div>
					</c:if>
					</c:if>
				</div>
			</div>
		</div>
		</div>

		
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script>
			$("#file0").change(function() {
				if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test($('#file0').val())){
					return false;
				}
				var objUrl = getObjectURL(this.files[0]);		
				if(objUrl) {			
					$("#img0").attr("src", objUrl);
				}
			});
			
			function getObjectURL(file) {
				var url = null;
				 
				if(window.createObjectURL != undefined) { // basic  
					url = window.createObjectURL(file);
				} else if(window.URL != undefined) { // mozilla(firefox)  
					url = window.URL.createObjectURL(file);
				} else if(window.webkitURL != undefined) { // webkit or chrome  
					url = window.webkitURL.createObjectURL(file);
				}
				return url;
			}
		</script>
		<script>
			$('#departmentId').change(function(){
				var departmentId = $('#departmentId').val();
				$.ajax({
					type : "POST",
					url: "LessonSer?method=major",
					data: {departmentId:departmentId },
					datatype: "text",
					success : function(msg) {
						 $('#majorId').empty();
                         $('#majorId').append(msg);
                    }
				});
			});
		</script>
  </body>
</html>
