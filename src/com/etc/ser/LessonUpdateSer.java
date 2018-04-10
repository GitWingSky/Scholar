package com.etc.ser;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.etc.biz.LessonBiz;
import com.etc.biz.MajorBiz;
import com.etc.biz.UserBiz;
import com.etc.entity.Lesson;

public class LessonUpdateSer extends HttpServlet {

	public static UserBiz userBiz = new UserBiz();
	public static LessonBiz lessonBiz = new LessonBiz();
	public static MajorBiz majorBiz = new MajorBiz();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response); 
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int lessonId = Integer.parseInt(request.getParameter("lessonId"));
		Lesson lesson = lessonBiz.getById(lessonId);
		String savePath = this.getServletContext().getRealPath("/resource/lesson");
		File file = new File(savePath);
		// 判断上传文件的保存目录是否存在
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savePath + "目录不存在，需要创建");
			// 创建目录
			file.mkdir();
		}
		String lessonPictureUrl=null;
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			if (!ServletFileUpload.isMultipartContent(request)) {
				return;
			}
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("UTF-8");
					if(name.equals("lessonName")){
						lesson.setLessonName(value);
					}else if(name.equals("majorId")){
						lesson.setMajor(majorBiz.getById(Integer.parseInt(value)));
					}else if(name.equals("lessonIntroduction")){
						lesson.setLessonIntroduction(value);
					}else if(name.equals("lessonAnnouncement")){
						lesson.setLessonAnnouncement(value);
					}
				}else{
					String filename = item.getName();
					String reg="(?i).+?\\.(jpg|gif|bmp)";
					if(filename.matches(reg)){
						if (filename == null || filename.trim().equals("")) {
							continue;
						}
						filename = filename.substring(filename.lastIndexOf("\\") + 1);
						String realname = filename.substring(filename.indexOf("."));
						InputStream in = item.getInputStream();
						lessonPictureUrl= "resource/lesson/" + lessonId + realname;
						lesson.setLessonPictureUrl(lessonPictureUrl);
						FileOutputStream out = new FileOutputStream(savePath + "\\" + lessonId + realname);
						byte buffer[] = new byte[2048];
						int len = 0;
						while ((len = in.read(buffer)) > 0) {
							out.write(buffer, 0, len);
						}
						System.out.println("用户更新成功!");
						in.close();
						out.close();
						item.delete();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		lessonBiz.update(lesson);
		response.sendRedirect("LessonSer?lessonId=" + lessonId);
	}

}
