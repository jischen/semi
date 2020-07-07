package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDto {

	private int member_no;
	private String member_id, member_pw, member_name, post, base_addr, extra_addr, member_birth, 
	member_phone, grade, member_join, member_login;

	public MemberDto(ResultSet rs) throws SQLException{
		this.setMember_no(rs.getInt("member_no"));
		this.setMember_id(rs.getString("member_id"));
		this.setMember_name(rs.getString("member_name"));
		this.setMember_pw(rs.getString("member_pw"));
		this.setPost(rs.getString("post"));
		this.setBase_addr(rs.getString("base_addr"));
		this.setExtra_addr(rs.getString("extra_addr"));
		this.setMember_birth(rs.getString("member_birth"));
		this.setMember_phone(rs.getString("member_phone"));
		this.setGrade(rs.getString("grade"));
		this.setMember_join(rs.getString("member_join"));
		this.setMember_login(rs.getString("member_login"));	
	}
	
	public MemberDto() {
	}
	
	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getBase_addr() {
		return base_addr;
	}

	public void setBase_addr(String base_addr) {
		this.base_addr = base_addr;
	}

	public String getExtra_addr() {
		return extra_addr;
	}

	public void setExtra_addr(String extra_addr) {
		this.extra_addr = extra_addr;
	}

	public String getMember_birth() {
		return member_birth;
	}
	//member_birth에서 시각을 제외하고 보고 싶을 때 사용할 getter 추가
	public String getMember_birthday() {
		return member_birth.substring(0, 10);
	}
	//Y년 M월 D일 형식으로 나올 수 있도록 getter 추가
	public String getMember_birthdayFormat() throws ParseException {
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//읽어올 형식
		Date d = s.parse(member_birth);//s라는 형식으로 member_birth를 읽어서 날짜화 시켜라
		SimpleDateFormat f = new SimpleDateFormat("y년 M월 d일");//변환할 형식
		return f.format(d);//f를 이용해서 d를 변환하여 반환하라!
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMember_join() {
		return member_join;
	}

	public void setMember_join(String member_join) {
		this.member_join = member_join;
	}

	public String getMember_login() {
		return member_login;
	}

	public void setMember_login(String member_login) {
		this.member_login = member_login;
	}
	
	
}
