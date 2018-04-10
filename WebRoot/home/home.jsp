<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
	<!--IE 8浏览器的页面渲染方式-->
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<!--默认使用极速内核：针对国内浏览器产商-->
	<meta name="renderer" content="webkit">
	<!--针对移动端的界面优化-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" >  
	<!--chrome Android 地址栏颜色-->
	<meta name="theme-color" content="#3a3f51" />
    <title>Scholar</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<style>
		.about-left img {
			width: 230px;
			height: 230px;
			border: 5px solid #1dadd3;
			-webkit-border-radius: 50%;
			-moz-border-radius: 50%;
			-o-border-radius: 50%;
			-ms-border-radius: 50%;
			border-radius: 50%;
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
			.file {
				margin-left: 43%;
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
		
		.m-1 {
			margin-left: 1em;
		}
		
		.focuss {
			float: left;
			margin: .8rem;
			background: rgba(255,255,255,0.5);
			padding: 0px 10px 10px 10px;
		}
			
			
		.col{
			float: right;
			padding-top: 10px;
		}
		
		.glyphicon{
			color: red;
		}
		
		.glyphicon:hover{
			color: white;
		}
			
		.avatar img {
			height: 100px;
			width: 100px;
			border: 1px solid #fff;
			-webkit-transition: .8s;
			-moz-transition: .8s;
			-o-transition: .8s;
			-ms-transition: .8s;
		}
			
		.avatar img:hover {
			-moz-box-shadow: 0 3px 10px #888;
			-webkit-box-shadow: 0 3px 10px #888;
			transform: rotate(720deg);
			-webkit-transform: rotate(720deg);
			-moz-transform: rotate(720deg);
			-o-transform: rotate(720deg);
			-ms-transform: rotate(720deg);
			border-radius: 35px;
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
						
						<li>
							<a href="search.jsp" target="view_window">搜索<span class="sr-only">(current)</span></a>
						</li>
						<c:if test="${user.userType.equals('老师')}">
							<li>
								<a data-toggle="modal" data-target="#createLesson">创建课程</a>
								
							</li>
						</c:if>

					</ul>
					<div class="navbar-right">
						<ul class="nav navbar-nav" role="tabpanel">
							<li role="presentation" class="active">
								<a href="#self-info" id="info-tab" role="tab" data-toggle="tab" aria-controls="info" aria-expanded="true">个人信息</a>
							</li>

							<li role="presentation">
								<a href="#activity" role="tab" id="list-tab" data-toggle="tab" aria-controls="activity">动态</a>
							</li>
							<li role="presentation">
								<a href="#change" role="tab" id="list-tab" data-toggle="tab" aria-controls="activity">修改信息</a>
							</li>
							<li role="presentation">
								<a href="#focus" role="tab" id="list-tab" data-toggle="tab" aria-controls="activity">关注</a>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</nav>

		<div class="container">
			<div class="selfContent">
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="self-info" aria-labelledby="info-tab">

						<div id="selfInfo" class="about">
							<div class="col-md-4 about-left ">
								<img src="${user.userPictureUrl}" class="img-responsive img-circle" alt="" />
							</div>
							<div class="col-md-8 about-right wthree">
								<h3>Hi, i'm <span>${user.userName } </span></h3>

								<ul class="address">
									<li>
										<ul class="agileits-address-text">
											<li><b>Profession </b></li>
											<li>${user.userType }</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Sex</b></li>
											<li>${user.userSex}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text ">
											<li><b>Age </b></li>
											<li>${user.userAge}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Phone </b></li>
											<li>${user.userPhone}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>School </b></li>
											<li>${user.userSchool}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Address </b></li>
											<li>${user.userAddress}</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>E-Mail </b></li>
											<li>
												<a href="mailto:${user.userEmail}"> ${user.userEmail}</a>
											</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Birthday </b></li>
											<li>
												<fmt:formatDate value="${user.userBirthday }" type="date" pattern="yyyy-MM-dd"/>
											</li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="about-text">
								<li><b>Introduction </b></li>
								<p style="line-height: 2em;">${user.userIntroduction}</p>
							</div>
							<div class="about-text about address" style="margin-bottom: 1em; font-size: 1.3em;">
								<b>Lesson </b>
							</div>
							
							<c:forEach items="${lessonList}" var="lesson">
							
								<div class="single-member effect-3">
									<div class="member-image">
										<img src="${lesson.lessonPictureUrl }" alt="Member">
									</div>
									<div class="member-info">
										<h4>${lesson.lessonName }</h4>
										<h5>教师：${lesson.teacher.userName }</h5>
										<div class="social-touch ">
											<a href="LessonSer?lessonId=${lesson.lessonId }" class="btn">更多</a>
										</div>
									</div>
								</div>
							</c:forEach>
							
						</div>

					</div>

					<!--课程列表Tab-->
					<div role="tabpanel" class="tab-pane fade" id="activity" aria-labelledby="classInfo-tab">
						<div class="about">
							<h3>My <span>Active </span></h3>
							<div class="address">
								<div>
									<div class="panel">
										<div class="panel-heading b-light bg-light">
											<c:forEach items="${privateMessageList}" var="privateMessage">
												<c:choose>
                 									<c:when test='${privateMessage.readed == true }'>
														<a id="privateMessage${privateMessage.privateMessageId }" data-toggle="modal" data-target="#myModal${privateMessage.privateMessageId }" class="list-group-item red"><span class="clear block m-b-none words_contents">From: <b>${privateMessage.user.userName }<br></b><small class="text-muted"><fmt:formatDate value="${privateMessage.privateMessageTime }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></small></span></a>
														<script type="text/javascript">
															$('#privateMessage${privateMessage.privateMessageId }').click(function(){
																
																$.ajax({
																	type : "POST",
																	url: "UserSer?method=read",
																	data: {privateMessageId:${privateMessage.privateMessageId }},
																	datatype: "text",
																	success : function(msg) {
												                         $('#privateMessage${privateMessage.privateMessageId }').css('background-color',msg);
												                    }
																});
															});
														</script>
													</c:when>
                									<c:otherwise>
                										<a data-toggle="modal" data-target="#myModal${privateMessage.privateMessageId }" class="list-group-item"><span class="clear block m-b-none words_contents">From: <b>${privateMessage.user.userName }<br></b><small class="text-muted"><fmt:formatDate value="${privateMessage.privateMessageTime }" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></small></span></a>
                									</c:otherwise>
              									</c:choose>
												<div class="modal fade" id="myModal${privateMessage.privateMessageId }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																<h4 class="modal-title" id="myModalLabel">From: <a href="SelfSer?userId=${privateMessage.user.userId }">${privateMessage.user.userName }</a></h4>
															</div>
															<div class="modal-body">
																${privateMessage.privateMessageContent }
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
															</div>
														</div>
													</div>
												</div>
												
											</c:forEach>
	
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="change" aria-labelledby="classInfo-tab">
						<div class="about">
						<form action="UserUpdateSer" method="post" enctype="multipart/form-data">
							<div class="col-md-4 about-left ">
								<img src="${user.userPictureUrl }" class="img-responsive img-circle" id="img0" />
								<p class="file btn btn-primary">更改头像
									<input type="file" name="file1" id="file0" />
								</p>
							</div>
							<div class="col-md-8 about-right wthree">
								<h3>change your <span>Information </span>
										
									</h3>

								<ul class="address">
									<li>
										<ul class="agileits-address-text">
											<li><b>Name </b></li>
											<li><input type="text" value="${user.userName }" name="userName" /></li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Profession </b></li>
											<li><input type="text" value="${user.userType }" name="userType" /></li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Sex</b></li>
											<li>
											 	<c:choose>
                 									<c:when test='${user.userSex.equals("男") }'>
														<label class="radio-inline" style="font-size: small;">
  															<input type="radio" name="userSex" checked="checked"  value="男" /> 男
														</label>
														<label class="radio-inline" style="font-size: small;">
  															<input type="radio" name="userSex" value="女" /> 女
														</label>
													</c:when>
                									<c:otherwise>
                										<label class="radio-inline" style="font-size: small;">
  															<input type="radio" name="userSex"  value="男" /> 男
														</label>
														<label class="radio-inline" style="font-size: small;">
  															<input type="radio" name="userSex" checked="checked" value="女" /> 女
														</label>
                									</c:otherwise>
              									</c:choose>
											</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text ">
											<li><b>Age </b></li>
											<li><input type="text" value="${user.userAge }" name="userAge" /></li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Phone </b></li>
											<li><input type="text" value="${user.userPhone }" name="userPhone" /></li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>School </b></li>
											<li><input type="text" value="${user.userSchool }" name="userSchool" /></li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Address </b></li>
											<li><input type="text" value="${user.userAddress }" name="userAddress" /></li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>E-Mail </b></li>
											<li>
												<input type="text" value="${user.userEmail }" name="userEmail" />
												
											</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Birthday </b></li>
											<li>
												<input type="text" value="<fmt:formatDate value="${user.userBirthday }" type="date" pattern="yyyy-MM-dd"/>" name="userBirthday" />
												
											</li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="about-text">
								<li><b>Introduction </b></li>
								<li><textarea name="userIntroduction" rows="5">${user.userIntroduction }</textarea></li>
								<p style="line-height: 2em;"></p>
							</div>
							<div class="col-sm-8"></div>
							<div class="form-group">
								<input type="submit" class="btn btn-primary col-sm-2" value="修改" />
							</div>
						</form>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="focus" aria-labelledby="classInfo-tab">
						<div class="about">
							<h3>Focus <span>Person </span></h3>
							<div class="address">
								<c:forEach items="${focusList}" var="focusList">
									<div class="focuss" id="focus${focusList.targetUser.userId }">
										<span id="deleteFocus${focusList.targetUser.userId }" title="取消关注" class="glyphicon glyphicon-remove col" aria-hidden="true" ></span>
										<div class="founame">
											<h4><a href="SelfSer?userId=${focusList.targetUser.userId }">${focusList.targetUser.userName }</a></h4>
										</div>
										<div class="avatar">
											<a href="SelfSer?userId=${focusList.targetUser.userId }">
												<img src="${focusList.targetUser.userPictureUrl }">
											</a>
										</div>
									</div>
									<script type="text/javascript">
										$('#deleteFocus${focusList.targetUser.userId }').click(function(){
											if(confirm('你确定取消  ${focusList.targetUser.userName} 的关注吗？')){
												$.ajax({
													type : "POST",
													url: "FocusSer",
													data: {userFocusRelationId:${focusList.userFocusRelationId },userId:${user.userId} },
													datatype: "text",
													success : function(msg) {
														 $('#focus${focusList.targetUser.userId }').remove();
								                        
								                    }
												});
											}
										});
									</script>
								</c:forEach>
								
							</div>
							<div style="clear:both; padding-top: 50px">
								<h3>Fans <span>Person </span></h3>
								<div class="address">
									<c:forEach items="${targetFocusList}" var="targetFocusList">
										<div class="focuss">
											<div class="founame">
												<h4><a href="SelfSer?userId=${targetFocusList.user.userId }">${targetFocusList.user.userName }</a></h4>
											</div>
											<div class="avatar">
												<a href="SelfSer?userId=${targetFocusList.user.userId }">
													<img src="${targetFocusList.user.userPictureUrl }">
												</a>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<c:if test="${user.userType.equals('老师')}">
			<div class="modal fade" id="createLesson" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">创建课程</h4>
						</div>
						<form action="LessonSer?method=createLesson" method="post">
						<div class="modal-body">
						
							<div class="form-group">
								<label for="recipient-name" class="control-label">LessonName:</label>
								<input type="text" class="form-control" name="lessonName">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">Department:</label>
								<select class="form-control" name="departmentId" id="departmentId">
									<c:forEach items="${departmentList}" var="departmentList">
										<option value="${departmentList.departmentId}" >${departmentList.departmentName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">Major:</label>
								<select class="form-control" name="majorId" id="majorId">
								 	<c:forEach items="${majorList}" var="majorList">
										<option value="${majorList.majorId}" >${majorList.majorName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">LessonIntroduction:</label>
								<textarea class="form-control" rows="3" name="lessonIntroduction"></textarea>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">LessonAnnouncement:</label>
								<textarea class="form-control" rows="3" name="lessonAnnouncement"></textarea>
							</div>
						</div>
						<input type="hidden" value="${user.userId }" name="teacherId" />
						<div class="modal-footer">
							
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary" value="Create" />
						</div>
						</form>
					</div>
				</div>
			</div>
		</c:if>
		<script type="text/javascript" src="js/responsiveslides.min.js"></script>
		
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
				$('.dropdown-menu a').click(function() {
					var href = $(this).attr('href');
					$('#tab-list a[href="' + href + '"]').tab('show');
				});
			});
		</script>
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
