package com.tech.booksajo.login.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.booksajo.bdboard.mapper.BdboardMapper;
import com.tech.booksajo.login.mapper.LoginMapper;
import com.tech.booksajo.login.vo.SignInVO;

@Service(value="LoginService")
public class LoginServiceImpl implements LoginMapper{

	@Autowired
	LoginMapper loginmapper;
	
	@Override
	public List<Map<String, Object>> getList() {
		return loginmapper.getList();
	}

	

	@Override
	public SignInVO loginProc(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int signInProc(String id, String nick, String gender, String age, String name, String phone, String postcode,
			String addr, String email, String shpwd, String bcpwd) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public SignInVO idCheck(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public SignInVO nickCheck(String nick) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void updateMemberEmailChecked(String id) {
		// TODO Auto-generated method stub
		
	}

	
	
}