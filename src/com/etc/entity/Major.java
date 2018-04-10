package com.etc.entity;

// 实体类,专业

public class Major {
	
	private int majorId;
	private Department department;
	private String majorName;
	
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	
	@Override
	public String toString() {
		return "Major [majorId=" + majorId + ", department=" + department + ", majorName=" + majorName + "]";
	}
}
