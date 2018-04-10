package com.etc.ser;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;








import com.etc.biz.TimeAssistBiz;
import com.etc.biz.UserBiz;
import com.etc.entity.User;

@WebServlet("/UserUpdateSer")
public class UserUpdateSer extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
		doPost(request, response); 
	}

	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserBiz biz = new UserBiz();
		TimeAssistBiz timeAssistBiz=new TimeAssistBiz();
		//从session中获取用户对象
		User user = (User)request.getSession().getAttribute("user");
		 // 得到上传头像的保存目录，将上传的文件存放于/resource/user目录下
		String savePath = this.getServletContext().getRealPath("/resource/user");
		
		File file = new File(savePath);
		// 判断上传文件的保存目录是否存在
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savePath + "目录不存在，需要创建");
			// 创建目录
			file.mkdir();
		}
		String userPictureUrl=null;

		try {
			// 使用Apache文件上传组件处理文件上传步骤：
			// 1、创建一个DiskFileItemFactory工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 解决上传文件名的中文乱码
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request)) {
				// 按照传统方式获取数据
				return;
			}
			// 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				// 如果fileitem中封装的是普通输入项的数据
				if (item.isFormField()) {
					String name = item.getFieldName();
					// 解决普通输入项的数据的中文乱码问题
					String value = item.getString("UTF-8");
					// value = new String(value.getBytes("iso8859-1"),"UTF-8");
//					System.out.println(name + "=" + value);
					if(name.equals("userName")){
						user.setUserName(value);
					}else if(name.equals("userType")){
						user.setUserType(value);
					}else if(name.equals("userAddress")){
						user.setUserAddress(value);
					}else if(name.equals("userAge")){
						user.setUserAge(Integer.parseInt(value));
					}else if(name.equals("userBirthday")){
//						System.out.println(timeAssistBiz.getDateByString(value));
						user.setUserBirthday(timeAssistBiz.getDateByString(value));
					}else if(name.equals("userEmail")){
						user.setUserEmail(value);
					}else if(name.equals("userIntroduction")){
						user.setUserIntroduction(value);
					}else if(name.equals("userSchool")){
						user.setUserSchool(value);
					}else if(name.equals("userPhone")){
						user.setUserPhone(value);
					}else if(name.equals("userSex")){
						user.setUserSex(value);
					}
					
				} else {// 如果fileitem中封装的是上传文件
					// 得到上传的文件名称，
					
					String filename = item.getName();
//					System.out.println("1:" + filename);
//					System.out.println("2:" + filename.trim());
					String reg="(?i).+?\\.(jpg|gif|bmp)";
//					System.out.println(filename.matches(reg));
					if(filename.matches(reg)){
						if (filename == null || filename.trim().equals("")) {
							continue;
						}
						// 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：
						// c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
						// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
						filename = filename.substring(filename.lastIndexOf("\\") + 1);
						String realname = filename.substring(filename.indexOf("."));
						// 获取item中的上传文件的输入流
						InputStream in = item.getInputStream();
						userPictureUrl= "resource/user/" + user.getUserId() + realname;
//						System.out.println("3:" + userPictureUrl);
						user.setUserPictureUrl(userPictureUrl);
//						System.out.println(user);
						// 创建一个文件输出流
						FileOutputStream out = new FileOutputStream(savePath + "\\" + user.getUserId() + realname);
						// 创建一个缓冲区
						byte buffer[] = new byte[2048];
						// 判断输入流中的数据是否已经读完的标识
						int len = 0;
						// 循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
						while ((len = in.read(buffer)) > 0) {
							// 使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\"
							// + filename)当中
							out.write(buffer, 0, len);
						}
						
						System.out.println("用户更新成功!");
						// 关闭输入流
						in.close();
						// 关闭输出流
						out.close();
						// 删除处理文件上传时生成的临时文件
						item.delete();
					}
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
//
//		UserBiz biz = new UserBiz();
//		//从session中获取用户对象
//		User user = (User)request.getSession().getAttribute("user");
		
//		
//		String userName=request.getParameter("userName");
//		String userType=request.getParameter("userType");
//		String userAddress=request.getParameter("userAddress");
//		TimeAssistBiz timeAssistBiz=new TimeAssistBiz();
//		Date userBirthday=timeAssistBiz.getDateByString(request.getParameter("userBirthday"));
//		String userEmail=request.getParameter("userEmail");
//		String userIntroduction=request.getParameter("userIntroduction");
//		String userPhone=request.getParameter("userPhone");
//		String userSchool=request.getParameter("userSchool");
//		int userAge=Integer.parseInt(request.getParameter("userAge"));
//		System.out.println(userAge);
//		
		
//		user.setUserPictureUrl(userPictureUrl);
//		user.setUserName(userName);
//		user.setUserType(userType);
//		user.setUserAddress(userAddress);
//		user.setUserAge(userAge);
//		user.setUserBirthday(userBirthday);
//		user.setUserEmail(userEmail);
//		user.setUserIntroduction(userIntroduction);
//		user.setUserPhone(userPhone);
//		user.setUserSchool(userSchool);
     	biz.update(user);
//		
		
		response.sendRedirect("home/home.jsp");
		//request.setAttribute("message", message);
//		request.getRequestDispatcher("home/home.jsp").forward(request, response);
	}

}
