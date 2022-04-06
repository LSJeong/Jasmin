package co.jasmin.prj.member.service;



import java.sql.Date;
import lombok.Data;


@Data
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String address;
	private String tel;
	private String birth;
	private String email;
	private String author;
	private String zipCode;
	private String addressdetail;
	private Date joinDate;
	private char status;
	
	private String key;
	private String keyword;
}
