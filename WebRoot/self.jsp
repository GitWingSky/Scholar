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
    
    <title>Scholar-${usser.userName }</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<style type="text/css">
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
				font-size: 100px;
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
				margin-left: 0.5em;
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
				</div>
			</div>
		</nav>
		<div class="container">
			<div class="selfContent">
				<div id="myTabContent" class="tab-content">
	

						<div id="selfInfo" class="about">
							<div class="col-md-4 about-left ">
								<img src="${usser.userPictureUrl }" class="img-responsive img-circle" alt="" />
							</div>
							<div class="col-md-8 about-right wthree">
								<h3>Hi, i'm <span>${usser.userName } </span>
									<c:if test="${!empty user}">
										<c:if test="${user.userId!=usser.userId }">
										<c:if test="${empty userFocusRelation}">
											<span class="m-1"><img title="关注" id="icon_friend_add_img" src="images/friend_add.png"></span>
										</c:if>
										<a data-toggle="modal" data-target="#privateMessage" class="m-1">
  	 										<img title="给我留言" id="icon_mail_img" src="images/mail.png">
  										</a>
  										</c:if>
  										</c:if>
									</h3>

								<ul class="address">
									<li>
										<ul class="agileits-address-text">
											<li><b>Profession </b></li>
											<li>${usser.userType }</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Sex</b></li>
											<li>${usser.userSex }</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text ">
											<li><b>Age </b></li>
											<li>${usser.userAge }</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Phone </b></li>
											<li>${usser.userPhone }</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>School </b></li>
											<li>${usser.userSchool }</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Address </b></li>
											<li>${usser.userAddress }</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>E-Mail </b></li>
											<li>
												<a href="mailto:${usser.userEmail }"> ${usser.userEmail }</a>
											</li>
										</ul>
									</li>
									<li>
										<ul class="agileits-address-text">
											<li><b>Birthday </b></li>
											<li>
												<fmt:formatDate value="${usser.userBirthday }" type="date" pattern="yyyy-MM-dd"/>
											</li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="about-text">
								<li><b>Introduction </b></li>
								<p style="line-height: 2em;">${usser.userIntroduction }</p>
							</div>
							<div class="about-text about address" style="margin-bottom: 1em; font-size: 1.3em;">
								<b>Lesson </b>
							</div>
							<c:forEach items="${lessonListt}" var="lessonn">
								<div class="single-member effect-3">
									<div class="member-image">
										<img src="${lessonn.lessonPictureUrl }" alt="Member">
									</div>
									<div class="member-info">
										<h4>${lessonn.lessonName }</h4>
										<h5>教师：${lessonn.teacher.userName }</h5>
										<div class="social-touch ">
											<a href="LessonSer?lessonId=${lessonn.lessonId }" class="btn">更多</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="privateMessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">Send to: ${usser.userName}</h4>
						</div>
						<div class="modal-body">
							<label for="privateMessageContent">内容<span class="required text-danger">*</span></label>
							<textarea id="privateMessageContent" class="textarea form-control" rows="5" required="" style="margin-top: 0px; margin-bottom: 0px; height: 157px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id="send">Send to</button>
							<div class="progress progress-striped active" id="text1" style="display:none; margin-top: 10px">
								<div id="text2" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
									<span id="ok" style="display:none; margin-top: 3px" class="glyphicon glyphicon-ok" aria-hidden="true"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="success">
			  	<div class="modal-dialog modal-sm" role="document">
			    	<div class="modal-content">
			    		<h4 style="text-align: center; color: green;"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>关注成功</h4>
			    	</div>
			  	</div>
			</div>
		
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
			
		
			$('#send').click(function(){
				var privateMessageContent = $('#privateMessageContent').val();
				$.ajax({
					type : "POST",
					url: "PrivateMessageSer",
					data: {targetUserId:${usser.userId },privateMessageContent:privateMessageContent,userId:${user.userId }},
					datatype: "text",
					success : function(msg) {
                         $('#text1').css('display',msg);
                         
                         var a = $('#text2').css('width');
                         for(i = 0; i < 10; i++){
                        	 setTimeout(function(){$('#text2').css('width',i * 10 + '%')},1000);
                         }
                         setTimeout(function(){$('#ok').css('display','block')},2500);
                         setTimeout(function(){$('#privateMessage').modal('toggle')},3000);
                         
                    }
				});
			});
			
			$('#icon_friend_add_img').click(function(){
				$.ajax({
					type : "POST",
					url: "FocusSer?method=add",
					data: {targetUserId:${usser.userId },userId:${user.userId }},
					datatype: "text",
					success : function(msg) {
						$('#success').modal('toggle');
						$('#icon_friend_add_img').remove();
                    }
				});
				
			});
		</script>
  </body>
</html>
