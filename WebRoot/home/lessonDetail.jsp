<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <jsp:useBean id="now" class="java.util.Date" scope="page"/>
    <title>Scholar</title>
	<link rel="stylesheet" href="css/lesson.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />

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

		<div id="wrapper">
			<!-- Nav -->
			<nav id="nav">
				<c:choose>
					<c:when test="${user.userType.equals('老师')}">
						<a href="#release" class="icon fa-book active" id="releasePanel"><span>Release</span></a>
					</c:when>
					<c:otherwise>
						<a href="#homework" class="icon fa-book active" id="homeworkPanel"><span>Homework</span></a>
					</c:otherwise>
				</c:choose>

				<a href="#classmates" class="icon fa-users" id="classmatePanel"><span>Classmates</span></a>
				<a href="#comments" class="icon fa-comments" id="commentPanel"><span>Comments</span></a>
			</nav>

			<!-- Main -->
			<div id="main">

				<c:choose>
					<c:when test="${user.userType.equals('老师')}">
						<!-- Release -->
						<article id="release" class="panel">
							<header>
								<div class="titlebg">
									<h2>课程作业</h2>
								</div>
							</header>
							<div>
								<table>
									<tr>
										<th>作业标题</th>
										<th>开始时间</th>
										<th>截止时间</th>
										<th>操作</th>
									</tr>

									<c:forEach items="${homeworkList}" var="item">
										<tr>
											<td>${item.homeworkName}</td>
											<td>
												<fmt:formatDate value="${item.homeworkStartTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss" />
											</td>
											<td>
												<fmt:formatDate value="${item.homeworkEndTime}" type="date" pattern="yyyy-MM-dd" />
											</td>
											<td>
												<a data-parent="#release" href="#" onclick="return false;" id="showdetail${item.homeworkId}">提交详情</a>
											</td>
										</tr>
									</c:forEach>

								</table>
								<div>
									<a data-toggle="modal" data-target="#postHomework" href="#" onclick="return false;" class="btn btn-primary pull-right">发布作业</a>
								</div>
							</div>
							<div class="clearfix"></div>
							<a href="#classmates" class="jumplink">
								<span class="icon fa-chevron-right"><span>See my students</span></span>
							</a>
						</article>
					</c:when>
					<c:otherwise>
						<!-- Homework -->
						<article id="homework" class="panel">
							<header>
								<div class="titlebg">
									<h2>课程作业</h2>
								</div>
							</header>
							<div>
								<table class="table">
									<tr>
										<th>作业标题</th>
										<th>截止时间</th>
										<th>提交时间</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
										
										<c:forEach items="${studentHomeworkList}" var="shItem">
												<tr>
													<td>
														<a id="showhomework" data-toggle="modal" data-target="#homeworkModa${shItem.studentHomeworkRelationId}l">${shItem.homework.homeworkName}</a>
													</td>
													<td><fmt:formatDate value="${shItem.homework.homeworkEndTime}" type="date" pattern="yyyy-MM-dd" /></td>
													<td><fmt:formatDate value="${shItem.submitTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													<td>已提交</td>
													<td>
													<c:choose>
														<c:when test="${shItem.score > 0}"> 
															<c:choose>
																<c:when test="${shItem.score == 1}">
																	<span class="btn-success">评分：A</span>
																</c:when>
																<c:when test="${shItem.score == 2}">
																	<span class="btn-primary">评分：B</span>
																</c:when>
																<c:when test="${shItem.score == 3}">
																	<span class="btn-info">评分：C</span>
																</c:when>
																<c:when test="${shItem.score == 4}">
																	<span class="btn-warning">评分：D</span>
																</c:when>
																<c:otherwise>
																	<span class="btn-danger">评分：E</span>
																</c:otherwise>
															</c:choose>
														</c:when>

														<c:otherwise>
															<c:choose>
																<c:when test="${now>shItem.homework.homeworkEndTime}">
																	<p>已截止</p>
																</c:when>
																<c:otherwise>
																	<form action="UploadHandleServlet" method="post" enctype="multipart/form-data">
																		<input type="hidden" name="lessonId" value="${shItem.homework.lesson.lessonId}">
																		<input type="hidden" name="homeworkId" value="${shItem.homework.homeworkId}">
																		<input type="file" name="file1">
																		<input type="submit" value="修改" class="btn btn-primary">
																	</form>
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
														
													</td>
												</tr>								
										</c:forEach>
										<c:forEach items="${studentHomeworkNotList}" var="shnItem">
											<tr>
												<td>
													<a data-toggle="modal" data-target="#homeworkModal${shnItem.homeworkId}">${shnItem.homeworkName}</a>
												</td>
												<td><fmt:formatDate value="${shnItem.homeworkStartTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td>\</td>
												<td>未提交</td>
												<td>
												<c:choose>
													<c:when test="${now>shnItem.homeworkEndTime}">
														<p>已截止</p>
													</c:when>
													<c:otherwise>
														<form action="UploadHandleServlet" method="post" enctype="multipart/form-data">
														<input type="hidden" name="lessonId" value="${shnItem.lesson.lessonId}">
														<input type="hidden" name="homeworkId" value="${shnItem.homeworkId}">
														<input type="file" name="file1">
														<input type="submit" value="提交" class="btn btn-primary">
													</form>
													</c:otherwise>
												</c:choose>
													
												</td>
											</tr>
									</c:forEach>
										
								</table>
							</div>
							<a href="#classmates" class="jumplink">
								<span class="icon fa-chevron-right"><span>See my classmates</span></span>
							</a>
						</article>
					</c:otherwise>
				</c:choose>

				<!-- Classmate -->
				<article id="classmates" class="panel">
					<header>
						<h2>班级信息</h2>
					</header>

					<table>
						<tr>
							<th>序号</th>
							<th>姓名</th>
							<th>邮箱</th>
						</tr>

						<c:forEach items="${studentLessonRelationList}" var="item" varStatus="itemStatus">
							<tr>
								<td>${itemStatus.index + 1}</td>
								<td>
									<a href="SelfSer?userId=${item.student.userId}">${item.student.userName}</a>
								</td>
								<td>${item.student.userEmail}</td>
							</tr>
						</c:forEach>
					</table>

					<a href="#comments" class="jumplink">
						<span class="icon fa-chevron-right"><span>See comments</span></span>
					</a>
				</article>

				<!-- Comment -->
				<article id="comments" class="panel">
					<header>
						<h2>留言板</h2>
					</header>

					<div class="post-coments">
						<ul class="post-comments">
							<%int currentFloor = 1;%>
							<c:forEach items="${messageUtilList}" var="item">
								<%currentFloor = currentFloor + 1;%>
								<li class="leavecomment">
									<div class="comment-wrapper">
										<div class="comment-author">
											<a href="SelfSer?userId=${item.message.user.userId}"><img src="${item.message.user.userPictureUrl}" alt="not found"></a>
											<a href="SelfSer?userId=${item.message.user.userId}">${item.message.user.userName}</a>
										</div>
										<p>
											${item.message.messageContent}
										</p>
										<!-- Comment Controls -->
										<div class="comment-actions">
											<span class="comment-floor" name="comment_floor">${item.message.floor}楼</span>
											<span class="comment-date">
													<fmt:formatDate value="${item.message.messageTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
												</span>
											<a href="home/lessonDetail.jsp#comment-message" class="btn btn-micro comment-reply-btn comment-message-reply">
												<span class="comment-message-reply-userId" style="display: none;">${item.message.user.userId}</span>
												<span class="comment-message-reply-userName" style="display: none;">${item.message.user.userName}</span>
												<span class="comment-message-reply-floor" style="display: none;">${item.message.floor}</span>
												<i class="icon fa-share-square-o"></i> Reply
											</a>
										</div>
									</div>
									<div class="comment-reply" id="comment_reply">
										<div id="fiveComments">
											<ul>

												<c:forEach items="${item.replyList}" var="replyItem" varStatus="replyItemStatus">
													<c:if test="${replyItemStatus.index < 5}">
														<li>
															<div class="comment-wrapper">
																<div class="reply-author">
																	<a href="SelfSer?userId=${replyItem.user.userId}"><img src="${replyItem.user.userPictureUrl}" alt="not found"></a>
																	<a href="SelfSer?userId=${replyItem.user.userId}">${replyItem.user.userName}</a>
																	<span name="replyUser"> 回复 <a href="SelfSer?userId=${replyItem.targetUser.userId}">${replyItem.targetUser.userName}</a>：</span>
																	<span>${replyItem.messageContent}</span>
																</div>
																<!-- Comment Controls -->
																<div class="comment-actions">
																	<span class="comment-date">
																			<fmt:formatDate value="${replyItem.messageTime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/>
																		</span>
																	<a href="home/lessonDetail.jsp#comment-message" class="btn btn-micro comment-reply-btn comment-message-reply">
																		<span class="comment-message-reply-userId" style="display: none;">${replyItem.user.userId}</span>
																		<span class="comment-message-reply-userName" style="display: none;">${replyItem.user.userName}</span>
																		<span class="comment-message-reply-floor" style="display: none;">${item.message.floor}</span>
																		<i class="icon fa-share-square-o"></i> Reply
																	</a>
																</div>
															</div>
														</li>
													</c:if>
												</c:forEach>

											</ul>
										</div>

									</div>
								</li>

							</c:forEach>

							<!-- Comments Form -->
							<div>
								<form method="post" action="LessonDetailSer?method=sendMessage">
									<div>
										<input type="hidden" id="comment-message-userId" name="userId" value="${user.userId}">
										<input type="hidden" id="comment-message-lessonId" name="lessonId" value="${studentLessonRelationList[0].lesson.lessonId}">
										<input type="hidden" id="comment-message-targetUserId" name="targetUserId" value="0">
										<input type="hidden" id="comment-message-floor" name="floor" value="<%=currentFloor %>">
										<label for="comment-message">
											<i class="icon fa-comment"></i> 
											<b id="messageTypeLabel">留言：</b>
										</label>
										<textarea class="form-control" rows="5" id="comment-message" name="messageContent"></textarea>
									</div>
									<div>
										<button type="submit" class="btn btn-large pull-right buttonT">Send</button>
									</div>
									<div class="clearfix"></div>
								</form>
							</div>
							<!-- End Comment Form -->
					</div>
				</article>

				<!-- Detail -->
				<c:forEach items="${homeworkList}" var="item">
					<article id="detail${item.homeworkId}" class="panel" hidden="hidden">
					<header>
						<div class="titlebg">
							<h2>作业详情</h2>
						</div>
					</header>
						<div id="homeworkDetail">
							<table>
								<tr>
									<th>序号</th>
									<th>姓名</th>
									<th>提交时间</th>
									<th>操作</th>
								</tr>
								<%int num = 0; %>
								<c:forEach items="${studentHomeworkRelationsList}" var="shrItem">
									<c:if test="${shrItem.homework.homeworkId==item.homeworkId}">
										<%num++; %>
										<tr>
											<td><%=num %></td>
											<td>${shrItem.student.userName }</td>
											<td><fmt:formatDate value="${shrItem.submitTime }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td>
												<a href="resource/data/${item.homeworkId}/${shrItem.student.userId}.rar" id="download" download>下载</a> |
												<c:choose>
													<c:when test="${shrItem.score > 0}"> 
														<c:choose>
															<c:when test="${shrItem.score == 1}">
																<span class="btn-success">评分：A</span>
															</c:when>
															<c:when test="${shrItem.score == 2}">
																<span class="btn-primary">评分：B</span>
															</c:when>
															<c:when test="${shrItem.score == 3}">
																<span class="btn-info">评分：C</span>
															</c:when>
															<c:when test="${shrItem.score == 4}">
																<span class="btn-warning">评分：D</span>
															</c:when>
															<c:otherwise>
																<span class="btn-danger">评分：E</span>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<a data-toggle="modal" data-target="#scoreModal" class="homeworkScore">
															<span id="studentHomeworkRelationId" style="display: none;">${shrItem.studentHomeworkRelationId}</span>
															<span id="homeworkScoreSpan">评分</span>
														</a>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
						<div>
							<button class="btn btn-large pull-right buttonT" id="returnRelease${item.homeworkId}">返回</button>
						</div>
					</article>	
				</c:forEach>

			</div>
			<c:forEach items="${studentHomeworkList}" var="shItem">
				<!-- HomeworkModal(作业模态框) -->
				<div class="homeworkmodal">
					<div class="modal fade" id="homeworkModa${shItem.studentHomeworkRelationId}l" tabindex="-1" role="dialog" aria-labelledby="homeworkModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<div id="scorebutton">
										<span id="homeworkContent">
											${shItem.homework.homeworkContent}
										</span>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${studentHomeworkNotList}" var="shnItem">
			<!-- HomeworkModal(作业模态框) -->
				<div class="homeworkmodal">
					<div class="modal fade" id="homeworkModal${shnItem.homeworkId}" tabindex="-1" role="dialog" aria-labelledby="homeworkModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<div id="scorebutton">
										<span id="homeworkContent">
											${shnItem.homeworkContent}
										</span>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			

			<!-- ScoreModal(评分模态框) -->
			<div class="scoremodal">
				<div class="modal fade" id="scoreModal" tabindex="-1" role="dialog" aria-labelledby="scoreModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4>请打分</h4>
							</div>
							<div class="modal-body">
								<div id="scorebutton">
									<button class="btn btn-success buttongap" value="1">A</button>
									<button class="btn btn-primary buttongap" value="2">B</button>
									<button class="btn btn-info buttongap" value="3">C</button>
									<button class="btn btn-warning buttongap" value="4">D</button>
									<button class="btn btn-danger buttongap" id="scorebuttonE" value="5" style="border: 5px solid #9966CC;">E</button>
								</div>
							</div>
							<div class="modal-footer">
								<%--<form action="LessonDetailSer?method=score" method="post"> --%>
									<input name="studentHomeworkRelationId" id="scoreFormInputStudentHomeworkRelationId" value="0" style="display:none;">
									<input name="score" id="scoreFormInputScore" value="5" style="display:none;">
									<button type="submit" class="btn btn-primary" id="scoreFormSubmitButton">提交</button>
									<button type="button" class="btn btn-default"  id="scoreFormCloseButton" data-dismiss="modal">关闭</button>
								<%--</form> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="modal fade" id="postHomework" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="myModalLabel">发布作业</h4>
						</div>
						<form action="LessonDetailSer?method=post" method="post">
						<div class="modal-body">
							<div class="form-group">
								<label for="homeworkContent">作业名称<span class="required text-danger">*</span></label>
								<input type="text" class="form-control" name="homeworkName">
							</div>
							<div class="form-group">
								<label for="homeworkContent">内容<span class="required text-danger">*</span></label>
								<textarea name="homeworkContent" class="textarea form-control" rows="5" required="" style="margin-top: 0px; margin-bottom: 0px; height: 157px;"></textarea>
							</div>
							<input type="hidden" name="lessonId" value="${lessonIdd}"/>
							<div class="form-group">
								<label for="homeworkContent">有效天数<span class="required text-danger">*</span></label>
								<input type="text" class="form-control" name="homeworkEndTime">
							</div>
						
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="send">发布</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			

		</div>
		<!-- Scripts -->
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-viewport.min.js"></script>
		<script src="js/util.js"></script>
		<script src="js/lesson.js"></script>
		<script>
			$('#showMore').click(function() {
				$('#moreComments').slideToggle();
				$(this).toggleClass('active');
				$('#showMore').hide();
				return false;
			});
			$('#foldComments').click(function() {
				$('#moreComments').slideToggle();
				$(this).toggleClass('active');
				$('#showMore').show();
				return false;
			})
			$('#homeworkPanel').click(function() {
				$('#detail').hide();
				$('#homework').show();
			});
			$('#classmatePanel').click(function() {
				$("#detail").hide();
				$("#classmates").show();
			});
			$('#commentPanel').click(function() {
				$('#detail').hide();
				$('#comments').show();
			});
			
			<c:forEach items="${homeworkList}" var="item">
				$('#returnRelease${item.homeworkId}').click(function() {
					$("#release").show();
					$("#detail${item.homeworkId}").hide();
				});
	
				$('#showdetail${item.homeworkId}').click(function() {
					$("#release").hide();
					$("#detail${item.homeworkId}").show();
				});
			</c:forEach>
			
			$('.comment-message-reply').click(function(){
				$('#comment-message-targetUserId').val($(this).children('span.comment-message-reply-userId').text());
				$('#comment-message-floor').val($(this).children('span.comment-message-reply-floor').text());
				$('#messageTypeLabel').text('回复 '+ $(this).children('span.comment-message-reply-floor').text() + ' 楼 ' + $(this).children('span.comment-message-reply-userName').text() + '：').css('color', 'red');
			});
			
			$('#messageTypeLabel').click(function(){
				$('#comment-message-targetUserId').val(0);
				$('#comment-message-floor').val(<%=currentFloor %>);
				$('#messageTypeLabel').text('留言：').css('color', 'black');
			});
			
			$('.homeworkScore').click(function(){
				var studentHomeworkRelationId = $(this).children('span#studentHomeworkRelationId').text();
				$('#scoreFormInputStudentHomeworkRelationId').val(studentHomeworkRelationId);
				
				$('#scorebutton>button').css("border", "0px");
				$('#scorebuttonE').css("border", "5px solid #9966CC");
				$('#scoreFormInputScore').val(5);
				
				$(this).children('span#homeworkScoreSpan').addClass('currentScore');
			})
			
			$('#scorebutton>button').click(function(){
				$('#scorebutton>button').css("border", "0px");
				$(this).css("border", "5px solid #9966CC");
				
				$('#scoreFormInputScore').val($(this).val());
			});
			
			$('#scoreFormCloseButton').click(function(){
				$('.currentScore').removeClass('currentScore');
			})
			
			$('#scoreFormSubmitButton').click(function(){
				var studentHomeworkRelationId = $('#scoreFormInputStudentHomeworkRelationId').val();
				var score = $('#scoreFormInputScore').val();
				$.ajax({
					type:"POST",
					url:"LessonDetailSer",
					data:{
						method:'score',
						studentHomeworkRelationId:studentHomeworkRelationId,
						score:score
					},
					dataType:"text",
					success:function() {
						if(score == 1) {
							$('.currentScore').text('评分：A').addClass('btn-success');
						} else if(score == 2) {
							$('.currentScore').text('评分：B').addClass('btn-primary');
						} else if(score == 3) {
							$('.currentScore').text('评分：C').addClass('btn-info');
						} else if(score == 4) {
							$('.currentScore').text('评分：D').addClass('btn-warning');
						} else {
							$('.currentScore').text('评分：E').addClass('btn-danger');
						}
						
						$('#scoreFormCloseButton').trigger('click');
					}
				})
			})
		</script>
  </body>
</html>
