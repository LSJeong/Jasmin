package co.jasmin.prj.admin.notice.service;

import lombok.Data;

@Data
public class ANoticeVO {
	private int no;
	private String title;
	private String content;
	private String wdate;
	private String name;
	private int cnt;

}