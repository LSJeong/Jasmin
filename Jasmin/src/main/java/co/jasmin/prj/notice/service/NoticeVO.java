package co.jasmin.prj.notice.service;

import lombok.Data;

@Data
public class NoticeVO {
	private int no;
	private String title;
	private String content;
	private String wdate;
	private String name;
	private int cnt;
}
