package com.tech.booksajo.login.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.tech.booksajo.login.vo.SignInVO;

@MapperScan
public interface LoginMapper {

	List<Map<String, Object>> getList();
	
	public int signInProc(String id, String nick,String gender, String age, String name,
			String phone, String postcode,String addr, String email,String shpwd,
			String bcpwd);

	public SignInVO loginProc(String id, String pw);

	public SignInVO idCheck(String id);

	public SignInVO nickCheck(String nick);

	public void updateMemberEmailChecked(String id);
	
}
