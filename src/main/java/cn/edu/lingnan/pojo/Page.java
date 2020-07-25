package cn.edu.lingnan.pojo;

import java.util.List;

public class Page<T> {
	private List<T> data;
	private int pageNumber;
	private int totalRecord;
	private int pageSize;
	
	public int getIndex() {
		return (pageNumber-1)*pageSize;
	}
	
	public int getTotalPage() {
		if(totalRecord%pageSize==0) {
			return totalRecord/pageSize;
		}
		return totalRecord/pageSize+1;
	}
}
