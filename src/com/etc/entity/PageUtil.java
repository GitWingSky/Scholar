package com.etc.entity;

import java.util.List;

/*
 * 这是一个辅助分页类，是一个泛型类
 */

public class PageUtil<T> {
	
	private int index; // 当前页码
	private int pageSize; // 每页大小(每页记录数)
	private int totalItem; // 总记录数
	private int totalPage; // 总页数
	private List<T> list; // 当前页的记录
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalItem() {
		return totalItem;
	}
	public void setTotalItem(int totalItem) {
		this.totalItem = totalItem;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "PageUtil [index=" + index + ", pageSize=" + pageSize + ", totalItem=" + totalItem + ", totalPage="
				+ totalPage + ", list=" + list + "]";
	}
}
