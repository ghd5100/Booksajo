package com.tech.booksajo.login.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("hyunbinl236@gmail.com","bkhfglvxfnshzftr");

		
	}
}
