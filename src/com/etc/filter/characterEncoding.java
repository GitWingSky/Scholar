package com.etc.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// characterEncoding过滤器,作用范围所有路径,对所有request和response设置UTF-8编码

@WebFilter(filterName = "characterEncoding", urlPatterns = "/*")
public class characterEncoding implements Filter {

	public characterEncoding() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// 获取request和response
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;

		// 对所有request和response设置UTF-8编码
		hRequest.setCharacterEncoding("UTF-8");
		hResponse.setCharacterEncoding("UTF-8");

		// 调用下一个过滤器
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
}
